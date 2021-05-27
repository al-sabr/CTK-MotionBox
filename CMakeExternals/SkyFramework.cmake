#
# SkyFramework
#

set(proj SkyFramework)

set(${proj}_DEPENDENCIES "")

ExternalProject_Include_Dependencies(${proj}
  PROJECT_VAR proj
  DEPENDS_VAR ${proj}_DEPENDENCIES
  EP_ARGS_VAR ${proj}_EXTERNAL_PROJECT_ARGS
  USE_SYSTEM_VAR ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj}
  )

if(${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})
  unset(SkyFramework_DIR CACHE)
  find_package(SkyFramework REQUIRED NO_MODULE)
endif()

# Sanity checks
if(DEFINED SkyFramework_DIR AND NOT EXISTS ${SkyFramework_DIR})
  message(FATAL_ERROR "SkyFramework_DIR variable is defined but corresponds to non-existing directory")
endif()

if(NOT DEFINED SkyFramework_DIR AND NOT ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})

  set(revision_tag "")
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
    set(location_args GIT_REPOSITORY "${EP_GIT_PROTOCOL}://github.com/al-sabr/Sky"
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
      -DLIBVLC_LIBRARY:FILEPATH=${LIBVLC_LIBRARY}
      -DLIBVLC_RUNTIME:FILEPATH=${LIBVLC_RUNTIME}
      -DLIBVLCCORE_LIBRARY:FILEPATH=${LIBVLCCORE_LIBRARY}
      -DLIBVLCCORE_RUNTIME:FILEPATH=${LIBVLCCORE_RUNTIME}
      -DLIBVLC_INCLUDE_DIR:PATH=${LIBVLC_INCLUDE_DIR}
    DEPENDS
      ${${proj}_DEPENDENCIES}
    )
  set(SkyFramework_DIR ${CMAKE_BINARY_DIR}/${proj}-build)

else()
  ExternalProject_Add_Empty(${proj} DEPENDS ${${proj}_DEPENDENCIES})
endif()

mark_as_superbuild(
  VARS SkyFramework_DIR:PATH
  LABELS "FIND_PACKAGE"
  )
