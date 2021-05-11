file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkAutoCropImageFilter.cpp
  src/mitkBoundingObjectCutter.cpp
  src/mitkBoundingObjectToSegmentationFilter.cpp
  src/mitkGeometryClipImageFilter.cpp
  src/mitkGeometryDataSource.cpp
  src/mitkHeightFieldSurfaceClipImageFilter.cpp
  src/mitkImageToUnstructuredGridFilter.cpp
  src/mitkLabeledImageToSurfaceFilter.cpp
  src/mitkMaskAndCutRoiImageFilter.cpp
  src/mitkMaskImageFilter.cpp
  src/mitkMovieGenerator.cpp
  src/mitkNonBlockingAlgorithm.cpp
  src/mitkPadImageFilter.cpp
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

if(WIN32)
  list(APPEND CPP_FILES
    src/mitkMovieGeneratorWin32.cpp
  )
endif()

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})