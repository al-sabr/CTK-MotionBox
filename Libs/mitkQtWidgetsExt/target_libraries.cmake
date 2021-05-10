#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  #VTK_LIBRARIES
  VTK::IOImage
  CTKWidgets
  CTKmitkQtWidgets
  )

# MITK_CREATE_MODULE(
#   DEPENDS MitkAlgorithmsExt MitkQtWidgets PRIVATE MitkSceneSerializationBase
#   PACKAGE_DEPENDS
#     PUBLIC Qwt CTK|CTKWidgets
#     PRIVATE Qt5|Concurrent+Svg+Xml VTK|IOImage
# )