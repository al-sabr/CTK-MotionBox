project(bismillahLauncher)

set(_app_options)
set(MITK_SHOW_CONSOLE_WINDOW TRUE)
if(MITK_SHOW_CONSOLE_WINDOW)
  list(APPEND _app_options SHOW_CONSOLE)
endif()

set(REQUIRED_PLUGINS
  org.commontk.configadmin
  org.commontk.eventadmin
  org.blueberry.core.runtime
  org.blueberry.core.commands
  org.blueberry.core.expressions
  org.blueberry.ui.qt
  org.blueberry.ui.qt.help
  org.blueberry.ui.qt.log
  org.blueberry.ui.qt.objectinspector
  bismillah.fractal.core
  bismillah.dummy.plugin
  bismillah.multimedia.motionbox

)

set(DESCRIPTION
""
)

set(_source_files
  bismillahLauncher.cpp
)

set(_source_moc_h_files
)

set(_source_ui_files
)

# this is a workaround for Visual Studio. The relative include paths in the generated
# moc files can get very long and can't be resolved by the MSVC compiler.
foreach(_moc_src ${_source_moc_h_files})
  qt5_wrap_cpp(_source_files ${_moc_src} OPTIONS -f${_moc_src})
endforeach()

qt5_wrap_ui(_source_files ${_source_ui_files})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_BINARY_DIR}
                   )

set(ALL_REQUIRED_PLUGIN_TARGETS )
foreach(req_plugin ${REQUIRED_PLUGINS})
  string(REPLACE "." "_" _plugin_target ${req_plugin})
  if(TARGET ${_plugin_target})
    list(APPEND ALL_REQUIRED_PLUGIN_TARGETS ${_plugin_target})
  endif()
endforeach()

if(DESCRIPTION)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Description.txt
                  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.txt @ONLY)
endif()
list(APPEND ALL_REQUIRED_PLUGINS ${REQUIRED_PLUGINS})

#-----------------------------------------------------------------------------
# Create the application launcher
#-----------------------------------------------------------------------------

mitkFunctionCreateBlueBerryApplication(
  NAME ${PROJECT_NAME}
  DESCRIPTION "bismillah main application container"
  SOURCES ${_source_files}
  PLUGINS ${REQUIRED_PLUGINS}
  NO_INSTALL
)

mitk_use_modules(TARGET ${PROJECT_NAME}
  MODULES Qt5::Widgets Qt5::OpenGL Qt5::Core CTKAppUtil 
  SkyFramework::SkyCore
  SkyFramework::SkyGui
  SkyFramework::SkyMedia
  SkyFramework::SkyBackend
  SkyFramework::SkyTorrent

)

add_dependencies(${PROJECT_NAME} ${ALL_REQUIRED_PLUGIN_TARGETS})
