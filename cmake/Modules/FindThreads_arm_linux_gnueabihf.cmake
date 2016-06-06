# - Check for the presence of Threads_arm_linux_gnueabihf
#
# The following variables are set when Threads_arm_linux_gnueabihf is found:
#  HAVE_Threads_arm_linux_gnueabihf  = Set to true, if all components of Threads_arm_linux_gnueabihf
#                          have been found.
#  Threads_arm_linux_gnueabihf_INCLUDES   = Include path for the header files of Threads_arm_linux_gnueabihf
#  Threads_arm_linux_gnueabihf_LIBRARIES  = Link these to use Threads_arm_linux_gnueabihf
#
## -----------------------------------------------------------------------------
## Check for the header files
message(STATUS "INCLUDES")
find_path (Threads_arm_linux_gnueabihf_INCLUDES pthread.h
  PATHS /usr/arm-linux-gnueabihf/include ${CMAKE_EXTRA_INCLUDES}
  )

## -----------------------------------------------------------------------------
## Check for the library

message(STATUS "LIBS")
find_library (Threads_arm_linux_gnueabihf_LIBRARIES pthread
  PATHS /usr/arm-linux-gnueabihf/lib ${CMAKE_EXTRA_LIBRARIES}
  )

## -----------------------------------------------------------------------------
## Actions taken when all components have been found

if (Threads_arm_linux_gnueabihf_INCLUDES AND Threads_arm_linux_gnueabihf_LIBRARIES)
  set (HAVE_Threads_arm_linux_gnueabihf TRUE)
else (Threads_arm_linux_gnueabihf_INCLUDES AND Threads_arm_linux_gnueabihf_LIBRARIES)
  if (NOT Threads_arm_linux_gnueabihf_FIND_QUIETLY)
    if (NOT Threads_arm_linux_gnueabihf_INCLUDES)
      message (STATUS "Unable to find Threads_arm_linux_gnueabihf header files!")
    endif (NOT Threads_arm_linux_gnueabihf_INCLUDES)
    if (NOT Threads_arm_linux_gnueabihf_LIBRARIES)
      message (STATUS "Unable to find Threads_arm_linux_gnueabihf library files!")
    endif (NOT Threads_arm_linux_gnueabihf_LIBRARIES)
  endif (NOT Threads_arm_linux_gnueabihf_FIND_QUIETLY)
endif (Threads_arm_linux_gnueabihf_INCLUDES AND Threads_arm_linux_gnueabihf_LIBRARIES)

if (HAVE_Threads_arm_linux_gnueabihf)
  if (NOT Threads_arm_linux_gnueabihf_FIND_QUIETLY)
    message (STATUS "Found components for Threads_arm_linux_gnueabihf")
    message (STATUS "Threads_arm_linux_gnueabihf_INCLUDES = ${Threads_arm_linux_gnueabihf_INCLUDES}")
    message (STATUS "Threads_arm_linux_gnueabihf_LIBRARIES = ${Threads_arm_linux_gnueabihf_LIBRARIES}")
  endif (NOT Threads_arm_linux_gnueabihf_FIND_QUIETLY)
else (HAVE_Threads_arm_linux_gnueabihf)
  if (Threads_arm_linux_gnueabihf_FIND_REQUIRED)
    message (FATAL_ERROR "Could not find Threads_arm_linux_gnueabihf!")
  endif (Threads_arm_linux_gnueabihf_FIND_REQUIRED)
endif (HAVE_Threads_arm_linux_gnueabihf)

mark_as_advanced (
  HAVE_Threads_arm_linux_gnueabihf
  Threads_arm_linux_gnueabihf_LIBRARIES
  Threads_arm_linux_gnueabihf_INCLUDES
  )
