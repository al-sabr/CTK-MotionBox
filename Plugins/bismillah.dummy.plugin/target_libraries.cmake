# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK plugin.
# For specifying required plugins, see the manifest_headers.cmake file.
#

# set(Sky_DEPS
#   SkyFramework::SkyCore 
#   SkyFramework::SkyGui
# )

set(target_libraries
  CTKPluginFramework
  CTKMotionBox
  org_blueberry_core_runtime
)

#list(APPEND target_libraries Sky_DEPS)