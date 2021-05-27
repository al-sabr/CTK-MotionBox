#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  CTKWidgets
  SkyFramework_LIBRARIES
  SkyFramework::SkyBackend
	SkyFramework::SkyTorrent
	SkyFramework::SkyCore
	SkyFramework::SkyGui
	SkyFramework::SkyMedia
  )