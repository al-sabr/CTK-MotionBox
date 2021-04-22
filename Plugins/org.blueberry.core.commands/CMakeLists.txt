project(org_blueberry_core_commands)

set(PLUGIN_export_directive "BERRY_COMMANDS")

include("${CMAKE_CURRENT_LIST_DIR}/files.cmake")

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  EXPORTED_INCLUDE_SUFFIXES
    src
    src/common
    src/util
)