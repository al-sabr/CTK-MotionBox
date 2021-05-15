set(SRC_CPP_FILES
  QmitkExtActionBarAdvisor.cpp
  QmitkExtWorkbenchWindowAdvisor.cpp
  QmitkExtFileSaveProjectAction.cpp
  QmitkOpenDicomEditorAction.cpp
  QmitkOpenMxNMultiWidgetEditorAction.cpp
  QmitkOpenStdMultiWidgetEditorAction.cpp
)

set(INTERNAL_CPP_FILES
  QmitkAboutHandler.cpp
  QmitkAppInstancesPreferencePage.cpp
  QmitkExternalProgramsPreferencePage.cpp
  QmitkCommonExtPlugin.cpp
  QmitkInputDevicesPrefPage.cpp
  QmitkModuleView.cpp
)

set(PLUGIN_UI_FORMS
  src/internal/QmitkAppInstancesPreferencePage.ui
  src/internal/QmitkExternalProgramsPreferencePage.ui
)

set(PLUGIN_MOC_SRCS
  include/QmitkExtFileSaveProjectAction.h
  include/QmitkExtWorkbenchWindowAdvisor.h

  include/internal/QmitkAboutHandler.h
  include/internal/QmitkAppInstancesPreferencePage.h
  include/internal/QmitkExternalProgramsPreferencePage.h
  include/internal/QmitkCommonExtPlugin.h
  include/internal/QmitkExtWorkbenchWindowAdvisorHack.h
  include/internal/QmitkInputDevicesPrefPage.h
  include/internal/QmitkModuleView.h
  include/QmitkOpenDicomEditorAction.h
  include/QmitkOpenMxNMultiWidgetEditorAction.h
  include/QmitkOpenStdMultiWidgetEditorAction.h
)

set(PLUGIN_CACHED_RESOURCEFILES
# list of resource files which can be used by the plug-in
# system without loading the plug-ins shared library,
# for example the icon used in the menu and tabs for the
# plug-in views in the workbench
  plugin.xml
  resources/ModuleView.png
)

set(PLUGIN_resources
# uncomment the following line if you want to use Qt resources
 resources/org_mitk_gui_qt_ext.qrc
 resources/org_mitk_icons.qrc
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})

set(PLUGIN_SRCS ${CPP_FILES})