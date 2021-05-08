set(MODULE_NO_INIT TRUE)

if(NOT MODULE_HEADERS_ONLY)
  if(NOT MODULE_NO_INIT OR KIT_RESOURCEFILES)
    find_package(CppMicroServices QUIET NO_MODULE REQUIRED)
  endif()
  if(NOT MODULE_NO_INIT)
    usFunctionGenerateModuleInit(CPP_FILES)
  endif()

  set(binary_res_files )
  set(source_res_files )
  if(KIT_RESOURCEFILES)
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/resource")
      set(res_dir resource)
    elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
      set(res_dir Resources)
    else()
      message(SEND_ERROR "Resources specified but ${CMAKE_CURRENT_SOURCE_DIR}/resource directory not found.")
    endif()
    foreach(res_file ${KIT_RESOURCEFILES})
      if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/${res_dir}/${res_file})
        list(APPEND binary_res_files "${res_file}")
      else()
        list(APPEND source_res_files "${res_file}")
      endif()
    endforeach()

    # Add a source level dependencies on resource files
    usFunctionGetResourceSource(TARGET ${PROJECT_NAME} OUT CPP_FILES)
  endif()
endif()

if(binary_res_files)
  usFunctionAddResources(TARGET ${PROJECT_NAME}
                          WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${res_dir}
                          FILES ${binary_res_files})
endif()
if(source_res_files)
  usFunctionAddResources(TARGET ${PROJECT_NAME}
                          WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${res_dir}
                          FILES ${source_res_files})
endif()
if(binary_res_files OR source_res_files)
  usFunctionEmbedResources(TARGET ${PROJECT_NAME})
endif()