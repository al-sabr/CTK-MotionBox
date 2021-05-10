file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkManualPlacementAnnotationRenderer.cpp
  src/mitkColorBarAnnotation.cpp
  src/mitkLabelAnnotation3D.cpp
  src/mitkLogoAnnotation.cpp
  src/mitkLayoutAnnotationRenderer.cpp
  src/mitkScaleLegendAnnotation.cpp
  src/mitkTextAnnotation2D.cpp
  src/mitkTextAnnotation3D.cpp
  src/mitkVtkLogoRepresentation.cxx
  src/mitkVtkAnnotation.cpp
  src/mitkVtkAnnotation2D.cpp
  src/mitkVtkAnnotation3D.cpp
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})
