project(bismillah_dummy_plugin)

include(files.cmake)

if (WIN32)
  set(extras WinExtras)
endif()

#find_package(Qt5 COMPONENTS Core Quick Qml Gui Xml Svg ${extras} REQUIRED)

#find_package(OpenSSL COMPONENTS SSL REQUIRED)

#find_package(SkyFramework COMPONENTS SkyCore SkyGui SkyMedia SkyTorrent SkyBackend REQUIRED)

set(PLUGIN_export_directive "BISMILLAH_DUMMY_EXPORT")

ctkFunctionGetTargetLibraries(PLUGIN_target_libraries)

set(Qt5_DEPS
  Qt5::Core
)

list(APPEND PLUGIN_target_libraries ${Qt5_DEPS})

ctkMacroBuildPlugin(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${PLUGIN_export_directive}
  SRCS ${PLUGIN_SRCS}
  MOC_SRCS ${PLUGIN_MOC_SRCS}
  TARGET_LIBRARIES ${PLUGIN_target_libraries}
  CACHED_RESOURCEFILES ${PLUGIN_CACHED_RESOURCEFILES}
  EXPORTED_INCLUDE_SUFFIXES
)