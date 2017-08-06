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
	${OBJECTDIR}/_ext/7450142c/basic_display.o \
	${OBJECTDIR}/_ext/9e02dec1/memcpy.o \
	${OBJECTDIR}/_ext/9e02dec1/panic.o \
	${OBJECTDIR}/_ext/9e02dec1/printf.o \
	${OBJECTDIR}/_ext/3e0a6d34/strlen.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/start.o


# C Compiler Flags
CFLAGS=

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myhelloworld2

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myhelloworld2: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myhelloworld2 ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/7450142c/basic_display.o: ../chrisOS/src/char/console/basic_display.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/7450142c
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/7450142c/basic_display.o ../chrisOS/src/char/console/basic_display.c

${OBJECTDIR}/_ext/9e02dec1/memcpy.o: ../chrisOS/src/memcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/memcpy.o ../chrisOS/src/memcpy.c

${OBJECTDIR}/_ext/9e02dec1/panic.o: ../chrisOS/src/panic.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/panic.o ../chrisOS/src/panic.c

${OBJECTDIR}/_ext/9e02dec1/printf.o: ../chrisOS/src/printf.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/9e02dec1
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/9e02dec1/printf.o ../chrisOS/src/printf.c

${OBJECTDIR}/_ext/3e0a6d34/strlen.o: ../chrisOS/src/strings/strlen.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/3e0a6d34
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/3e0a6d34/strlen.o ../chrisOS/src/strings/strlen.c

${OBJECTDIR}/main.o: main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.c

${OBJECTDIR}/start.o: start.s 
	${MKDIR} -p ${OBJECTDIR}
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/start.o start.s

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/myhelloworld2

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc