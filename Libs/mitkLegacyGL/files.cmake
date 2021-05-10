#We are deprecated. Please don't use us.

set(H_FILES
  mitkGLMapper2D.h
  mitkGL.h
)

set(CPP_FILES
  mitkGLMapper.cpp
  mitkVtkGLMapperWrapper.cpp
  vtkGLMapperProp.cpp
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})
