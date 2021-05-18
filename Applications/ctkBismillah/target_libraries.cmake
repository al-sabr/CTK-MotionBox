#
# See CMake/ctkFunctionGetTargetLibraries.cmake
# 
# This file should list the libraries required to build the current CTK application.
# 

set(target_libraries
  CTKCore
  CTKPluginFramework
  CTKAppUtil
  ITK
  VTK
  CppMicroServices
  # org_blueberry_ui_qt
  # org_mitk_gui_common
  # org_mitk_gui_qt_extapplication
)
