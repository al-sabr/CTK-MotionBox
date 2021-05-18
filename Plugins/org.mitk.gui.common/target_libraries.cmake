# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK plugin.
# For specifying required plugins, see the manifest_headers.cmake file.
#

set(target_libraries
  CTKmitkQtWidgets
  org_blueberry_ui_qt
  org_mitk_core_services
)