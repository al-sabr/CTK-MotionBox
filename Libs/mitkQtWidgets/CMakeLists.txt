project(CTKmitkQtWidgets)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(files.cmake)

find_package(Qt5 COMPONENTS Core OpenGL Widgets REQUIRED)

find_package(CppMicroServices NO_MODULE REQUIRED)
include_directories(${CppMicroServices_INCLUDE_DIRS})

# Generate module initialization code
usFunctionGenerateModuleInit(KIT_SRCS
                             NAME "MITK QtWidgets"
                             LIBRARY_NAME ${PROJECT_NAME})

set(KIT_export_directive "MITKQTWIDGETS_EXPORT")
# Target libraries - See CMake/ctkFunctionGetTargetLibraries.cmake
# The following macro will read the target libraries from the file 'target_libraries.cmake'

set(KIT_target_libraries)

ctkFunctionGetTargetLibraries(KIT_target_libraries)

if(CTK_QT_VERSION VERSION_GREATER "4")
  list(APPEND KIT_target_libraries Qt5::Core Qt5::OpenGL Qt5::Widgets CppMicroServices)
endif()

ctkMacroBuildLib(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  GENERATE_MOC_SRCS ${KIT_GENERATE_MOC_SRCS}
  UI_FORMS ${KIT_UI_FORMS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  RESOURCES ${KIT_resources}
  LIBRARY_TYPE ${CTK_LIBRARY_MODE}
  EXPORT_HEADER_NAME "MitkQtWidgetsExports"
)

target_link_libraries(${PROJECT_NAME} ${CppMicroServices_LIBRARIES})

include_directories(include)
include_directories(resource)

target_include_directories(${PROJECT_NAME} PUBLIC include)

#add_subdirectory(test)
