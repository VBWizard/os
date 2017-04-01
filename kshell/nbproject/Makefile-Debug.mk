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
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/kshell.o


# C Compiler Flags
CFLAGS=-masm=intel -ffreestanding -nostdlib

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-Wl,-rpath,/home/yogi/src/os/libChrisOS/dist/Debug/cross-Linux -L/home/yogi/src/os/libChrisOS/dist/Debug/cross-Linux -lc

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kshell

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kshell: /home/yogi/src/os/libChrisOS/dist/Debug/cross-Linux/libc.so

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kshell: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kshell ${OBJECTFILES} ${LDLIBSOPTIONS} -ffreestanding -nostdlib -lgcc -T linker.ld

${OBJECTDIR}/kshell.o: kshell.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I/home/yogi/src/os/libChrisOS/include -I../chrisOSKernel/include -I../chrisOS/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/kshell.o kshell.c

# Subprojects
.build-subprojects:
	cd /home/yogi/src/os/libChrisOS && ${MAKE}  -f Makefile CONF=Debug

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/kshell

# Subprojects
.clean-subprojects:
	cd /home/yogi/src/os/libChrisOS && ${MAKE}  -f Makefile CONF=Debug clean

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
