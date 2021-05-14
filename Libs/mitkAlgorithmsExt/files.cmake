#file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  #src/mitkAutoCropImageFilter.cpp
  src/mitkBoundingObjectCutter.cpp
  #src/mitkBoundingObjectToSegmentationFilter.cpp
  src/mitkGeometryClipImageFilter.cpp
  src/mitkGeometryDataSource.cpp
  src/mitkHeightFieldSurfaceClipImageFilter.cpp
  src/mitkImageToUnstructuredGridFilter.cpp
  src/mitkLabeledImageToSurfaceFilter.cpp
  #src/mitkMaskAndCutRoiImageFilter.cpp
  src/mitkMaskImageFilter.cpp
  src/mitkMovieGenerator.cpp
  src/mitkNonBlockingAlgorithm.cpp
  #src/mitkPadImageFilter.cpp
  src/mitkPlaneFit.cpp
  src/mitkPlaneLandmarkProjector.cpp
  src/mitkPointLocator.cpp
  src/mitkSegmentationSink.cpp
  src/mitkSimpleHistogram.cpp
  src/mitkSimpleUnstructuredGridHistogram.cpp
  src/mitkCovarianceMatrixCalculator.cpp
  src/mitkAnisotropicIterativeClosestPointRegistration.cpp
  src/mitkWeightedPointTransform.cpp
  src/mitkAnisotropicRegistrationCommon.cpp
  src/mitkUnstructuredGridClusteringFilter.cpp
  src/mitkUnstructuredGridToUnstructuredGridFilter.cpp
  src/mitkSurfaceToPointSetFilter.cpp
  src/mitkCropTimestepsImageFilter.cpp
)

set(H_FILES
	include/itkIntelligentBinaryClosingFilter.h
	include/itkIntelligentBinaryClosingFilter.txx
	include/mitkAnisotropicIterativeClosestPointRegistration.h
	include/mitkAnisotropicRegistrationCommon.h
	#include/mitkAutoCropImageFilter.h
	include/mitkBoundingObjectCutAndCast.h
	include/mitkBoundingObjectCutAndCast.txx
	include/mitkBoundingObjectCutter.h
	include/mitkBoundingObjectCutter.txx
	#include/mitkBoundingObjectToSegmentationFilter.h
	include/mitkCovarianceMatrixCalculator.h
	include/mitkCropTimestepsImageFilter.h
	include/mitkGeometryClipImageFilter.h
	include/mitkGeometryDataSource.h
	include/mitkHeightFieldSurfaceClipImageFilter.h
	include/mitkImageToUnstructuredGridFilter.h
	include/mitkLabeledImageToSurfaceFilter.h
	#include/mitkMaskAndCutRoiImageFilter.h
	include/mitkMaskImageFilter.h
	include/mitkMovieGenerator.h
	include/mitkMovieGeneratorWin32.h
	include/mitkNonBlockingAlgorithm.h
	include/mitkNonBlockingAlgorithmEvents.h
	#include/mitkPadImageFilter.h
	include/mitkPlaneFit.h
	include/mitkPlaneLandmarkProjector.h
	include/mitkPointLocator.h
	include/mitkSegmentationSink.h
	include/mitkSimpleHistogram.h
	include/mitkSimpleUnstructuredGridHistogram.h
	include/mitkSurfaceToPointSetFilter.h
	include/mitkUnstructuredGridClusteringFilter.h
	include/mitkUnstructuredGridToUnstructuredGridFilter.h
	include/mitkWeightedPointTransform.h
)

if(WIN32)
  list(APPEND CPP_FILES
    src/mitkMovieGeneratorWin32.cpp
  )
endif()

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

list(APPEND CPP_FILES ${H_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})