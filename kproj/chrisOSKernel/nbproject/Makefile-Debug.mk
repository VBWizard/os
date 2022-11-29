#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/9e029b58/asmFunctions.o \
	${OBJECTDIR}/_ext/734293bf/ahci.o \
	${OBJECTDIR}/_ext/734293bf/pci.o \
	${OBJECTDIR}/_ext/7450142c/basic_display.o \
	${OBJECTDIR}/_ext/7450142c/strftime.o \
	${OBJECTDIR}/_ext/101a755a/bits.o \
	${OBJECTDIR}/_ext/101a755a/gdt.o \
	${OBJECTDIR}/_ext/101a755a/msr.o \
	${OBJECTDIR}/_ext/f336e79e/ata_disk.o \
	${OBJECTDIR}/_ext/f336e79e/kpaging.o \
	${OBJECTDIR}/_ext/9e02dec1/iodugging.o \
	${OBJECTDIR}/_ext/9e02dec1/memcpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcat.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcmp.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/strlen.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncmp.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/stroul.o \
	${OBJECTDIR}/_ext/3e0a6d34/strparts.o \
	${OBJECTDIR}/_ext/3e0a6d34/strstr.o \
	${OBJECTDIR}/_ext/3e0a6d34/strtol.o \
	${OBJECTDIR}/_ext/9e02dec1/time.o \
	${OBJECTDIR}/debugger.o \
	${OBJECTDIR}/panic.o \
	${OBJECTDIR}/src/_scheduler.o \
	${OBJECTDIR}/src/daemon/syslogd.o \
	${OBJECTDIR}/src/device.o \
	${OBJECTDIR}/src/dllist.o \
	${OBJECTDIR}/src/drivers/drv_genKeyboard.o \
	${OBJECTDIR}/src/drivers/terminal/termdrv.o \
	${OBJECTDIR}/src/drivers/terminal/tty_driver.o \
	${OBJECTDIR}/src/exceptions.o \
	${OBJECTDIR}/src/fat/fat_access.o \
	${OBJECTDIR}/src/fat/fat_cache.o \
	${OBJECTDIR}/src/fat/fat_filelib.o \
	${OBJECTDIR}/src/fat/fat_format.o \
	${OBJECTDIR}/src/fat/fat_misc.o \
	${OBJECTDIR}/src/fat/fat_string.o \
	${OBJECTDIR}/src/fat/fat_table.o \
	${OBJECTDIR}/src/fat/fat_write.o \
	${OBJECTDIR}/src/fat/taskSwitch.o \
	${OBJECTDIR}/src/filesystem/memdisk.o \
	${OBJECTDIR}/src/filesystem/pipe.o \
	${OBJECTDIR}/src/filesystem/procfs.o \
	${OBJECTDIR}/src/kIRQHandlers.o \
	${OBJECTDIR}/src/kInit.o \
	${OBJECTDIR}/src/kernel.o \
	${OBJECTDIR}/src/kernelISR.o \
	${OBJECTDIR}/src/keyboard.o \
	${OBJECTDIR}/src/mm/alloc.o \
	${OBJECTDIR}/src/mm/kmalloc.o \
	${OBJECTDIR}/src/mm/mm.o \
	${OBJECTDIR}/src/mm/mmap.o \
	${OBJECTDIR}/src/paging.o \
	${OBJECTDIR}/src/printfNew.o \
	${OBJECTDIR}/src/process.o \
	${OBJECTDIR}/src/schedule.o \
	${OBJECTDIR}/src/signals.o \
	${OBJECTDIR}/src/strtok.o \
	${OBJECTDIR}/src/strtrim.o \
	${OBJECTDIR}/src/sysDump.o \
	${OBJECTDIR}/src/syscall.o \
	${OBJECTDIR}/src/sysloader.o \
	${OBJECTDIR}/src/task.o \
	${OBJECTDIR}/src/utility.o \
	${OBJECTDIR}/src/vfs.o \
	${OBJECTDIR}/src/vsf_file_dir_list.o \
	${OBJECTDIR}/src/x86.o \
	${OBJECTDIR}/src/x86idt.o \
	${OBJECTDIR}/strreplace.o


# C Compiler Flags
CFLAGS=-m32 -ffreestanding -masm=intel

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -L/home/yogi/opt/cross/lib

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kernel

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kernel: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kernel ${OBJECTFILES} ${LDLIBSOPTIONS} -T linker.ld -ffreestanding -nostdlib

${OBJECTDIR}/_ext/9e029b58/asmFunctions.o: ../chrisOS/asm/asmFunctions.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/9e029b58
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/_ext/9e029b58/asmFunctions.o ../chrisOS/asm/asmFunctions.s

${OBJECTDIR}/_ext/734293bf/ahci.o: ../chrisOS/src/block/ahci.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/734293bf
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/734293bf/ahci.o ../chrisOS/src/block/ahci.c

${OBJECTDIR}/_ext/734293bf/pci.o: ../chrisOS/src/block/pci.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/734293bf
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/734293bf/pci.o ../chrisOS/src/block/pci.c

${OBJECTDIR}/_ext/7450142c/basic_display.o: ../chrisOS/src/char/console/basic_display.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/basic_display.o ../chrisOS/src/char/console/basic_display.c

${OBJECTDIR}/_ext/7450142c/strftime.o: ../chrisOS/src/char/console/strftime.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/strftime.o ../chrisOS/src/char/console/strftime.c

${OBJECTDIR}/_ext/101a755a/bits.o: ../chrisOS/src/cpu/bits.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/bits.o ../chrisOS/src/cpu/bits.c

${OBJECTDIR}/_ext/101a755a/gdt.o: ../chrisOS/src/cpu/gdt.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/gdt.o ../chrisOS/src/cpu/gdt.c

${OBJECTDIR}/_ext/101a755a/msr.o: ../chrisOS/src/cpu/msr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/msr.o ../chrisOS/src/cpu/msr.c

${OBJECTDIR}/_ext/f336e79e/ata_disk.o: ../chrisOS/src/init/ata_disk.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/ata_disk.o ../chrisOS/src/init/ata_disk.c

${OBJECTDIR}/_ext/f336e79e/kpaging.o: ../chrisOS/src/init/kpaging.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/kpaging.o ../chrisOS/src/init/kpaging.c

${OBJECTDIR}/_ext/9e02dec1/iodugging.o: ../chrisOS/src/iodugging.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/iodugging.o ../chrisOS/src/iodugging.c

${OBJECTDIR}/_ext/9e02dec1/memcpy.o: ../chrisOS/src/memcpy.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/memcpy.o ../chrisOS/src/memcpy.c

${OBJECTDIR}/_ext/3e0a6d34/strcat.o: ../chrisOS/src/strings/strcat.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcat.o ../chrisOS/src/strings/strcat.c

${OBJECTDIR}/_ext/3e0a6d34/strcmp.o: ../chrisOS/src/strings/strcmp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcmp.o ../chrisOS/src/strings/strcmp.c

${OBJECTDIR}/_ext/3e0a6d34/strcpy.o: ../chrisOS/src/strings/strcpy.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcpy.o ../chrisOS/src/strings/strcpy.c

${OBJECTDIR}/_ext/3e0a6d34/strlen.o: ../chrisOS/src/strings/strlen.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strlen.o ../chrisOS/src/strings/strlen.c

${OBJECTDIR}/_ext/3e0a6d34/strncmp.o: ../chrisOS/src/strings/strncmp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncmp.o ../chrisOS/src/strings/strncmp.c

${OBJECTDIR}/_ext/3e0a6d34/strncpy.o: ../chrisOS/src/strings/strncpy.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncpy.o ../chrisOS/src/strings/strncpy.c

${OBJECTDIR}/_ext/3e0a6d34/stroul.o: ../chrisOS/src/strings/stroul.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/stroul.o ../chrisOS/src/strings/stroul.c

${OBJECTDIR}/_ext/3e0a6d34/strparts.o: ../chrisOS/src/strings/strparts.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strparts.o ../chrisOS/src/strings/strparts.c

${OBJECTDIR}/_ext/3e0a6d34/strstr.o: ../chrisOS/src/strings/strstr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strstr.o ../chrisOS/src/strings/strstr.c

${OBJECTDIR}/_ext/3e0a6d34/strtol.o: ../chrisOS/src/strings/strtol.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strtol.o ../chrisOS/src/strings/strtol.c

${OBJECTDIR}/_ext/9e02dec1/time.o: ../chrisOS/src/time.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/time.o ../chrisOS/src/time.c

${OBJECTDIR}/debugger.o: debugger.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/debugger.o debugger.c

${OBJECTDIR}/panic.o: panic.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/panic.o panic.c

${OBJECTDIR}/src/_scheduler.o: src/_scheduler.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/src/_scheduler.o src/_scheduler.s

${OBJECTDIR}/src/daemon/syslogd.o: src/daemon/syslogd.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/daemon
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/daemon/syslogd.o src/daemon/syslogd.c

${OBJECTDIR}/src/device.o: src/device.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/device.o src/device.c

${OBJECTDIR}/src/dllist.o: src/dllist.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/dllist.o src/dllist.c

${OBJECTDIR}/src/drivers/drv_genKeyboard.o: src/drivers/drv_genKeyboard.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/drivers
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/drv_genKeyboard.o src/drivers/drv_genKeyboard.c

${OBJECTDIR}/src/drivers/terminal/termdrv.o: src/drivers/terminal/termdrv.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/drivers/terminal
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/terminal/termdrv.o src/drivers/terminal/termdrv.c

${OBJECTDIR}/src/drivers/terminal/tty_driver.o: src/drivers/terminal/tty_driver.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/drivers/terminal
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/terminal/tty_driver.o src/drivers/terminal/tty_driver.c

${OBJECTDIR}/src/exceptions.o: src/exceptions.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/exceptions.o src/exceptions.c

${OBJECTDIR}/src/fat/fat_access.o: src/fat/fat_access.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_access.o src/fat/fat_access.c

${OBJECTDIR}/src/fat/fat_cache.o: src/fat/fat_cache.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_cache.o src/fat/fat_cache.c

${OBJECTDIR}/src/fat/fat_filelib.o: src/fat/fat_filelib.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_filelib.o src/fat/fat_filelib.c

${OBJECTDIR}/src/fat/fat_format.o: src/fat/fat_format.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_format.o src/fat/fat_format.c

${OBJECTDIR}/src/fat/fat_misc.o: src/fat/fat_misc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_misc.o src/fat/fat_misc.c

${OBJECTDIR}/src/fat/fat_string.o: src/fat/fat_string.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_string.o src/fat/fat_string.c

${OBJECTDIR}/src/fat/fat_table.o: src/fat/fat_table.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_table.o src/fat/fat_table.c

${OBJECTDIR}/src/fat/fat_write.o: src/fat/fat_write.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_write.o src/fat/fat_write.c

${OBJECTDIR}/src/fat/taskSwitch.o: src/fat/taskSwitch.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/fat
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/src/fat/taskSwitch.o src/fat/taskSwitch.s

${OBJECTDIR}/src/filesystem/memdisk.o: src/filesystem/memdisk.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/filesystem
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/filesystem/memdisk.o src/filesystem/memdisk.c

${OBJECTDIR}/src/filesystem/pipe.o: src/filesystem/pipe.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/filesystem
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/filesystem/pipe.o src/filesystem/pipe.c

${OBJECTDIR}/src/filesystem/procfs.o: src/filesystem/procfs.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/filesystem
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/filesystem/procfs.o src/filesystem/procfs.c

${OBJECTDIR}/src/kIRQHandlers.o: src/kIRQHandlers.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kIRQHandlers.o src/kIRQHandlers.c

${OBJECTDIR}/src/kInit.o: src/kInit.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kInit.o src/kInit.c

${OBJECTDIR}/src/kernel.o: src/kernel.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kernel.o src/kernel.c

${OBJECTDIR}/src/kernelISR.o: src/kernelISR.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/src/kernelISR.o src/kernelISR.s

${OBJECTDIR}/src/keyboard.o: src/keyboard.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/keyboard.o src/keyboard.c

${OBJECTDIR}/src/mm/alloc.o: src/mm/alloc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/alloc.o src/mm/alloc.c

${OBJECTDIR}/src/mm/kmalloc.o: src/mm/kmalloc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/kmalloc.o src/mm/kmalloc.c

${OBJECTDIR}/src/mm/mm.o: src/mm/mm.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/mm.o src/mm/mm.c

${OBJECTDIR}/src/mm/mmap.o: src/mm/mmap.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/mmap.o src/mm/mmap.c

${OBJECTDIR}/src/paging.o: src/paging.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/paging.o src/paging.c

${OBJECTDIR}/src/printfNew.o: src/printfNew.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/printfNew.o src/printfNew.c

${OBJECTDIR}/src/process.o: src/process.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/process.o src/process.c

${OBJECTDIR}/src/schedule.o: src/schedule.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/schedule.o src/schedule.c

${OBJECTDIR}/src/signals.o: src/signals.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/signals.o src/signals.c

${OBJECTDIR}/src/strtok.o: src/strtok.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strtok.o src/strtok.c

${OBJECTDIR}/src/strtrim.o: src/strtrim.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strtrim.o src/strtrim.c

${OBJECTDIR}/src/sysDump.o: src/sysDump.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/sysDump.o src/sysDump.c

${OBJECTDIR}/src/syscall.o: src/syscall.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/syscall.o src/syscall.c

${OBJECTDIR}/src/sysloader.o: src/sysloader.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/sysloader.o src/sysloader.c

${OBJECTDIR}/src/task.o: src/task.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/task.o src/task.c

${OBJECTDIR}/src/utility.o: src/utility.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/utility.o src/utility.c

${OBJECTDIR}/src/vfs.o: src/vfs.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/vfs.o src/vfs.c

${OBJECTDIR}/src/vsf_file_dir_list.o: src/vsf_file_dir_list.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/vsf_file_dir_list.o src/vsf_file_dir_list.c

${OBJECTDIR}/src/x86.o: src/x86.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/src/x86.o src/x86.s

${OBJECTDIR}/src/x86idt.o: src/x86idt.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/x86idt.o src/x86idt.c

${OBJECTDIR}/strreplace.o: strreplace.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -DKERNEL_LOADED -Iinclude -I../chrisOS/include -Iinclude/lwext4 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/strreplace.o strreplace.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
