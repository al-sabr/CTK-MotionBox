project(CTKmitkSceneSerializationBase)

include(files.cmake)

set(KIT_export_directive "MITKSCENESERIALIZATIONBASE_EXPORT")
# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'

set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  GENERATE_MOC_SRCS ${KIT_GENERATE_MOC_SRCS}
  UI_FORMS ${KIT_UI_FORMS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  RESOURCES ${KIT_resources}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
  EXPORT_HEADER_NAME "MitkSceneSerializationBaseExports"
)

include_directories(include)
target_include_directories(${PROJECT_NAME} PUBLIC include)
#add_subdirectory(test)
