#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  #VTK_LIBRARIES
  VTK::IOImage
  CTKWidgets
  CTKmitkCore
  CTKmitkQtWidgets
  CTKmitkAlgorithmsExt
  CTKmitkSceneSerializationBase
  )