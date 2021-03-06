#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
#VTK_LIBRARIES
  CppMicroServices
  CppMicroServices_LIBRARIES
  VTK::GUISupportQt
  VTK::RenderingQt
  CTKWidgets
  CTKmitkPlanarFigure
  CTKmitkAnnotation
  
  )

#   MITK_CREATE_MODULE(
#   INCLUDE_DIRS PRIVATE resource # for xpm includes
#   DEPENDS MitkPlanarFigure MitkAnnotation
#   PACKAGE_DEPENDS
#     PUBLIC VTK|GUISupportQt+RenderingQt Qt5|Widgets+OpenGL+Core
# )