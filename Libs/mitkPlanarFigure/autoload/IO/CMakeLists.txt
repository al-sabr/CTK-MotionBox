project(CTKmitkAutoloadIO)

include(files.cmake)

# if(MSVC_VERSION)
#   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /bigobj /MP")
#   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj /MP")
# endif()

set(KIT_export_directive "MITKPLANARFIGURE_EXPORT")
# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'

#find_package(ITK COMPONENTS ITKInternal REQUIRED) 

set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  RESOURCES ${KIT_RESOURCEFILES}
  TARGET_LIBRARIES ${KIT_target_libraries}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
)