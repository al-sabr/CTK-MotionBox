project(org_mitk_gui_qt_ext)

set(PLUGIN_export_directive "MITK_QT_COMMON_EXT_EXPORT")

include(files.cmake)

# see bug-19679
set(PLUGIN_target_libraries "")

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

if(APPLE)
 list(APPEND PLUGIN_target_libraries Qt5::DBus)
endif()

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


include_directories(include/internal)
include_directories(include)

target_include_directories(${PROJECT_NAME} PUBLIC include)
target_include_directories(${PROJECT_NAME} PUBLIC include/internal)