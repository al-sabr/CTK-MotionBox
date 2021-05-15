file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkAnnotationPropertySerializer.cpp
  src/mitkBaseDataSerializer.cpp
  src/mitkBasePropertySerializer.cpp
  src/mitkBoolLookupTablePropertySerializer.cpp
  src/mitkBoolPropertySerializer.cpp
  src/mitkClippingPropertySerializer.cpp
  src/mitkColorPropertySerializer.cpp
  src/mitkDoublePropertySerializer.cpp
  src/mitkEnumerationPropertySerializer.cpp
  src/mitkEnumerationSubclassesSerializer.cpp
  src/mitkFloatLookupTablePropertySerializer.cpp
  src/mitkFloatPropertySerializer.cpp
  src/mitkGroupTagPropertySerializer.cpp
  src/mitkIntLookupTablePropertySerializer.cpp
  src/mitkIntPropertySerializer.cpp
  src/mitkLevelWindowPropertySerializer.cpp
  src/mitkLookupTablePropertySerializer.cpp
  src/mitkPoint3dPropertySerializer.cpp
  src/mitkPoint3iPropertySerializer.cpp
  src/mitkPoint4dPropertySerializer.cpp
  src/mitkPropertyListSerializer.cpp
  src/mitkStringLookupTablePropertySerializer.cpp
  src/mitkStringPropertySerializer.cpp
  src/mitkTemporoSpatialStringPropertySerializer.cpp
  src/mitkTransferFunctionPropertySerializer.cpp
  src/mitkUIntPropertySerializer.cpp
  src/mitkUShortPropertySerializer.cpp
  src/mitkVector3DPropertySerializer.cpp
  src/mitkVectorPropertySerializer.cpp
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES} ${KIT_MOC_SRCS})