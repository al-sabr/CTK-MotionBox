set(MITK_CMAKE_MINIMUM_REQUIRED_VERSION 3.18)
cmake_minimum_required(VERSION ${MITK_CMAKE_MINIMUM_REQUIRED_VERSION})

if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.19 AND CMAKE_VERSION VERSION_LESS 3.19.2)
  message(FATAL_ERROR "\
CMake v${CMAKE_VERSION} is defective [1]. \
Please either downgrade to v3.18 or upgrade to at least v3.19.2.\n\
[1] https://gitlab.kitware.com/cmake/cmake/-/issues/21529")
endif()

#-----------------------------------------------------------------------------
# Policies
#-----------------------------------------------------------------------------

#[[ T28060

    https://cmake.org/cmake/help/v3.18/policy/CMP0091.html
    https://cmake.org/cmake/help/v3.18/variable/CMAKE_MSVC_RUNTIME_LIBRARY.html

    We pass CMP0091 to all external projects as command-line argument:
      -DCMAKE_POLICY_DEFAULT_CMP0091:STRING=OLD
 ]]
cmake_policy(SET CMP0091 OLD)

#-----------------------------------------------------------------------------
# Update CMake module path
#-----------------------------------------------------------------------------

set(MITK_CMAKE_DIR ${MITK_SOURCE_DIR}/CMake)

set(CMAKE_MODULE_PATH ${MITK_CMAKE_DIR})

foreach(MITK_EXTENSION_DIR ${MITK_ABSOLUTE_EXTENSION_DIRS})
  set(MITK_CMAKE_EXTENSION_DIR "${MITK_EXTENSION_DIR}/CMake")
  if(EXISTS "${MITK_CMAKE_EXTENSION_DIR}")
    list(APPEND CMAKE_MODULE_PATH "${MITK_CMAKE_EXTENSION_DIR}")
  endif()
endforeach()

#-----------------------------------------------------------------------------
# CMake function(s) and macro(s)
#-----------------------------------------------------------------------------

# Standard CMake macros
include(FeatureSummary)
include(CTest)
include(CMakeParseArguments)
include(FindPackageHandleStandardArgs)

# MITK macros
include(CMake/mitkFunctionGetGccVersion.cmake)
include(CMake/mitkFunctionCheckCompilerFlags.cmake)
include(CMake/mitkFunctionSuppressWarnings.cmake) # includes several functions

SUPPRESS_VC_DEPRECATED_WARNINGS()

#-----------------------------------------------------------------------------
# Check miminum macOS version
#-----------------------------------------------------------------------------
# The minimum supported macOS version is 10.14. If you use a version less than
# 10.14, there is no guarantee that the build still works.
if(APPLE)
  exec_program(sw_vers ARGS -productVersion OUTPUT_VARIABLE macos_version)
  if (macos_version VERSION_LESS "10.14")
    message(WARNING "Detected macOS version \"${macos_version}\" is not supported anymore. Minimum required macOS version is at least 10.14.")
  endif()
  if (CMAKE_OSX_DEPLOYMENT_TARGET AND CMAKE_OSX_DEPLOYMENT_TARGET VERSION_LESS 10.14)
    message(WARNING "Detected macOS deployment target \"${CMAKE_OSX_DEPLOYMENT_TARGET}\" is not supported anymore. Minimum required macOS version is at least 10.14.")
  endif()
endif()

#-----------------------------------------------------------------------------
# Check miminum compiler versions
#-----------------------------------------------------------------------------

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  # require at least gcc 4.9 as provided by ppa:ubuntu-toolchain-r/test for Ubuntu 14.04
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 4.9)
    message(FATAL_ERROR "GCC version must be at least 4.9
If you are using Ubuntu 14.04, you can easily install gcc and g++ 4.9 (or any later version available) in addition to your version ${CMAKE_CXX_COMPILER_VERSION}:
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  sudo apt-get update
  sudo apt-get install gcc-4.9 g++-4.9
Make sure to explicitly specify these compilers when configuring MITK:
  CMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc-4.9
  CMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++-4.9
For more information on the proposed PPA see the Toolchain Updates section of https://wiki.ubuntu.com/ToolChain.")
  endif()
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # require at least clang 3.4
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 3.4)
    message(FATAL_ERROR "Clang version must be at least 3.4")
  endif()
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
  # require at least clang 5.0
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.0)
    message(FATAL_ERROR "Apple Clang version must be at least 5.0")
  endif()
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  # require at least Visual Studio 2017
  if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 19.10)
    message(FATAL_ERROR "Microsoft Visual Studio 2017 or newer required")
  endif()
else()
  message(WARNING "You are using an unsupported compiler! Compilation has only been tested with Clang (Linux or Apple), GCC and MSVC.")
endif()

if(CMAKE_COMPILER_IS_GNUCXX)
  mitkFunctionGetGccVersion(${CMAKE_CXX_COMPILER} GCC_VERSION)
else()
  set(GCC_VERSION 0)
endif()

set(MITK_CXX_STANDARD 14)

set(CMAKE_CXX_EXTENSIONS 0)
set(CMAKE_CXX_STANDARD ${MITK_CXX_STANDARD})
set(CMAKE_CXX_STANDARD_REQUIRED 1)

# This is necessary to avoid problems with compile feature checks.
# CMAKE_CXX_STANDARD seems to only set the -std=c++14 flag for targets.
# However, compile flag checks also need to be done with -std=c++14.
# The MITK_CXX14_FLAG variable is also used for external projects
# build during the MITK super-build.
mitkFunctionCheckCompilerFlags("-std=c++14" MITK_CXX14_FLAG)

#-----------------------------------------------------------------------------
# Warn if source or build path is too long
#-----------------------------------------------------------------------------

if(WIN32)
  set(_src_dir_length_max 50)
  set(_bin_dir_length_max 50)
  if(MITK_USE_SUPERBUILD)
    set(_src_dir_length_max 34) # _src_dir_length_max - strlen(ep/src/ITK-build)
    set(_bin_dir_length_max 40) # _bin_dir_length_max - strlen(MITK-build)
  endif()

  string(LENGTH "${MITK_SOURCE_DIR}" _src_n)
  string(LENGTH "${MITK_BINARY_DIR}" _bin_n)

  # The warnings should be converted to errors
  if(_src_n GREATER _src_dir_length_max)
    message(WARNING "MITK source code directory path length is too long (${_src_n} > ${_src_dir_length_max})."
                    "Please move the MITK source code directory to a directory with a shorter path." )
  endif()
  if(_bin_n GREATER _bin_dir_length_max)
    message(WARNING "MITK build directory path length is too long (${_bin_n} > ${_bin_dir_length_max})."
                    "Please move the MITK build directory to a directory with a shorter path." )
  endif()
endif()
