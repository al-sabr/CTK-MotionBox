project(CTKmitkCore)

include(files.cmake)
include(mitkImports.cmake)

if(MSVC_VERSION)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /bigobj /MP")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj /MP")
endif()

configure_file(${CMAKE_SOURCE_DIR}/CMake/mitkVersion.h.in ${PROJECT_BINARY_DIR}/mitkVersion.h)

set(KIT_export_directive "MITK_CORE_EXPORT")
# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'

#find_package(ITK COMPONENTS ITKInternal REQUIRED) 

set(KIT_target_libraries)

# ---------------- Configure files -----------------

configure_file(${CTK_SOURCE_DIR}/CMake/mitkConfig.h.in ${CTK_BINARY_DIR}/mitkConfig.h)
configure_file(${CTK_SOURCE_DIR}/CMake/MITKConfig.cmake.in ${CTK_BINARY_DIR}/MITKConfig.cmake @ONLY)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  RESOURCES ${KIT_RESOURCEFILES}
  TARGET_LIBRARIES ${KIT_target_libraries}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
  EXPORT_HEADER_NAME "MitkCoreExports"
)

include_directories(include)

# Check this link for more understanding : https://github.com/microsoft/vcpkg/issues/4481

add_definitions(-DBOOST_ALL_DYN_LINK -DBOOST_UUID_FORCE_AUTO_LINK -DBOOST_BIND_GLOBAL_PLACEHOLDERS)

if(NOT TARGET ${PROJECT_NAME})
  message(SEND_ERROR "Core target ${PROJECT_NAME} does not exist")
endif()

function(_itk_create_factory_register_manager)
  # In MITK_ITK_Config.cmake, we do *not* include ITK_USE_FILE, which
  # prevents multiple registrations/unregistrations of ITK IO factories
  # during library loading/unloading (of MITK libraries). However, we need
  # "one" place where the IO factories are registered at
  # least once. This could be the application executable, but every executable would
  # need to take care of that itself. Instead, we allow the auto registration in the
  # Mitk Core library.
  set(NO_DIRECTORY_SCOPED_ITK_COMPILE_DEFINITION 1)
  find_package(ITK)
  include(${ITK_USE_FILE})

  if(NOT ITK_NO_IO_FACTORY_REGISTER_MANAGER)
    # We manually add the define which will be of target scope. MITK
    # patches ITK_USE_FILE to remove the directory scoped compile
    # definition since it would be propagated to other targets in the
    # same directory scope but these targets might want to *not*
    # use the ITK factory manager stuff.
    target_compile_definitions(${PROJECT_NAME} PRIVATE ITK_IO_FACTORY_REGISTER_MANAGER)
  endif()
endfunction()
_itk_create_factory_register_manager()

if(BUILD_TESTING)
  add_subdirectory(TestingHelper)
  add_subdirectory(test)
endif()