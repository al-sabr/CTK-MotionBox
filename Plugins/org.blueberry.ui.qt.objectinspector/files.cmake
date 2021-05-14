set(SRC_CPP_FILES

)

set(INTERNAL_CPP_FILES
  berryObjectBrowserView.cpp
  berryObjectItem.cpp
  berryPluginActivator.cpp
  berryQtObjectTableModel.cpp
)

set(PLUGIN_UI_FORMS
  src/internal/berryQtObjectBrowserView.ui
)

set(PLUGIN_MOC_SRCS
  src/internal/berryObjectBrowserView.h
  src/internal/berryPluginActivator.h
  src/internal/berryQtObjectTableModel.h
)

set(PLUGIN_CACHED_RESOURCE_FILES
  plugin.xml
  resources/ObjectBrowser.png
)

set(PLUGIN_resources
  resources/blueberry_ui_qt_objectinspector.qrc
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})