/*============================================================================

The Medical Imaging Interaction Toolkit (MITK)

Copyright (c) German Cancer Research Center (DKFZ)
All rights reserved.

Use of this source code is governed by a 3-clause BSD license that can be
found in the LICENSE file.

============================================================================*/

#include "mitkGeometryClipImageFilter.h"
#include "mitkImageTimeSelector.h"
#include "mitkProperties.h"
#include "mitkTimeHelper.h"

#include "mitkImageToItk.h"

#include "itkImageRegionConstIterator.h"
#include "itkImageRegionIteratorWithIndex.h"

#include <limits>

mitk::GeometryClipImageFilter::GeometryClipImageFilter()
  : m_ClippingGeometry(nullptr),
    m_ClipPartAboveGeometry(true),
    m_OutsideValue(0),
    m_AutoOutsideValue(false),
    m_LabelBothSides(false),
    m_AutoOrientLabels(false),
    m_AboveGeometryLabel(1),
    m_BelowGeometryLabel(2)
{
  this->SetNumberOfIndexedInputs(2);
  this->SetNumberOfRequiredInputs(2);
  m_InputTimeSelector = mitk::ImageTimeSelector::New();
  m_OutputTimeSelector = mitk::ImageTimeSelector::New();
  m_ClippingGeometryData = mitk::GeometryData::New();
}

mitk::GeometryClipImageFilter::~GeometryClipImageFilter()
{
}

void mitk::GeometryClipImageFilter::SetClippingGeometry(const mitk::TimeGeometry *timeClippingGeometry)
{
  m_TimeClippingGeometry = timeClippingGeometry;
  SetClippingGeometry(timeClippingGeometry->GetGeometryForTimeStep(0));
}

void mitk::GeometryClipImageFilter::SetClippingGeometry(const mitk::BaseGeometry *aClippingGeometry)
{
  if (aClippingGeometry != m_ClippingGeometry.GetPointer())
  {
    m_ClippingGeometry = aClippingGeometry;
    m_ClippingGeometryData->SetGeometry(const_cast<mitk::BaseGeometry *>(aClippingGeometry));
    SetNthInput(1, m_ClippingGeometryData);
    Modified();
  }
}

const mitk::BaseGeometry *mitk::GeometryClipImageFilter::GetClippingGeometry() const
{
  return m_ClippingGeometry;
}

const mitk::TimeGeometry *mitk::GeometryClipImageFilter::GetClippingTimeGeometry() const
{
  return m_TimeClippingGeometry;
}

void mitk::GeometryClipImageFilter::GenerateInputRequestedRegion()
{
  Superclass::GenerateInputRequestedRegion();

  mitk::Image *output = this->GetOutput();
  mitk::Image *input = this->GetInput();
  if ((output->IsInitialized() == false) || (m_ClippingGeometry.IsNull()))
    return;

  input->SetRequestedRegionToLargestPossibleRegion();

  GenerateTimeInInputRegion(output, input);
}

void mitk::GeometryClipImageFilter::GenerateOutputInformation()
{
  mitk::Image::ConstPointer input = this->GetInput();
  mitk::Image::Pointer output = this->GetOutput();

  if ((output->IsInitialized()) && (this->GetMTime() <= m_TimeOfHeaderInitialization.GetMTime()))
    return;

  itkDebugMacro(<< "GenerateOutputInformation()");

  unsigned int i;
  auto tmpDimensions = new unsigned int[input->GetDimension()];

  for (i = 0; i < input->GetDimension(); ++i)
    tmpDimensions[i] = input->GetDimension(i);

  output->Initialize(input->GetPixelType(), input->GetDimension(), tmpDimensions, input->GetNumberOfChannels());

  delete[] tmpDimensions;

  output->SetGeometry(static_cast<mitk::BaseGeometry *>(input->GetGeometry()->Clone().GetPointer()));

  output->SetPropertyList(input->GetPropertyList()->Clone());

  m_TimeOfHeaderInitialization.Modified();
}

template <typename TPixel, unsigned int VImageDimension>
void mitk::GeometryClipImageFilter::_InternalComputeClippedImage(itk::Image<TPixel, VImageDimension> *inputItkImage,
                                                                 mitk::GeometryClipImageFilter *geometryClipper,
                                                                 const mitk::PlaneGeometry *clippingPlaneGeometry)
{
  typedef itk::Image<TPixel, VImageDimension> ItkInputImageType;
  typedef itk::Image<TPixel, VImageDimension> ItkOutputImageType;

  typedef itk::ImageRegionConstIteratorWithIndex<ItkInputImageType> ItkInputImageIteratorType;
  typedef itk::ImageRegionIteratorWithIndex<ItkOutputImageType> ItkOutputImageIteratorType;

  typename mitk::ImageToItk<ItkOutputImageType>::Pointer outputimagetoitk = mitk::ImageToItk<ItkOutputImageType>::New();
  outputimagetoitk->SetInput(geometryClipper->m_OutputTimeSelector->GetOutput());
  outputimagetoitk->Update();
  typename ItkOutputImageType::Pointer outputItkImage = outputimagetoitk->GetOutput();

  // create the iterators
  typename ItkInputImageType::RegionType inputRegionOfInterest = inputItkImage->GetLargestPossibleRegion();
  ItkInputImageIteratorType inputIt(inputItkImage, inputRegionOfInterest);
  ItkOutputImageIteratorType outputIt(outputItkImage, inputRegionOfInterest);

  typename ItkOutputImageType::PixelType outsideValue;
  if (geometryClipper->m_AutoOutsideValue)
    outsideValue = itk::NumericTraits<typename ItkOutputImageType::PixelType>::min();
  else
    outsideValue = (typename ItkOutputImageType::PixelType)geometryClipper->m_OutsideValue;

  mitk::BaseGeometry *inputGeometry = geometryClipper->m_InputTimeSelector->GetOutput()->GetGeometry();
  typedef itk::Index<VImageDimension> IndexType;
  Point3D indexPt;
  indexPt.Fill(0);
  int i, dim = IndexType::GetIndexDimension();
  Point3D pointInMM;
  bool above = geometryClipper->m_ClipPartAboveGeometry;
  bool labelBothSides = geometryClipper->GetLabelBothSides();

  if (geometryClipper->GetAutoOrientLabels())
  {
    Point3D leftMostPoint;
    leftMostPoint.Fill(std::numeric_limits<float>::min() / 2.0);
    if (clippingPlaneGeometry->IsAbove(pointInMM) != above)
    {
      // invert meaning of above --> left is always the "above" side
      above = !above;
      MITK_INFO << leftMostPoint << " is BELOW geometry. Inverting meaning of above" << std::endl;
    }
    else
      MITK_INFO << leftMostPoint << " is above geometry" << std::endl;
  }

  auto aboveLabel =
    (typename ItkOutputImageType::PixelType)geometryClipper->GetAboveGeometryLabel();
  auto belowLabel =
    (typename ItkOutputImageType::PixelType)geometryClipper->GetBelowGeometryLabel();

  for (inputIt.GoToBegin(), outputIt.GoToBegin(); !inputIt.IsAtEnd(); ++inputIt, ++outputIt)
  {
    if ((typename ItkOutputImageType::PixelType)inputIt.Get() == outsideValue)
    {
      outputIt.Set(outsideValue);
    }
    else
    {
      for (i = 0; i < dim; ++i)
        indexPt[i] = (mitk::ScalarType)inputIt.GetIndex()[i];
      inputGeometry->IndexToWorld(indexPt, pointInMM);
      if (clippingPlaneGeometry->IsAbove(pointInMM) == above)
      {
        if (labelBothSides)
          outputIt.Set(aboveLabel);
        else
          outputIt.Set(outsideValue);
      }
      else
      {
        if (labelBothSides)
          outputIt.Set(belowLabel);
        else
          outputIt.Set(inputIt.Get());
      }
    }
  }
}

#include "mitkImageAccessByItk.h"

void mitk::GeometryClipImageFilter::GenerateData()
{
  Image::ConstPointer input = this->GetInput();
  Image::Pointer output = this->GetOutput();

  if ((output->IsInitialized() == false) || (m_ClippingGeometry.IsNull()))
    return;

  const PlaneGeometry *clippingGeometryOfCurrentTimeStep = nullptr;

  if (m_TimeClippingGeometry.IsNull())
  {
    clippingGeometryOfCurrentTimeStep = dynamic_cast<const PlaneGeometry *>(m_ClippingGeometry.GetPointer());
  }
  else
  {
    clippingGeometryOfCurrentTimeStep =
      dynamic_cast<const PlaneGeometry *>(m_TimeClippingGeometry->GetGeometryForTimeStep(0).GetPointer());
  }

  if (clippingGeometryOfCurrentTimeStep == nullptr)
    return;

  m_InputTimeSelector->SetInput(input);
  m_OutputTimeSelector->SetInput(this->GetOutput());

  mitk::Image::RegionType outputRegion = output->GetRequestedRegion();
  const mitk::TimeGeometry *outputTimeGeometry = output->GetTimeGeometry();
  const mitk::TimeGeometry *inputTimeGeometry = input->GetTimeGeometry();
  ScalarType timeInMS;

  int timestep = 0;
  int tstart = outputRegion.GetIndex(3);
  int tmax = tstart + outputRegion.GetSize(3);

  int t;
  for (t = tstart; t < tmax; ++t)
  {
    timeInMS = outputTimeGeometry->TimeStepToTimePoint(t);
    timestep = inputTimeGeometry->TimePointToTimeStep(timeInMS);

    m_InputTimeSelector->SetTimeNr(timestep);
    m_InputTimeSelector->UpdateLargestPossibleRegion();
    m_OutputTimeSelector->SetTimeNr(t);
    m_OutputTimeSelector->UpdateLargestPossibleRegion();

    if (m_TimeClippingGeometry.IsNotNull())
    {
      timestep = m_TimeClippingGeometry->TimePointToTimeStep(timeInMS);
      if (m_TimeClippingGeometry->IsValidTimeStep(timestep) == false)
        continue;

      clippingGeometryOfCurrentTimeStep =
        dynamic_cast<const PlaneGeometry *>(m_TimeClippingGeometry->GetGeometryForTimeStep(timestep).GetPointer());
    }

    /*AccessByItk_2(
      m_InputTimeSelector->GetOutput(), _InternalComputeClippedImage, this, clippingGeometryOfCurrentTimeStep);*/
  }

  m_TimeOfHeaderInitialization.Modified();
}
