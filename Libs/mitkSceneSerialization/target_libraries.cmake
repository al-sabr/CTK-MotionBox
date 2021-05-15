#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  Poco::Zip
  CTKmitkSceneSerializationBase
  )

#[[
MITK_CREATE_MODULE(
  DEPENDS MitkSceneSerializationBase
  PACKAGE_DEPENDS PUBLIC Poco|Zip
)
]]