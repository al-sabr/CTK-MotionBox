set(SRC_CPP_FILES
)

set(INTERNAL_CPP_FILES
  QmitkExtApplication.cpp
  QmitkExtApplicationPlugin.cpp
  QmitkExtAppWorkbenchAdvisor.cpp
  perspectives/QmitkEditorPerspective.cpp
  perspectives/QmitkExtDefaultPerspective.cpp
  perspectives/QmitkVisualizationPerspective.cpp
)

set(PLUGIN_MOC_SRCS
  src/internal/QmitkExtApplication.h
  src/internal/QmitkExtApplicationPlugin.h
  src/internal/perspectives/QmitkEditorPerspective.h
  src/internal/perspectives/QmitkExtDefaultPerspective.h
  src/internal/perspectives/QmitkVisualizationPerspective.h
)

set(UI_FILES
)

set(PLUGIN_CACHED_RESOURCEFILES
# list of resource files which can be used by the plug-in
# system without loading the plug-ins shared library,
# for example the icon used in the menu and tabs for the
# plug-in views in the workbench
  plugin.xml
  resources/icon_research.xpm
  resources/perspectives/eye.png
  resources/perspectives/viewer_icon.png
)

set(PLUGIN_resources
resources/QmitkExtApplication.qrc
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})