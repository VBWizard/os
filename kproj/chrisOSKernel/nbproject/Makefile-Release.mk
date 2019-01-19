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
CND_CONF=Release
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
	${OBJECTDIR}/_ext/101a7ecb/fat_access.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_cache.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_format.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_misc.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_string.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_table.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_write.o \
	${OBJECTDIR}/_ext/101a7ecb/taskSwitch.o \
	${OBJECTDIR}/_ext/f336e79e/ata_disk.o \
	${OBJECTDIR}/_ext/f336e79e/kpaging.o \
	${OBJECTDIR}/_ext/f336e79e/utility.o \
	${OBJECTDIR}/_ext/9e02dec1/iodugging.o \
	${OBJECTDIR}/_ext/9e02dec1/memcpy.o \
	${OBJECTDIR}/_ext/9e02dec1/panic.o \
	${OBJECTDIR}/_ext/9e02dec1/printf.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcat.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcmp.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/strlen.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncmp.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/stroul.o \
	${OBJECTDIR}/_ext/3e0a6d34/strparts.o \
	${OBJECTDIR}/_ext/3e0a6d34/strtol.o \
	${OBJECTDIR}/_ext/3e0a6d34/strtrim.o \
	${OBJECTDIR}/_ext/9e02dec1/time.o \
	${OBJECTDIR}/src/_scheduler.o \
	${OBJECTDIR}/src/device.o \
	${OBJECTDIR}/src/dllist.o \
	${OBJECTDIR}/src/drivers/drv_genKeyboard.o \
	${OBJECTDIR}/src/drivers/terminal.o \
	${OBJECTDIR}/src/exceptions.o \
	${OBJECTDIR}/src/filesystem/pipe.o \
	${OBJECTDIR}/src/fs.o \
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
	${OBJECTDIR}/src/syscall.o \
	${OBJECTDIR}/src/sysloader.o \
	${OBJECTDIR}/src/task.o \
	${OBJECTDIR}/src/x86.o \
	${OBJECTDIR}/src/x86idt.o


# C Compiler Flags
CFLAGS=-ffreestanding -masm=intel

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel ${OBJECTFILES} ${LDLIBSOPTIONS} -T linker.ld -ffreestanding -nostdlib -lgcc

${OBJECTDIR}/_ext/9e029b58/asmFunctions.o: ../chrisOS/asm/asmFunctions.s
	${MKDIR} -p ${OBJECTDIR}/_ext/9e029b58
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/_ext/9e029b58/asmFunctions.o ../chrisOS/asm/asmFunctions.s

${OBJECTDIR}/_ext/734293bf/ahci.o: ../chrisOS/src/block/ahci.c
	${MKDIR} -p ${OBJECTDIR}/_ext/734293bf
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/734293bf/ahci.o ../chrisOS/src/block/ahci.c

${OBJECTDIR}/_ext/734293bf/pci.o: ../chrisOS/src/block/pci.c
	${MKDIR} -p ${OBJECTDIR}/_ext/734293bf
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/734293bf/pci.o ../chrisOS/src/block/pci.c

${OBJECTDIR}/_ext/7450142c/basic_display.o: ../chrisOS/src/char/console/basic_display.c
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/basic_display.o ../chrisOS/src/char/console/basic_display.c

${OBJECTDIR}/_ext/7450142c/strftime.o: ../chrisOS/src/char/console/strftime.c
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/strftime.o ../chrisOS/src/char/console/strftime.c

${OBJECTDIR}/_ext/101a755a/bits.o: ../chrisOS/src/cpu/bits.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/bits.o ../chrisOS/src/cpu/bits.c

${OBJECTDIR}/_ext/101a755a/gdt.o: ../chrisOS/src/cpu/gdt.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/gdt.o ../chrisOS/src/cpu/gdt.c

${OBJECTDIR}/_ext/101a755a/msr.o: ../chrisOS/src/cpu/msr.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/msr.o ../chrisOS/src/cpu/msr.c

${OBJECTDIR}/_ext/101a7ecb/fat_access.o: ../chrisOS/src/fat/fat_access.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_access.o ../chrisOS/src/fat/fat_access.c

${OBJECTDIR}/_ext/101a7ecb/fat_cache.o: ../chrisOS/src/fat/fat_cache.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_cache.o ../chrisOS/src/fat/fat_cache.c

${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o: ../chrisOS/src/fat/fat_filelib.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o ../chrisOS/src/fat/fat_filelib.c

${OBJECTDIR}/_ext/101a7ecb/fat_format.o: ../chrisOS/src/fat/fat_format.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_format.o ../chrisOS/src/fat/fat_format.c

${OBJECTDIR}/_ext/101a7ecb/fat_misc.o: ../chrisOS/src/fat/fat_misc.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_misc.o ../chrisOS/src/fat/fat_misc.c

${OBJECTDIR}/_ext/101a7ecb/fat_string.o: ../chrisOS/src/fat/fat_string.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_string.o ../chrisOS/src/fat/fat_string.c

${OBJECTDIR}/_ext/101a7ecb/fat_table.o: ../chrisOS/src/fat/fat_table.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_table.o ../chrisOS/src/fat/fat_table.c

${OBJECTDIR}/_ext/101a7ecb/fat_write.o: ../chrisOS/src/fat/fat_write.c
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_write.o ../chrisOS/src/fat/fat_write.c

${OBJECTDIR}/_ext/101a7ecb/taskSwitch.o: ../chrisOS/src/fat/taskSwitch.s
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/_ext/101a7ecb/taskSwitch.o ../chrisOS/src/fat/taskSwitch.s

${OBJECTDIR}/_ext/f336e79e/ata_disk.o: ../chrisOS/src/init/ata_disk.c
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/ata_disk.o ../chrisOS/src/init/ata_disk.c

${OBJECTDIR}/_ext/f336e79e/kpaging.o: ../chrisOS/src/init/kpaging.c
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/kpaging.o ../chrisOS/src/init/kpaging.c

${OBJECTDIR}/_ext/f336e79e/utility.o: ../chrisOS/src/init/utility.c
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/utility.o ../chrisOS/src/init/utility.c

${OBJECTDIR}/_ext/9e02dec1/iodugging.o: ../chrisOS/src/iodugging.c
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/iodugging.o ../chrisOS/src/iodugging.c

${OBJECTDIR}/_ext/9e02dec1/memcpy.o: ../chrisOS/src/memcpy.c
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/memcpy.o ../chrisOS/src/memcpy.c

${OBJECTDIR}/_ext/9e02dec1/panic.o: ../chrisOS/src/panic.c
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/panic.o ../chrisOS/src/panic.c

${OBJECTDIR}/_ext/9e02dec1/printf.o: ../chrisOS/src/printf.c
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/printf.o ../chrisOS/src/printf.c

${OBJECTDIR}/_ext/3e0a6d34/strcat.o: ../chrisOS/src/strings/strcat.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcat.o ../chrisOS/src/strings/strcat.c

${OBJECTDIR}/_ext/3e0a6d34/strcmp.o: ../chrisOS/src/strings/strcmp.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcmp.o ../chrisOS/src/strings/strcmp.c

${OBJECTDIR}/_ext/3e0a6d34/strcpy.o: ../chrisOS/src/strings/strcpy.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcpy.o ../chrisOS/src/strings/strcpy.c

${OBJECTDIR}/_ext/3e0a6d34/strlen.o: ../chrisOS/src/strings/strlen.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strlen.o ../chrisOS/src/strings/strlen.c

${OBJECTDIR}/_ext/3e0a6d34/strncmp.o: ../chrisOS/src/strings/strncmp.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncmp.o ../chrisOS/src/strings/strncmp.c

${OBJECTDIR}/_ext/3e0a6d34/strncpy.o: ../chrisOS/src/strings/strncpy.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncpy.o ../chrisOS/src/strings/strncpy.c

${OBJECTDIR}/_ext/3e0a6d34/stroul.o: ../chrisOS/src/strings/stroul.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/stroul.o ../chrisOS/src/strings/stroul.c

${OBJECTDIR}/_ext/3e0a6d34/strparts.o: ../chrisOS/src/strings/strparts.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strparts.o ../chrisOS/src/strings/strparts.c

${OBJECTDIR}/_ext/3e0a6d34/strtol.o: ../chrisOS/src/strings/strtol.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strtol.o ../chrisOS/src/strings/strtol.c

${OBJECTDIR}/_ext/3e0a6d34/strtrim.o: ../chrisOS/src/strings/strtrim.c
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strtrim.o ../chrisOS/src/strings/strtrim.c

${OBJECTDIR}/_ext/9e02dec1/time.o: ../chrisOS/src/time.c
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/time.o ../chrisOS/src/time.c

${OBJECTDIR}/src/_scheduler.o: src/_scheduler.s
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/src/_scheduler.o src/_scheduler.s

${OBJECTDIR}/src/device.o: src/device.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/device.o src/device.c

${OBJECTDIR}/src/dllist.o: src/dllist.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/dllist.o src/dllist.c

${OBJECTDIR}/src/drivers/drv_genKeyboard.o: src/drivers/drv_genKeyboard.c
	${MKDIR} -p ${OBJECTDIR}/src/drivers
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/drv_genKeyboard.o src/drivers/drv_genKeyboard.c

${OBJECTDIR}/src/drivers/terminal.o: src/drivers/terminal.c
	${MKDIR} -p ${OBJECTDIR}/src/drivers
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/terminal.o src/drivers/terminal.c

${OBJECTDIR}/src/exceptions.o: src/exceptions.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/exceptions.o src/exceptions.c

${OBJECTDIR}/src/filesystem/pipe.o: src/filesystem/pipe.c
	${MKDIR} -p ${OBJECTDIR}/src/filesystem
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/filesystem/pipe.o src/filesystem/pipe.c

${OBJECTDIR}/src/fs.o: src/fs.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fs.o src/fs.c

${OBJECTDIR}/src/kIRQHandlers.o: src/kIRQHandlers.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kIRQHandlers.o src/kIRQHandlers.c

${OBJECTDIR}/src/kInit.o: src/kInit.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kInit.o src/kInit.c

${OBJECTDIR}/src/kernel.o: src/kernel.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kernel.o src/kernel.c

${OBJECTDIR}/src/kernelISR.o: src/kernelISR.s
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/src/kernelISR.o src/kernelISR.s

${OBJECTDIR}/src/keyboard.o: src/keyboard.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/keyboard.o src/keyboard.c

${OBJECTDIR}/src/mm/alloc.o: src/mm/alloc.c
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/alloc.o src/mm/alloc.c

${OBJECTDIR}/src/mm/kmalloc.o: src/mm/kmalloc.c
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/kmalloc.o src/mm/kmalloc.c

${OBJECTDIR}/src/mm/mm.o: src/mm/mm.c
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/mm.o src/mm/mm.c

${OBJECTDIR}/src/mm/mmap.o: src/mm/mmap.c
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/mmap.o src/mm/mmap.c

${OBJECTDIR}/src/paging.o: src/paging.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/paging.o src/paging.c

${OBJECTDIR}/src/printfNew.o: src/printfNew.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/printfNew.o src/printfNew.c

${OBJECTDIR}/src/process.o: src/process.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/process.o src/process.c

${OBJECTDIR}/src/schedule.o: src/schedule.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/schedule.o src/schedule.c

${OBJECTDIR}/src/signals.o: src/signals.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/signals.o src/signals.c

${OBJECTDIR}/src/syscall.o: src/syscall.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/syscall.o src/syscall.c

${OBJECTDIR}/src/sysloader.o: src/sysloader.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/sysloader.o src/sysloader.c

${OBJECTDIR}/src/task.o: src/task.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/task.o src/task.c

${OBJECTDIR}/src/x86.o: src/x86.s
	${MKDIR} -p ${OBJECTDIR}/src
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/src/x86.o src/x86.s

${OBJECTDIR}/src/x86idt.o: src/x86idt.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/x86idt.o src/x86idt.c

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
