# - Check for the presence of DL
#
# The following variables are set when DL is found:
#  HAVE_DL_arm_linux_gnueabihf       = Set to true, if all components of DL
#                          have been found.
#  DL_arm_linux_gnueabihf_INCLUDES   = Include path for the header files of DL
#  DL_arm_linux_gnueabihf_LIBRARIES  = Link these to use DL

## -----------------------------------------------------------------------------
## Check for the header files

find_path (DL_arm_linux_gnueabihf_INCLUDES dlfcn.h
  PATHS /usr/arm-linux-gnueabihf/include ${CMAKE_EXTRA_INCLUDES}
  )

## -----------------------------------------------------------------------------
## Check for the library

find_library (DL_arm_linux_gnueabihf_LIBRARIES dl
  PATHS /usr/arm-linux-gnueabihf/lib ${CMAKE_EXTRA_LIBRARIES}
  )

## -----------------------------------------------------------------------------
## Actions taken when all components have been found

if (DL_arm_linux_gnueabihf_INCLUDES AND DL_arm_linux_gnueabihf_LIBRARIES)
  set (HAVE_DL_arm_linux_gnueabihf TRUE)
else (DL_arm_linux_gnueabihf_INCLUDES AND DL_arm_linux_gnueabihf_LIBRARIES)
  if (NOT DL_arm_linux_gnueabihf_FIND_QUIETLY)
    if (NOT DL_arm_linux_gnueabihf_INCLUDES)
      message (STATUS "Unable to find DL_arm_linux_gnueabihf header files!")
    endif (NOT DL_arm_linux_gnueabihf_INCLUDES)
    if (NOT DL_arm_linux_gnueabihf_LIBRARIES)
      message (STATUS "Unable to find DL_arm_linux_gnueabihf library files!")
    endif (NOT DL_arm_linux_gnueabihf_LIBRARIES)
  endif (NOT DL_arm_linux_gnueabihf_FIND_QUIETLY)
endif (DL_arm_linux_gnueabihf_INCLUDES AND DL_arm_linux_gnueabihf_LIBRARIES)

if (HAVE_DL_arm_linux_gnueabihf)
  if (NOT DL_arm_linux_gnueabihf_FIND_QUIETLY)
    message (STATUS "Found components for DL_arm_linux_gnueabihf")
    message (STATUS "DL_arm_linux_gnueabihf_INCLUDES = ${DL_arm_linux_gnueabihf_INCLUDES}")
    message (STATUS "DL_arm_linux_gnueabihf_LIBRARIES = ${DL_arm_linux_gnueabihf_LIBRARIES}")
  endif (NOT DL_arm_linux_gnueabihf_FIND_QUIETLY)
else (HAVE_DL_arm_linux_gnueabihf)
  if (DL_arm_linux_gnueabihf_FIND_REQUIRED)
    message (FATAL_ERROR "Could not find DL_arm_linux_gnueabihf!")
  endif (DL_arm_linux_gnueabihf_FIND_REQUIRED)
endif (HAVE_DL_arm_linux_gnueabihf)

mark_as_advanced (
  HAVE_DL_arm_linux_gnueabihf
  DL_arm_linux_gnueabihf_LIBRARIES
  DL_arm_linux_gnueabihf_INCLUDES
  )
