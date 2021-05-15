project(org_mitk_gui_common)

set(PLUGIN_export_directive "MITK_GUI_COMMON_PLUGIN")

include(files.cmake)

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  EXPORTED_INCLUDE_SUFFIXES
    src
)

