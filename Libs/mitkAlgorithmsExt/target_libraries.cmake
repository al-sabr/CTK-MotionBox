#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  VTK::ImagingGeneral
  CTKmitkLegacyGL
  CTKmitkDataTypesExt
  ZLib
  ANN
  )

#[[
  mitk_create_module(
  DEPENDS MitkDataTypesExt MitkLegacyGL
  PACKAGE_DEPENDS
    PUBLIC OpenMP
    PRIVATE ANN VTK|ImagingGeneral
)
]]