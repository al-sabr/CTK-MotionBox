# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK plugin.
# For specifying required plugins, see the manifest_headers.cmake file.
#

set(target_libraries
  CTKWidgets
  org_blueberry_ui_qt
)

if(CTK_USE_Qt5)
  message("BLUEBERRY:UI:QT USES QT5")
  list(APPEND target_libraries Qt5::Help Qt5::OpenGL Qt5::PrintSupport Qt5::WebEngine Qt5::Widgets Qt5::Xml)
endif()