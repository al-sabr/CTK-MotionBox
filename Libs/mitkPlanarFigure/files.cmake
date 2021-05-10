file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/Algorithms/mitkExtrudePlanarFigureFilter.cpp
  src/Algorithms/mitkImageToPlanarFigureFilter.cpp
  src/Algorithms/mitkPlanarFigureObjectFactory.cpp
  src/Algorithms/mitkPlanarFigureSource.cpp
  src/Algorithms/mitkPlanarFigureToPlanarFigureFilter.cpp
  src/DataManagement/mitkPlanarAngle.cpp
  src/DataManagement/mitkPlanarBezierCurve.cpp
  src/DataManagement/mitkPlanarCircle.cpp
  src/DataManagement/mitkPlanarDoubleEllipse.cpp
  src/DataManagement/mitkPlanarEllipse.cpp
  src/DataManagement/mitkPlanarCross.cpp
  src/DataManagement/mitkPlanarFigure.cpp
  src/DataManagement/mitkPlanarFourPointAngle.cpp
  src/DataManagement/mitkPlanarLine.cpp
  src/DataManagement/mitkPlanarArrow.cpp
  src/DataManagement/mitkPlanarPolygon.cpp
  src/DataManagement/mitkPlanarSubdivisionPolygon.cpp
  src/DataManagement/mitkPlanarRectangle.cpp
  src/DataManagement/mitkPlanarFigureControlPointStyleProperty.cpp
  src/Interactions/mitkPlanarFigureInteractor.cpp
  src/Rendering/mitkPlanarFigureMapper2D.cpp
  src/Rendering/mitkPlanarFigureVtkMapper3D.cpp
)

set(RESOURCE_FILES
  resource/Interactions/PlanarFigureConfig.xml
  resource/Interactions/PlanarFigureInteraction.xml
)


set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})