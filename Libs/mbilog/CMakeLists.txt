project(CTKmbilog)

include(files.cmake)

option(MBILOG_ENABLE_DEBUG_MESSAGES "Enable extra debug log output" OFF)
mark_as_advanced(MBILOG_ENABLE_DEBUG_MESSAGES)

if(MBILOG_ENABLE_DEBUG_MESSAGES)
  set(_define_enable_debug "#define MBILOG_ENABLE_DEBUG")
endif(MBILOG_ENABLE_DEBUG_MESSAGES)

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/mbilogConfig.cmake.in"
"${CMAKE_CURRENT_BINARY_DIR}/mbilogConfig.cmake" @ONLY)

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/mbilogConfig.h.in"
"${CMAKE_CURRENT_BINARY_DIR}/mbilogConfig.h" @ONLY)

#find_package(ITK COMPONENTS ITKCommon ITKInternal REQUIRED) 

#
# See CTK/CMake/ctkMacroBuildLib.cmake for details
#

set(KIT_export_directive "MBILOG_EXPORT")

# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'
set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  GENERATE_MOC_SRCS ${KIT_GENERATE_MOC_SRCS}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
  BYPASS_REGEX TRUE
  #GENERATE_EXPORT_HEADER TRUE
  )