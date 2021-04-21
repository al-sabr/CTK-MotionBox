#
# See CMake/ctkFunctionGetTargetLibraries.cmake
# 
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  ITK_LIBRARIES
  CTKCore
)

if(CTK_QT_VERSION VERSION_GREATER "4")
  list(APPEND target_libraries Qt5::Core)
endif()

if (CTK_QT_VERSION VERSION_LESS "5")
  list(APPEND target_libraries QT_LIBRARIES)
endif()