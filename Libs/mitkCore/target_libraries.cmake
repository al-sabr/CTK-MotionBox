#
# See CMake/ctkFunctionGetTargetLibraries.cmake
# 
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  CppMicroServices
  CppMicroServices_LIBRARIES
  ITK_LIBRARIES
  VTK_LIBRARIES
  CTKCore
  CTKmbilog
  Boost::uuid
  Boost::preprocessor
  Boost::property_tree
  Boost::type_traits
  tinyxml2
)

if(MSVC)
  # See link for information : https://cmake.org/cmake/help/v3.10/prop_tgt/IMPORTED.html#prop_tgt:IMPORTED
  list(APPEND target_libraries Boost::dynamic_linking)
endif()

if(CTK_QT_VERSION VERSION_GREATER "4")
  list(APPEND target_libraries Qt5::Core)
endif()

if (CTK_QT_VERSION VERSION_LESS "5")
  list(APPEND target_libraries QT_LIBRARIES)
endif()