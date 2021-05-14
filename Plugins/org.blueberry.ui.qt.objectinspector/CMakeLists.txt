project(org_blueberry_ui_qt_objectinspector)

set(PLUGIN_export_directive "BERRY_OBJECTINSPECTOR_EXPORT")

include("${CMAKE_CURRENT_LIST_DIR}/files.cmake")

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  UI_FORMS ${PLUGIN_UI_FORMS}
  RESOURCES ${PLUGIN_resources}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  CACHED_RESOURCEFILES ${PLUGIN_CACHED_RESOURCEFILES}
  EXPORTED_INCLUDE_SUFFIXES
    src
)

if(NOT BLUEBERRY_DEBUG_SMARTPOINTER)
  message("You should set BLUEBERRY_DEBUG_SMARTPOINTER to ON if you want the plug-in ${Plugin-SymbolicName} to be useful")
endif()