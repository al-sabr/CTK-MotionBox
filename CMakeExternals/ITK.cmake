#
# ITK
#

set(proj ITK)

set(${proj}_DEPENDENCIES "")

ExternalProject_Include_Dependencies(${proj}
  PROJECT_VAR proj
  DEPENDS_VAR ${proj}_DEPENDENCIES
  EP_ARGS_VAR ${proj}_EXTERNAL_PROJECT_ARGS
  USE_SYSTEM_VAR ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj}
  )

if(${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})
  unset(ITK_DIR CACHE)
  find_package(ITK REQUIRED NO_MODULE)
endif()

# Sanity checks
if(DEFINED ITK_DIR AND NOT EXISTS ${ITK_DIR})
  message(FATAL_ERROR "ITK_DIR variable is defined but corresponds to non-existing directory")
endif()

if(NOT DEFINED ITK_DIR AND NOT ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})

  set(revision_tag "v4.13.3")
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
    set(location_args GIT_REPOSITORY "${EP_GIT_PROTOCOL}://github.com/InsightSoftwareConsortium/ITK"
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
      -DBUILD_EXAMPLES:BOOL=OFF
      -DBUILD_SHARED_LIBS:BOOL=ON
      # -DITK_USE_SYSTEM_GDCM:BOOL=ON
      # -DGDCM_DIR:PATH=${GDCM_DIR}
      # -DITK_USE_SYSTEM_HDF5:BOOL=ON
      # -DHDF5_DIR:PATH=${HDF5_DIR}
      -DITK_USE_REVIEW:BOOL=ON
      -DITK_USE_REVIEW_STATISTICS:BOOL=ON
      -DITK_USE_OPTIMIZED_REGISTRATION_METHODS:BOOL=ON
      -DITK_USE_PORTABLE_ROUND:BOOL=ON
      -DITK_USE_CENTERED_PIXEL_COORDINATES_CONSISTENTLY:BOOL=ON
      -DITK_USE_TRANSFORM_IO_FACTORIES:BOOL=ON
      -DITK_LEGACY_REMOVE:BOOL=ON
      -DITK_BUILD_DEFAULT_MODULES:BOOL=OFF
      #-DITKGroup_Core:BOOL=ON
      -DModule_IOImageBase:BOOL=ON
      -DModule_SpatialObjects:BOOL=ON
      -DModule_Statistics:BOOL=ON
      -DModule_IOBioRad:BOOL=ON
      -DModule_IOBMP:BOOL=ON
      -DModule_IOBruker:BOOL=ON
      -DModule_IOCSV:BOOL=ON
      -DModule_IOGDCM:BOOL=ON
      -DModule_IOGE:BOOL=ON
      -DModule_IOGIPL:BOOL=ON
      -DModule_IOHDF5:BOOL=ON
      -DModule_IOIPL:BOOL=ON
      -DModule_IOJPEG:BOOL=ON
      -DModule_IOLSM:BOOL=ON
      -DModule_IOMesh:BOOL=ON
      -DModule_IOMeta:BOOL=ON
      -DModule_IOMINC:BOOL=ON
      -DModule_IOMRC:BOOL=ON
      -DModule_IONIFTI:BOOL=ON
      -DModule_IONRRD:BOOL=ON
      -DModule_IOPNG:BOOL=ON
      -DModule_IOSiemens:BOOL=ON
      -DModule_IOSpatialObjects:BOOL=ON
      -DModule_IOStimulate:BOOL=ON
      -DModule_IOTIFF:BOOL=ON
      -DModule_IOTransformBase:BOOL=ON
      -DModule_IOTransformHDF5:BOOL=ON
      -DModule_IOTransformInsightLegacy:BOOL=ON
      -DModule_IOTransformMatlab:BOOL=ON
      -DModule_IOVTK:BOOL=ON
      -DModule_IOXML:BOOL=ON
      -DBUILD_TESTING:BOOL=OFF
      -DINSTALL_GTEST:BOOL=OFF
      #[ These commented options might need to be activated when compilation errors arise.
      -DGDCM_HAVE_GETTIMEOFDAY:BOOL=OFF
      -DHAVE_GETTIMEOFDAY:BOOL=OFF
      -DH5_HAVE_GETRUSAGE:BOOL=OFF
      
    DEPENDS
      ${${proj}_DEPENDENCIES}
    )
  set(ITK_DIR ${CMAKE_BINARY_DIR}/${proj}-build)

else()
  ExternalProject_Add_Empty(${proj} DEPENDS ${${proj}_DEPENDENCIES})
endif()

mark_as_superbuild(
  VARS ITK_DIR:PATH
  LABELS "FIND_PACKAGE"
  )
