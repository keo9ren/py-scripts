IF(NOT TOOLCHAIN_PREFIX)
     SET(TOOLCHAIN_PREFIX "/usr")
     MESSAGE(STATUS "No TOOLCHAIN_PREFIX specified, using default: " ${TOOLCHAIN_PREFIX})
ENDIF()

IF(NOT TARGET_TRIPLET)
    SET(TARGET_TRIPLET "arm-none-eabi")
    MESSAGE(STATUS "No TARGET_TRIPLET specified, using default: " ${TARGET_TRIPLET})
ENDIF()
SET(TOOLCHAIN_BIN_DIR ${TOOLCHAIN_PREFIX}/bin)
SET(TOOLCHAIN_INC_DIR ${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET}/include)
SET(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET}/lib)

SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)
SET(CMAKE_SYSTEM_PROCESSOR arm)

SET(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-g++)
SET(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gcc)
SET(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-objcopy CACHE INTERNAL "objcopy tool")
SET(CMAKE_OBJDUMP ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-objdump CACHE INTERNAL "objdump tool")
SET(CMAKE_SIZE ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-size CACHE INTERNAL "size tool")
SET(CMAKE_DEBUGER ${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gdb CACHE INTERNAL "debuger")


SET(CMAKE_C_FLAGS "-mcpu=cortex-m0 -mthumb -mabi=aapcs -fomit-frame-pointer" CACHE INTERNAL "c compiler flags")
SET(CMAKE_CXX_FLAGS "-mcpu=cortex-m0 -mthumb -mabi=aapcs -fomit-frame-pointer -fabi-version=0" CACHE INTERNAL "cxx compiler flags")
SET(CMAKE_ASM_FLAGS "-mcpu=cortex-m0 -mthumb -x assembler-with-cpp" CACHE INTERNAL "asm compiler flags")
#SET(CMAKE_SHARED_LINKER_FLAGS "-T mem.ld  -T libs.ld  -T sections.ld  -nostartfiles -Xlinker --gc-sections  -L./ldscripts -Wl,-Map,ssetblockmcu.map --specs=nano.specs")
SET(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections -mthumb -mcpu=cortex-m0 -mabi=aapcs -T/home/oliver/Documents/mbus/repos/emu-blockcontroller/ldscripts/mem.ld  -T /home/oliver/Documents/mbus/repos/emu-blockcontroller/ldscripts/libs.ld  -T /home/oliver/Documents/mbus/repos/emu-blockcontroller/ldscripts/sections.ld  -nostartfiles -Xlinker --gc-sections  -L./ldscripts -Wl,-Map,ssetblockmcu.map --specs=nano.specs" CACHE INTERNAL "executable linker flags")
SET(CMAKE_MODULE_LINKER_FLAGS "-mthumb -mcpu=cortex-m0 -mabi=aapcs" CACHE INTERNAL "module linker flags")
SET(CMAKE_SHARED_LINKER_FLAGS "-mthumb -mcpu=cortex-m0 -mabi=aapcs" CACHE INTERNAL "shared linker flags")


SET(CMAKE_C_FLAGS_DEBUG "-g3 -O0" CACHE INTERNAL "c compiler flags debug")
SET(CMAKE_CXX_FLAGS_DEBUG "-g3 -O0" CACHE INTERNAL "cxx compiler flags debug")
SET(CMAKE_ASM_FLAGS_DEBUG "-g" CACHE INTERNAL "asm compiler flags debug")

SET(CMAKE_C_FLAGS_RELEASE "-g3 -O0" CACHE INTERNAL "c compiler flags RELEASE")
SET(CMAKE_CXX_FLAGS_RELEASE "-g3 -O0" CACHE INTERNAL "cxx compiler flags RELEASE")
SET(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "asm compiler flags RELEASE")



# rdynamic means the backtrace should work
IF (CMAKE_BUILD_TYPE MATCHES "Debug")
   add_definitions(-rdynamic)
ENDIF()

SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET})
# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
