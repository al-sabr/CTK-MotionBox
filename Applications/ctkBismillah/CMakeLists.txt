project(CTKbismillah)

set(_app_options)
set(MITK_SHOW_CONSOLE_WINDOW TRUE)
if(MITK_SHOW_CONSOLE_WINDOW)
  list(APPEND _app_options SHOW_CONSOLE)
endif()

# Create a cache entry for the provisioning file which is used to export
# the file name in the MITKConfig.cmake file. This will keep external projects
# which rely on this file happy.
set(MITK_EXTAPP_PROVISIONING_FILE "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/bismillah.provisioning" CACHE INTERNAL "bismillah provisioning file" FORCE)

# Plug-ins listed below will not be
#  - added as a build-time dependency to the executable
#  - listed in the provisioning file for the executable
#  - installed if they are external plug-ins

set(_exclude_plugins
)

set(_plugins
  org.commontk.configadmin
  org.commontk.eventadmin
  org.blueberry.core.runtime
  org.blueberry.core.commands
  org.blueberry.core.expressions
  org.blueberry.ui.qt
  org.blueberry.ui.qt.help
  org.blueberry.ui.qt.log
  org.blueberry.ui.qt.objectinspector
  # org.mitk.core.services
  # org.mitk.gui.common
  # org.mitk.core.ext
  # org.mitk.gui.qt.ext
  org.mitk.gui.qt.extapplication
)


mitkFunctionCreateBlueBerryApplication(
  NAME CTKbismillah
  DESCRIPTION "Bismillah Application Engine"
  PLUGINS ${_plugins}
  EXCLUDE_PLUGINS ${_exclude_plugins}
)

mitk_use_modules(TARGET CTKbismillah
  MODULES CTKAppUtil
)

# Add meta dependencies (e.g. on auto-load modules from depending modules)
if(TARGET ${CMAKE_PROJECT_NAME}-autoload)
  add_dependencies(CTKbismillah ${CMAKE_PROJECT_NAME}-autoload)
endif()

#Setting application icon for macOS systems
set_target_properties(CTKbismillah PROPERTIES MACOSX_BUNDLE_ICON_FILE "icon.icns")

if(APPLE)
  install(FILES "icons/icon.icns" DESTINATION "bismillah.app/Contents/Resources")
endif(APPLE)

# Add a build time dependency to legacy BlueBerry bundles.
if(MITK_MODULES_ENABLED_PLUGINS)
  add_dependencies(CTKbismillah ${MITK_MODULES_ENABLED_PLUGINS})
endif()

get_target_property(TARGET_LIBRARIES CTKbismillah LINK_LIBRARIES)
message("Libraries at start")
message(${TARGET_LIBRARIES})
LIST(REMOVE_ITEM TARGET_LIBRARIES ctkAppUtil.lib )
message("Modified libraries list")
message(${TARGET_LIBRARIES})