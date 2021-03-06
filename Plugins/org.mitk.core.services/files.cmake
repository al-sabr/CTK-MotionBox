set(PLUGIN_MOC_SRCS
  src/internal/mitkPluginActivator.h
  src/internal/mitkDataStorageService.h
)

set(SRC_CPP_FILES
  mitkIDataStorageService.cpp
)

set(INTERNAL_CPP_FILES
  mitkPluginActivator.cpp
  mitkDataStorageReference.cpp
  mitkDataStorageService.cpp
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})