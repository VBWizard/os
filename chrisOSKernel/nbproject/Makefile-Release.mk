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
CND_PLATFORM=cross-Linux
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
	${OBJECTDIR}/_ext/7450142c/basic_display.o \
	${OBJECTDIR}/_ext/f33415e4/keyboard.o \
	${OBJECTDIR}/_ext/101a755a/bits.o \
	${OBJECTDIR}/_ext/f336e79e/ata_disk.o \
	${OBJECTDIR}/_ext/f336e79e/kpaging.o \
	${OBJECTDIR}/_ext/f336e79e/utility.o \
	${OBJECTDIR}/_ext/9e02dec1/memcpy.o \
	${OBJECTDIR}/_ext/9e02dec1/panic.o \
	${OBJECTDIR}/_ext/9e02dec1/printf.o \
	${OBJECTDIR}/_ext/3e0a6d34/strcpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/strlen.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncmp.o \
	${OBJECTDIR}/_ext/3e0a6d34/strncpy.o \
	${OBJECTDIR}/_ext/3e0a6d34/strparts.o \
	${OBJECTDIR}/_ext/9e02dec1/time.o \
	${OBJECTDIR}/src/drivers/drv_genKeyboard.o \
	${OBJECTDIR}/src/kernel.o \
	${OBJECTDIR}/src/mm/alloc.o \
	${OBJECTDIR}/src/mm/malloc.o \
	${OBJECTDIR}/src/mm/mm.o \
	${OBJECTDIR}/src/paging.o \
	${OBJECTDIR}/src/process.o \
	${OBJECTDIR}/src/syscall.o \
	${OBJECTDIR}/src/sysloader.o \
	${OBJECTDIR}/src/task.o


# C Compiler Flags
CFLAGS=-ffreestanding -Wall -Wextra -masm=intel -O

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -L/home/yogi/opt/cross/lib -Wl,-rpath,../fatLib/dist/Debug/cross-Linux -L../fatLib/dist/Debug/cross-Linux -lfatLib

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel: ../fatLib/dist/Debug/cross-Linux/libfatLib.so

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel ${OBJECTFILES} ${LDLIBSOPTIONS} -T linker.ld -ffreestanding -nostdlib -lgcc

${OBJECTDIR}/_ext/9e029b58/asmFunctions.o: ../chrisOS/asm/asmFunctions.s 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e029b58
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/_ext/9e029b58/asmFunctions.o ../chrisOS/asm/asmFunctions.s

${OBJECTDIR}/_ext/7450142c/basic_display.o: ../chrisOS/src/char/console/basic_display.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/basic_display.o ../chrisOS/src/char/console/basic_display.c

${OBJECTDIR}/_ext/f33415e4/keyboard.o: ../chrisOS/src/char/keyboard.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f33415e4
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f33415e4/keyboard.o ../chrisOS/src/char/keyboard.c

${OBJECTDIR}/_ext/101a755a/bits.o: ../chrisOS/src/cpu/bits.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a755a
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a755a/bits.o ../chrisOS/src/cpu/bits.c

${OBJECTDIR}/_ext/f336e79e/ata_disk.o: ../chrisOS/src/init/ata_disk.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/ata_disk.o ../chrisOS/src/init/ata_disk.c

${OBJECTDIR}/_ext/f336e79e/kpaging.o: ../chrisOS/src/init/kpaging.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/kpaging.o ../chrisOS/src/init/kpaging.c

${OBJECTDIR}/_ext/f336e79e/utility.o: ../chrisOS/src/init/utility.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f336e79e
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f336e79e/utility.o ../chrisOS/src/init/utility.c

${OBJECTDIR}/_ext/9e02dec1/memcpy.o: ../chrisOS/src/memcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/memcpy.o ../chrisOS/src/memcpy.c

${OBJECTDIR}/_ext/9e02dec1/panic.o: ../chrisOS/src/panic.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/panic.o ../chrisOS/src/panic.c

${OBJECTDIR}/_ext/9e02dec1/printf.o: ../chrisOS/src/printf.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/printf.o ../chrisOS/src/printf.c

${OBJECTDIR}/_ext/3e0a6d34/strcpy.o: ../chrisOS/src/strings/strcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strcpy.o ../chrisOS/src/strings/strcpy.c

${OBJECTDIR}/_ext/3e0a6d34/strlen.o: ../chrisOS/src/strings/strlen.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strlen.o ../chrisOS/src/strings/strlen.c

${OBJECTDIR}/_ext/3e0a6d34/strncmp.o: ../chrisOS/src/strings/strncmp.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncmp.o ../chrisOS/src/strings/strncmp.c

${OBJECTDIR}/_ext/3e0a6d34/strncpy.o: ../chrisOS/src/strings/strncpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strncpy.o ../chrisOS/src/strings/strncpy.c

${OBJECTDIR}/_ext/3e0a6d34/strparts.o: ../chrisOS/src/strings/strparts.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strparts.o ../chrisOS/src/strings/strparts.c

${OBJECTDIR}/_ext/9e02dec1/time.o: ../chrisOS/src/time.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/time.o ../chrisOS/src/time.c

${OBJECTDIR}/src/drivers/drv_genKeyboard.o: src/drivers/drv_genKeyboard.c 
	${MKDIR} -p ${OBJECTDIR}/src/drivers
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/drivers/drv_genKeyboard.o src/drivers/drv_genKeyboard.c

${OBJECTDIR}/src/kernel.o: src/kernel.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/kernel.o src/kernel.c

${OBJECTDIR}/src/mm/alloc.o: src/mm/alloc.c 
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/alloc.o src/mm/alloc.c

${OBJECTDIR}/src/mm/malloc.o: src/mm/malloc.c 
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/malloc.o src/mm/malloc.c

${OBJECTDIR}/src/mm/mm.o: src/mm/mm.c 
	${MKDIR} -p ${OBJECTDIR}/src/mm
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mm/mm.o src/mm/mm.c

${OBJECTDIR}/src/paging.o: src/paging.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/paging.o src/paging.c

${OBJECTDIR}/src/process.o: src/process.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/process.o src/process.c

${OBJECTDIR}/src/syscall.o: src/syscall.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/syscall.o src/syscall.c

${OBJECTDIR}/src/sysloader.o: src/sysloader.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/sysloader.o src/sysloader.c

${OBJECTDIR}/src/task.o: src/task.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/task.o src/task.c

# Subprojects
.build-subprojects:
	cd ../fatLib && ${MAKE}  -f Makefile CONF=Debug

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisoskernel

# Subprojects
.clean-subprojects:
	cd ../fatLib && ${MAKE}  -f Makefile CONF=Debug clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
