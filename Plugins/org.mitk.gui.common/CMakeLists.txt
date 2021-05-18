project(org_mitk_gui_common)

set(PLUGIN_export_directive "MITK_GUI_COMMON_PLUGIN")

include(files.cmake)

# usFunctionGenerateModuleInit(PLUGIN_SRCS
#                              NAME "MITK org.mitk.gui.common"
#                              LIBRARY_NAME ${PROJECT_NAME})

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

set(PLUGIN_MOC_OPTIONS "-DBOOST_NO_TEMPLATE_PARTIAL_SPECIALIZATION -DBOOST_TT_HAS_OPERATOR_HPP_INCLUDED ${_PLUGIN_MOC_OPTIONS}")

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${MOC_H_FILES}
  MOC_OPTIONS ${PLUGIN_MOC_OPTIONS}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  EXPORTED_INCLUDE_SUFFIXES
    src
)