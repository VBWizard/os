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
	${OBJECTDIR}/_ext/7450142c/basic_display.o \
	${OBJECTDIR}/_ext/9e02dec1/memcpy.o \
	${OBJECTDIR}/_ext/9e02dec1/printf.o \
	${OBJECTDIR}/_ext/3e0a6d34/strlen.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/time.o


# C Compiler Flags
CFLAGS=-m32 -ffreestanding -Wall -Wextra -masm=intel

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -L/home/yogi/opt/cross/lib -L../libChrisOS/src -shared -lc

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/testmainprogramentry

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/testmainprogramentry: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/testmainprogramentry ${OBJECTFILES} ${LDLIBSOPTIONS} -T linker.ld -ffreestanding -nostdlib -lgcc

${OBJECTDIR}/_ext/7450142c/basic_display.o: ../chrisOS/src/char/console/basic_display.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/basic_display.o ../chrisOS/src/char/console/basic_display.c

${OBJECTDIR}/_ext/9e02dec1/memcpy.o: ../chrisOS/src/memcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/memcpy.o ../chrisOS/src/memcpy.c

${OBJECTDIR}/_ext/9e02dec1/printf.o: ../chrisOS/src/printf.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/printf.o ../chrisOS/src/printf.c

${OBJECTDIR}/_ext/3e0a6d34/strlen.o: ../chrisOS/src/strings/strlen.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strlen.o ../chrisOS/src/strings/strlen.c

${OBJECTDIR}/main.o: main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.c

${OBJECTDIR}/time.o: time.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -I../chrisOS/include -I../processManager/include -I../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/time.o time.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/testmainprogramentry

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
