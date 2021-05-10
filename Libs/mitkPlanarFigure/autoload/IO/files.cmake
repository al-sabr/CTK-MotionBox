set(H_FILES
  mitkPlanarFigureIO.h
  mitkPlanarFigureSerializer.h
)

set(CPP_FILES
  mitkPlanarFigureIOActivator.cpp
  mitkPlanarFigureIO.cpp
  mitkPlanarFigureSerializer.cpp
  mitkPlanarFigureSubclassesSerializer.cpp
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})