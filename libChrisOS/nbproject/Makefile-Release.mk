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
	${OBJECTDIR}/_ext/117d59b5/strcpy.o \
	${OBJECTDIR}/src/input.o \
	${OBJECTDIR}/src/libChrisOS.o \
	${OBJECTDIR}/src/malloc.o


# C Compiler Flags
CFLAGS=-ffreestanding -Wall -Wextra -masm=intel -fvisibility=hidden -Wl,-init,<function name>

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a

${OBJECTDIR}/_ext/117d59b5/strcpy.o: /home/yogi/src/os/libChrisOS/src/strcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/117d59b5
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/117d59b5/strcpy.o /home/yogi/src/os/libChrisOS/src/strcpy.c

${OBJECTDIR}/src/input.o: src/input.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/input.o src/input.c

${OBJECTDIR}/src/libChrisOS.o: src/libChrisOS.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/libChrisOS.o src/libChrisOS.c

${OBJECTDIR}/src/malloc.o: src/malloc.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/malloc.o src/malloc.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/liblibchrisos.a

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
