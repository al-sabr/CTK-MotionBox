project(org_blueberry_core_runtime)

#find_package(Poco REQUIRED COMPONENTS Poco::Foundation Poco::Util Poco::Xml)
#find_package(Qt5 REQUIRED COMPONENTS Core Gui Xml)

set(PLUGIN_export_directive "org_blueberry_core_runtime_EXPORT")

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
    src/application
    src/dynamichelpers
    src/registry
)

#target_link_libraries(${PROJECT_NAME} PUBLIC Poco::Foundation Poco::Util Poco::XML)

if(CTK_USE_Qt5)
  target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Gui Qt5::Xml Qt5::Widget)
endif()

target_compile_definitions(${PROJECT_NAME} PUBLIC "$<$<PLATFORM_ID:Windows>:POCO_NO_UNWINDOWS;WIN32_LEAN_AND_MEAN>")
#[[]]

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/src/berryConfig.h.in" "${CMAKE_CURRENT_BINARY_DIR}/berryConfig.h" @ONLY)