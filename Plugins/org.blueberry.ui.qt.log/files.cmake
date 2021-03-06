set(SRC_CPP_FILES

)

set(INTERNAL_CPP_FILES
  berryLogView.cpp
  berryQtLogPlugin.cpp
  berryQtLogView.cpp
  berryQtPlatformLogModel.cpp
)

set(CPP_FILES )

set(PLUGIN_MOC_SRCS
  src/internal/berryLogView.h
  src/internal/berryQtLogPlugin.h
  src/internal/berryQtLogView.h
  src/internal/berryQtPlatformLogModel.h
)

set(PLUGIN_CACHED_RESOURCE_FILES
  plugin.xml
  resources/logging.svg
)

set(PLUGIN_resources
  resources/org_blueberry_ui_qt_log.qrc
)

set(PLUGIN_UI_FORMS
  src/internal/berryQtLogView.ui
)

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})