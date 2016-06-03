#-------------------------------------------------------------------------------
#       Filename:  makefile
#
#    Description:  compile the emu-blockcontroller  
#
#        Version:  0.1
#        Created:  13.05.2016
#       Revision:  none
#
#         Author:  M.Sc. Oliver Kehret, oliver.kehret@hs-offenburg.de
#   Organization:  ivESK, Offenburg University, Germany
#      Copyright:  Copyright (c) 2016, M.Sc. Oliver Kehret
#-------------------------------------------------------------------------------
#
# To Compile type the following:
# make <device> <debug>
# make DEVICE_TYPE=sset_DS SSET_DEBUG=sset_debug
# <device> = sset_LRSA|sset_LRSB|sset_SRSA|sset_SRSB|sset_DS|sset_SC
# <debug>  = 0|1  :to use the board without rack or domain address coding.
# PCB View:
# +-----------DEVICEPORTS----------+
# |  sset_DS              sset_DS  |
# |                                |
# |  sset_SRSA          sset_SRSB  |
# |                                |
# |  sset_SRSA          sset_SRSB  |
# |                                |
# |  sset_SRSA          sset_SRSB  |
# |                                |
# |  sset_SRSA          sset_SRSB  |
# |         sset_LRSA              |
# |  sset_SC            sset_LRSB  |
# |                                |
# +------------BACKPLANE-----------+
#
#
#-------------------------------------------------------------------------------
# The project's name
#-------------------------------------------------------------------------------
#
PROJ_NAME  = emu-blockcontroller
DEVICE_TYPE = 
SSET_DEBUG = 
# VERSION MAIN.SUB.FEATURE
Rev_Main=0
Rev_Sub=1
Rev_Feature=1
#
uC = STM32F030x8
#
BUILD_DIR  = build
#-------------------------------------------------------------------------------
#
# Preprocessor macro defines
#-------------------------------------------------------------------------------
MACROS   = ${uC}
# Embedded target vaultic library 
MACROS  += DEBUG
MACROS  += TRACE
MACROS  += OS_USE_TRACE_SEMIHOSTING_DEBUG
MACROS  += ${DEVICE_TYPE}
ifeq (${SSET_DEBUG},1)
MACROS  += sset_debug
endif
MACROS  += sset_FW_Rev_Main=${Rev_Main}
MACROS  += sset_FW_Rev_Sub=${Rev_Sub}
MACROS  += sset_FW_Rev_Feature=${Rev_Feature}
#
#-------------------------------------------------------------------------------
# SRC_Files and INC_DIRS
#-------------------------------------------------------------------------------
SRC_FILES  = $(shell find ./src -name '*.c')
SRC_FILES += $(shell find ./system/src -name '*.c')
INC_DIRS   = ./include
INC_DIRS  += ./include/flash
INC_DIRS  += ./include/digitalout
INC_DIRS  += ./include/cominterface
INC_DIRS  += ./system/include
INC_DIRS  += ./system/include/stm32f0xx
INC_DIRS  += ./system/include/cmsis
INC_DIRS  += ./system/include/cmsis/device
#
#-------------------------------------------------------------------------------
# Compiler
#-------------------------------------------------------------------------------
C_PREFIX = arm-none-eabi-
AS       = $(C_PREFIX)as
CC       = $(C_PREFIX)gcc
CXX      = $(C_PREFIX)g++
OBJCOPY  = $(C_PREFIX)objcopy
OBJDUMP  = $(C_PREFIX)objdump
SIZE	 = $(C_PREFIX)size
ARCH     = cpu=cortex-m0 thumb
#
#-------------------------------------------------------------------------------
# FLAGS
#-------------------------------------------------------------------------------
OPTIMAZITAIONS  = message-length=0 signed-char function-sections data-sections 
OPTIMAZITAIONS += freestanding 
WARNINGS = all extra 
DEBUG_LEVEL = -g3 -O0
VERBOSE = 0
ifeq ($(VERBOSE),1)
VERBOSITY = -v
endif
#ARFLAGS  = 
ASFLAGS      = -x assembler-with-cpp $(VERBOSITY)
CFLAGS       = -c -std=gnu11 $(DEBUG_LEVEL) $(VERBOSITY)
CFLAGS      += $(foreach d, $(OPTIMAZITAIONS), -f$d)
CFLAGS      += $(foreach d, $(WARNINGS), -W$d)
CFLAGS      += $(foreach d, $(INC_DIRS), -I$d)
CFLAGS      += $(foreach d, $(MACROS), -D$d)
CFLAGS      += $(foreach d, $(ARCH), -m$d)
CXXFLAGS     = -c -std=gnu++11 -fabi-version=0 $(DEBUG_LEVEL) $(VERBOSITY)
CXXFLAGS    += $(foreach d, $(OPTIMAZITAIONS), -f$d)
CXXFLAGS    += $(foreach d, $(WARNINGS), -W$d)
CXXFLAGS    += $(foreach d, $(INC_DIRS), -I$d)
CXXFLAGS    += $(foreach d, $(MACROS), -D$d)
CXXFLAGS    += $(foreach d, $(ARCH), -m$d)
LD_SCRIPTS   = mem libs sections
LDFLAGS      = $(foreach d, $(LD_SCRIPTS), -T $d.ld) $(VERBOSITY)
LDFLAGS     += -nostartfiles -Xlinker --gc-sections 
LDFLAGS     += -L./ldscripts -Wl,-Map,ssetblockmcu.map --specs=nano.specs
#
#
#-------------------------------------------------------------------------------
# Logic and dirs
#-------------------------------------------------------------------------------
OBJ_BASE_DIR  = $(BUILD_DIR)/obj
PREP_BASE_DIR = $(BUILD_DIR)/prep
ASM_BASE_DIR  = $(BUILD_DIR)/asm

EXECUTABLE    = $(BUILD_DIR)/$(PROJ_NAME).elf
BINARY        = $(BUILD_DIR)/$(PROJ_NAME).bin

SOURCES       = $(foreach d, $(SRC_FILES), $(shell ls -1 $d))
OBJECTS       = $(addprefix $(OBJ_BASE_DIR)/, $(addsuffix .o, $(SOURCES)))
PREPS         = $(addprefix $(PREP_BASE_DIR)/, $(SOURCES))
ASMS          = $(patsubst $(OBJ_BASE_DIR)/%, $(ASM_BASE_DIR)/%.s, $(OBJECTS))



all: bin size

exec: $(EXECUTABLE) 

bin: $(BINARY) 

prep: $(PREPS) 

obj: $(OBJECTS)

asm: $(ASMS)

$(EXECUTABLE): obj
	@echo "\033[01;33m==> Linking files -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@
	@echo ""

$(BINARY): $(EXECUTABLE)
	@echo "\033[01;33m==> Creating binary '$(EXECUTABLE)' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(OBJCOPY) -O binary $(EXECUTABLE) $@
	
list: $(EXECUTABLE)
	@echo "\033[01;33m==> Creating listing for '$(EXECUTABLE)' :\033[00;00m"
	$(OBJDUMP) --source --all-headers --demangle --line-number $(EXECUTABLE) > $(EXECUTABLE).lst
	
size : $(EXECUTABLE)
	@echo "\033[01;33m==> Printing size for '$(EXECUTABLE)':\033[00;00m"
	$(SIZE) --format=berkley $(EXECUTABLE)
#
#-------------------------------------------------------------------------------
# 
#-------------------------------------------------------------------------------
	
$(OBJ_BASE_DIR)/%.s.o: %.s
	@echo "\033[01;32m==> Compiling assembler '$<' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) $< -o $@
	@echo ""
	
$(OBJ_BASE_DIR)/%.c.o: %.c
	@echo "\033[01;32m==> Compiling C Files '$<' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -o $@
	@echo ""
	
$(OBJ_BASE_DIR)/%.cpp.o: %.cpp
	@echo "\033[01;32m==> Compiling C++ Files '$<' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $< -o $@
	@echo ""
#-------------------------------------------------------------------------------
	
$(PREP_BASE_DIR)/%: %
	@echo "\033[01;32m==> Preprocessing '$<' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -E > $@
	@echo ""
	
$(ASM_BASE_DIR)/%.s: $(OBJ_BASE_DIR)/%
	@echo "\033[01;32m==> Disassembling '$<' -> '$@':\033[00;00m"
	@mkdir -p $(dir $@)
	$(OBJDUMP) -d -S $< > $@
	@echo ""
	
clean:
	@echo "\033[01;31m==> Cleaning directories:\033[00;00m"
	rm -rf $(BUILD_DIR)/
	@echo ""
