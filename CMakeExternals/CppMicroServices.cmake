#
# CppMicroServices
#

set(proj CppMicroServices)

set(${proj}_DEPENDENCIES "")

ExternalProject_Include_Dependencies(${proj}
  PROJECT_VAR proj
  DEPENDS_VAR ${proj}_DEPENDENCIES
  EP_ARGS_VAR ${proj}_EXTERNAL_PROJECT_ARGS
  USE_SYSTEM_VAR ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj}
  )

if(${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})
  unset(CppMicroServices_DIR CACHE)
  find_package(CppMicroServices REQUIRED NO_MODULE)
endif()

# Sanity checks
if(DEFINED CppMicroServices_DIR AND NOT EXISTS ${CppMicroServices_DIR})
  message(FATAL_ERROR "CppMicroServices_DIR variable is defined but corresponds to non-existing directory")
endif()

if(NOT DEFINED CppMicroServices_DIR AND NOT ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})

  set(revision_tag "v2.1.1")
  if(${proj}_REVISION_TAG)
    set(revision_tag ${${proj}_REVISION_TAG})
  endif()

  set(location_args )
  if(${proj}_URL)
    set(location_args URL ${${proj}_URL})
  elseif(${proj}_GIT_REPOSITORY)
    set(location_args GIT_REPOSITORY ${${proj}_GIT_REPOSITORY}
                      GIT_TAG ${revision_tag})
  else()
    set(location_args GIT_REPOSITORY "${EP_GIT_PROTOCOL}://github.com/CppMicroServices/CppMicroServices"
                      GIT_TAG ${revision_tag})
  endif()

  set(ep_project_include_arg)
  if(CTEST_USE_LAUNCHERS)
    set(ep_project_include_arg
      "-DCMAKE_PROJECT_ITK_INCLUDE:FILEPATH=${CMAKE_ROOT}/Modules/CTestUseLaunchers.cmake")
  endif()

  ExternalProject_Add(${proj}
    ${${proj}_EXTERNAL_PROJECT_ARGS}
    SOURCE_DIR ${CMAKE_BINARY_DIR}/${proj}
    BINARY_DIR ${proj}-build
    PREFIX ${proj}${ep_suffix}
    ${location_args}
    INSTALL_COMMAND ""
    CMAKE_CACHE_ARGS
      ${ep_common_cache_args}
      ${ep_project_include_arg}
    DEPENDS
      ${${proj}_DEPENDENCIES}
    )
  set(CppMicroServices_DIR ${CMAKE_BINARY_DIR}/${proj}-build)

else()
  ExternalProject_Add_Empty(${proj} DEPENDS ${${proj}_DEPENDENCIES})
endif()

mark_as_superbuild(
  VARS CppMicroServices_DIR:PATH
  LABELS "FIND_PACKAGE"
  )
