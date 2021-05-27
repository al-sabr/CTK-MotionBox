set(SRC_CPP_FILES
)

set(INTERNAL_CPP_FILES
  DummyActivator.cpp
  MediaPerspective.cpp
)

set(MOC_H_FILES
  src/internal/DummyActivator.h
  src/internal/MediaPerspective.h
)

set(CACHED_RESOURCE_FILES
  plugin.xml
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(CPP_FILES ${CPP_FILES} ${MOC_H_FILES})

set(PLUGIN_SRCS ${CPP_FILES})
set(PLUGIN_MOC_SRCS ${MOC_H_FILES})
set(PLUGIN_CACHED_RESOURCEFILES ${CACHED_RESOURCE_FILES})