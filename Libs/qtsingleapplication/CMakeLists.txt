project(CTKqtsingleapplication)

include(files.cmake)

find_package(Qt5 COMPONENTS Core Gui Widgets Qml Network REQUIRED)
#
# See CTK/CMake/ctkMacroBuildLib.cmake for details
#

set(KIT_export_directive "CTK_QTSINGLEAPPLICATION_EXPORT")

# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'
set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

if (CTK_QT_VERSION VERSION_GREATER "4")
  list(APPEND target_libraries Qt5::Core Qt5::Gui Qt5::Network Qt5::Widgets Qt5::Qml)
endif()

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  GENERATE_MOC_SRCS ${KIT_GENERATE_MOC_SRCS}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  LIBRARY_TYPE STATIC
  )