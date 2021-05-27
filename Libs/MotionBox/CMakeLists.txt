project(CTKMotionBox)

set(CMAKE_AUTOMOC TRUE)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(LibVLC COMPONENTS libvlc libvlccore REQUIRED)

find_package(Qt5 COMPONENTS Core Qml Quick REQUIRED)

find_package(OpenSSL COMPONENTS Crypto SSL REQUIRED)

find_package(SkyFramework COMPONENTS SkyBackend SkyCore SkyGui SkyMedia SkyTorrent REQUIRED)

include(files.cmake)

if (WIN32)
  set(EXTRAS "WinExtras")
elseif(UNIX)
  set(EXTRAS "X11Extras")
elseif(ANDROID)
  set(EXTRAS "AndroidExtras")
endif()

set(KIT_export_directive "MOTIONBOX_EXPORT")
# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'

set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

if(CTK_QT_VERSION VERSION_GREATER "4")
  list(APPEND KIT_target_libraries Qt5::Core Qt5::Quick Qt5::Qml)
endif()

list(APPEND KIT_target_libraries
  SkyFramework::SkyBackend
	SkyFramework::SkyTorrent
	SkyFramework::SkyCore
	SkyFramework::SkyGui
	SkyFramework::SkyMedia)

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
  EXPORT_HEADER_NAME "MotionBoxExports"
)

add_compile_definitions(-DSK_CORE_LIBRARY -DSK_GUI_LIBRARY -DSK_MEDIA_LIBRARY -DSK_TORRENT_LIBRARY -DSK_BACKEND_LIBRARY -DSK_CHARSET -DSK_BACKEND_LOCAL)

if(WIN32)
  add_compile_definitions(-DSK_WIN_NATIVE)
endif()

if(ANDROID)
  add_compile_definitions(-DSK_MOBILE)
else()
  add_compile_definitions(-DSK_DESKTOP)
endif()

set(includes_public
  include
  include/controllers
  include/io
  ${PROJECT_BINARY_DIR}/include
)

target_include_directories(${PROJECT_NAME} PUBLIC ${includes_public})

