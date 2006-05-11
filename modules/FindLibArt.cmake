# - Try to find the LibArt 2D graphics library
# Once done this will define
#
#  LIBART_FOUND - system has the LibArt
#  LIBART_INCLUDE_DIR - the LibArt include directory
#  LIBART_LIBRARIES - The libraries needed to use LibArt

if (LIBART_INCLUDE_DIR AND LIBART_LIBRARIES)

  # in cache already
  SET(LIBART_FOUND TRUE)

else (LIBART_INCLUDE_DIR AND LIBART_LIBRARIES)

  IF (NOT WIN32)
    INCLUDE(UsePkgConfig)
    # use pkg-config to get the directories and then use these values
    # in the FIND_PATH() and FIND_LIBRARY() calls
    PKGCONFIG(libart-2.0 _libArtIncDir _libArtLinkDir _libArtLinkFlags _libArtCflags)

    ######### ?? where is this used ?? ###############
    set(LIBART_DEFINITIONS ${_libArtCflags})
  ENDIF (NOT WIN32)

  FIND_PATH(LIBART_INCLUDE_DIR libart_lgpl/libart.h
     ${_libArtIncDir}/libart-2.0
     /usr/include/libart-2.0
     /usr/local/include/libart-2.0
  )
  
  FIND_LIBRARY(LIBART_LIBRARIES NAMES art_lgpl_2
     PATHS
     ${_libArtLinkDir}
     /usr/lib
     /usr/local/lib
  )
  
  
  if (LIBART_INCLUDE_DIR AND LIBART_LIBRARIES)
     set(LIBART_FOUND TRUE)
  endif (LIBART_INCLUDE_DIR AND LIBART_LIBRARIES)
  
  
  if (LIBART_FOUND)
     if (NOT LibArt_FIND_QUIETLY)
        message(STATUS "Found libart: ${LIBART_LIBRARIES}")
     endif (NOT LibArt_FIND_QUIETLY)
  else (LIBART_FOUND)
     if (LibArt_FIND_REQUIRED)
        message(FATAL_ERROR "Could NOT find libart")
     endif (LibArt_FIND_REQUIRED)
  endif (LIBART_FOUND)

  MARK_AS_ADVANCED(LIBART_INCLUDE_DIR LIBART_LIBRARIES)

endif (LIBART_INCLUDE_DIR AND LIBART_LIBRARIES)
