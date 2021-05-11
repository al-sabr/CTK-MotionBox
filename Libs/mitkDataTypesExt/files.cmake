file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkAffineBaseDataInteractor3D.cpp
  src/mitkAffineImageCropperInteractor.cpp
  src/mitkApplyDiffImageOperation.cpp
  src/mitkBoundingObject.cpp
  src/mitkBoundingObjectGroup.cpp
  src/mitkCellOperation.cpp
  src/mitkClippingPlaneInteractor3D.cpp
  src/mitkColorSequence.cpp
  src/mitkColorSequenceCycleH.cpp
  src/mitkColorSequenceRainbow.cpp
  src/mitkCompressedImageContainer.cpp
  src/mitkCone.cpp
  src/mitkCuboid.cpp
  src/mitkCylinder.cpp
  src/mitkDataStorageSelection.cpp
  src/mitkEllipsoid.cpp
  src/mitkGridRepresentationProperty.cpp
  src/mitkGridVolumeMapperProperty.cpp
  src/mitkLabeledImageLookupTable.cpp
  src/mitkLabeledImageVolumeCalculator.cpp
  src/mitkLineOperation.cpp
  src/mitkLookupTableSource.cpp
  src/mitkMultiStepper.cpp
  src/mitkPlane.cpp
  src/mitkSurfaceDeformationDataInteractor3D.cpp
  src/mitkUnstructuredGrid.cpp
  src/mitkUnstructuredGridSource.cpp
  src/mitkVideoSource.cpp

  src/mitkColorConversions.cpp
)

set(RESOURCE_FILES
  resource/Interactions/AffineInteraction3D.xml
  resource/Interactions/AffineMouseConfig.xml
  resource/Interactions/AffineKeyConfig.xml
  resource/Interactions/ClippingPlaneInteraction3D.xml
  resource/Interactions/ClippingPlaneTranslationConfig.xml
  resource/Interactions/ClippingPlaneRotationConfig.xml
  resource/Interactions/ClippingPlaneDeformationConfig.xml
  resource/Interactions/CropperDeformationConfig.xml
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})