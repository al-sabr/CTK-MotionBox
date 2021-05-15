file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
    src/mitkGeometryDataSerializer.cpp
    src/mitkImageSerializer.cpp
    src/mitkPointSetSerializer.cpp
    src/mitkPropertyListDeserializer.cpp
    src/mitkPropertyListDeserializerV1.cpp
    src/mitkSceneIO.cpp
    src/mitkSceneReader.cpp
    src/mitkSceneReaderV1.cpp
    src/mitkSurfaceSerializer.cpp
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES} ${KIT_MOC_SRCS})