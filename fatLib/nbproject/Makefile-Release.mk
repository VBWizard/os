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
	${OBJECTDIR}/_ext/101a7ecb/fat_access.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_cache.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_format.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_misc.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_string.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_table.o \
	${OBJECTDIR}/_ext/101a7ecb/fat_write.o


# C Compiler Flags
CFLAGS=-ffreestanding -Wall -Wextra -masm=intel

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libfatLib.${CND_DLIB_EXT}

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libfatLib.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libfatLib.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -shared -fPIC

${OBJECTDIR}/_ext/101a7ecb/fat_access.o: ../chrisOS/src/fat/fat_access.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_access.o ../chrisOS/src/fat/fat_access.c

${OBJECTDIR}/_ext/101a7ecb/fat_cache.o: ../chrisOS/src/fat/fat_cache.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_cache.o ../chrisOS/src/fat/fat_cache.c

${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o: ../chrisOS/src/fat/fat_filelib.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_filelib.o ../chrisOS/src/fat/fat_filelib.c

${OBJECTDIR}/_ext/101a7ecb/fat_format.o: ../chrisOS/src/fat/fat_format.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_format.o ../chrisOS/src/fat/fat_format.c

${OBJECTDIR}/_ext/101a7ecb/fat_misc.o: ../chrisOS/src/fat/fat_misc.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_misc.o ../chrisOS/src/fat/fat_misc.c

${OBJECTDIR}/_ext/101a7ecb/fat_string.o: ../chrisOS/src/fat/fat_string.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_string.o ../chrisOS/src/fat/fat_string.c

${OBJECTDIR}/_ext/101a7ecb/fat_table.o: ../chrisOS/src/fat/fat_table.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_table.o ../chrisOS/src/fat/fat_table.c

${OBJECTDIR}/_ext/101a7ecb/fat_write.o: ../chrisOS/src/fat/fat_write.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/101a7ecb
	${RM} "$@.d"
	$(COMPILE.c) -O2 -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/101a7ecb/fat_write.o ../chrisOS/src/fat/fat_write.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libfatLib.${CND_DLIB_EXT}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
