project(org_blueberry_core_expressions)

set(PLUGIN_export_directive "BERRY_EXPRESSIONS")

include("${CMAKE_CURRENT_LIST_DIR}/files.cmake")

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  CACHED_RESOURCEFILES ${PLUGIN_CACHED_RESOURCEFILES}
  EXPORTED_INCLUDE_SUFFIXES
    src
)
