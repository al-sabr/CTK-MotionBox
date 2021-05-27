
# CMake module to search for LIBVLC (VLC library)
# Author: Rohit Yadav <rohityadav89@gmail.com>
#
# If it's found it sets LIBVLC_FOUND to TRUE
# and following variables are set:
#    LIBVLC_INCLUDE_DIR
#    LIBVLC_LIBRARY


# FIND_PATH and FIND_LIBRARY normally search standard locations
# before the specified paths. To search non-standard paths first,
# FIND_* is invoked first with specified paths and NO_DEFAULT_PATH
# and then again with no specified paths to search the default
# locations. When an earlier FIND_* succeeds, subsequent FIND_*s
# searching for the same item do nothing.

#Put here path to custom location
#example: /home/user/vlc/include etc..
FIND_PATH(LIBVLC_INCLUDE_DIR vlc/vlc.h
  HINTS "$ENV{LIBVLC_INCLUDE_PATH}"
  PATHS
    #Mac OS and Contribs
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/include"
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/include/vlc"
    # Env
    "$ENV{LIB_DIR}/include"
    "$ENV{LIB_DIR}/include/vlc"
    #
    "/usr/include"
    "/usr/include/vlc"
    "/usr/local/include"
    "/usr/local/include/vlc"
    #mingw
    c:/msys/local/include
    # MacOS install dir
    /Applications/VLC.app/Contents/MacOS/include
  )
FIND_PATH(LIBVLC_INCLUDE_DIR PATHS "${CMAKE_INCLUDE_PATH}/vlc" NAMES vlc.h)

#Put here path to custom location
#example: /home/user/vlc/lib etc..

FIND_LIBRARY(LIBVLC_LIBRARY NAMES vlc libvlc
  HINTS "$ENV{LIBVLC_LIBRARY_PATH}"
  PATHS
    "$ENV{LIB_DIR}/lib"
    #Mac OS
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/lib"
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/plugins"
    # MacOS install dir
    /Applications/VLC.app/Contents/MacOS/lib
    #mingw
    c:/msys/local/lib
  )
FIND_LIBRARY(LIBVLC_LIBRARY NAMES vlc libvlc)
FIND_LIBRARY(LIBVLC_RUNTIME NAMES vlc.dll libvlc.dll)
FIND_LIBRARY(LIBVLCCORE_LIBRARY NAMES vlccore libvlccore
  HINTS "$ENV{LIBVLC_LIBRARY_PATH}"
  PATHS
    "$ENV{LIB_DIR}/lib"
    #Mac OS
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/lib"
    "${CMAKE_CURRENT_SOURCE_DIR}/contribs/plugins"
    # MacOS install dir
    /Applications/VLC.app/Contents/MacOS/lib
    #mingw
    c:/msys/local/lib
  )
FIND_LIBRARY(LIBVLCCORE_LIBRARY NAMES vlccore libvlccore)
FIND_LIBRARY(LIBVLCCORE_RUNTIME NAMES vlccore.dll libvlccore.dll)

IF (LIBVLC_INCLUDE_DIR AND LIBVLC_LIBRARY AND LIBVLCCORE_LIBRARY AND LIBVLCCORE_RUNTIME AND LIBVLC_RUNTIME)
   SET(LIBVLC_FOUND TRUE)
ENDIF (LIBVLC_INCLUDE_DIR AND LIBVLC_LIBRARY AND LIBVLCCORE_LIBRARY AND LIBVLCCORE_RUNTIME AND LIBVLC_RUNTIME)

IF (LIBVLC_FOUND)
    get_filename_component(LIBVLC_LIB_DIR ${LIBVLC_LIBRARY} PATH)
    IF (NOT LIBVLC_FIND_QUIETLY)
      MESSAGE(STATUS "Found LibVLC include-dir path: ${LIBVLC_INCLUDE_DIR}")
      MESSAGE(STATUS "Found LibVLC RUNTIME path:${LIBVLC_RUNTIME}")
      MESSAGE(STATUS "Found LibVLC library path:${LIBVLC_LIBRARY}")
      MESSAGE(STATUS "Found LibVLCcore RUNTIME path:${LIBVLCCORE_RUNTIME}")
      MESSAGE(STATUS "Found LibVLCcore library path:${LIBVLCCORE_LIBRARY}")
    ENDIF (NOT LIBVLC_FIND_QUIETLY)

    if(LIBVLC_FOUND AND NOT TARGET LibVLC::VLC)
      add_library(LibVLC::VLC SHARED IMPORTED)
      set_target_properties(LibVLC::VLC PROPERTIES
          IMPORTED_LOCATION "${LIBVLC_RUNTIME}"
          IMPORTED_IMPLIB "${LIBVLC_LIBRARY}"
          INTERFACE_INCLUDE_DIRECTORIES "${LIBVLC_INCLUDE_DIR}"
      )
    endif()

    if(LIBVLC_FOUND AND NOT TARGET LibVLC::Core)
        add_library(LibVLC::Core SHARED IMPORTED)
        set_target_properties(LibVLC::Core PROPERTIES
            IMPORTED_LOCATION "${LIBVLCCORE_RUNTIME}"
            IMPORTED_IMPLIB "${LIBVLCCORE_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES "${LIBVLC_INCLUDE_DIR}"
        )
    endif()

    if(TARGET LibVLC::Core AND TARGET LibVLC::VLC)
      message("LibVLC::Core and LibVLC::VLC targets are defined.")
    endif()
ELSE (LIBVLC_FOUND)
   IF (LIBVLC_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find LibVLC")
   ENDIF (LIBVLC_FIND_REQUIRED)
ENDIF (LIBVLC_FOUND)

