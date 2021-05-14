project(org_blueberry_ui_qt)

set(PLUGIN_exported_include_suffixes
  src
  src/actions
  src/application
  src/commands
  src/guitk
  src/handlers
  src/intro
  src/model
  src/presentations
  src/services
  src/testing
  src/tweaklets
  src/util
)

set(PLUGIN_export_directive "BERRY_UI_QT")

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
  ${PLUGIN_exported_include_suffixes}
)