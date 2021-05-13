#
# See CMake/ctkFunctionGetTargetLibraries.cmake
#
# This file should list the libraries required to build the current CTK libraries
#

set(target_libraries
  ann
  VTK::ImagingGeneral
  CTKmitkCore
  CTKmitkLegacyGL
  CTKmitkDataTypesExt
  ZLib
  )

#[[
  mitk_create_module(
  DEPENDS MitkDataTypesExt MitkLegacyGL
  PACKAGE_DEPENDS
    PUBLIC OpenMP
    PRIVATE ANN VTK|ImagingGeneral
)
]]