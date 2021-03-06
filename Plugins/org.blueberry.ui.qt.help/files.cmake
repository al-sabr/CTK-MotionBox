set(SRC_CPP_FILES

)

set(INTERNAL_CPP_FILES
  berryHelpContentView.cpp
  berryHelpEditor.cpp
  berryHelpEditorFindWidget.cpp
  berryHelpEditorInput.cpp
  berryHelpEditorInputFactory.cpp
  berryHelpIndexView.cpp
  berryHelpPerspective.cpp
  berryHelpPluginActivator.cpp
  berryHelpSearchView.cpp
  berryHelpTopicChooser.cpp
  berryHelpWebView.cpp

  berryQHelpEngineConfiguration.cpp
  berryQHelpEngineWrapper.cpp
)

set(CPP_FILES )

set(PLUGIN_MOC_SRCS
  src/internal/berryHelpContentView.h
  src/internal/berryHelpEditor.h
  src/internal/berryHelpEditorFindWidget.h
  src/internal/berryHelpEditorInputFactory.h
  src/internal/berryHelpIndexView.h
  src/internal/berryHelpPerspective.h
  src/internal/berryHelpPluginActivator.h
  src/internal/berryHelpSearchView.h
  src/internal/berryHelpTopicChooser.h
  src/internal/berryHelpWebView.h

  src/internal/berryQHelpEngineConfiguration.h
  src/internal/berryQHelpEngineWrapper.h
)

set(PLUGIN_CACHED_RESOURCEFILES
  plugin.xml
  resources/help.svg
  resources/helpIndex.svg
  resources/helpSearch.svg
)

set(PLUGIN_resources
  resources/org_blueberry_ui_qt_help.qrc
)

set(PLUGIN_UI_FORMS
  src/internal/berryHelpTopicChooser.ui
)

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})