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
	${OBJECTDIR}/_ext/117d59b5/memcpy.o \
	${OBJECTDIR}/_ext/117d59b5/memset.o \
	${OBJECTDIR}/_ext/85a4b428/strcat.o \
	${OBJECTDIR}/_ext/85a4b428/strcmp.o \
	${OBJECTDIR}/_ext/85a4b428/strcpy.o \
	${OBJECTDIR}/_ext/85a4b428/strlen.o \
	${OBJECTDIR}/_ext/85a4b428/strncmp.o \
	${OBJECTDIR}/_ext/85a4b428/strncpy.o \
	${OBJECTDIR}/_ext/85a4b428/stroul.o \
	${OBJECTDIR}/_ext/85a4b428/strparts.o \
	${OBJECTDIR}/_ext/85a4b428/strtol.o \
	${OBJECTDIR}/_ext/85a4b428/strtrim.o \
	${OBJECTDIR}/src/input/input.o \
	${OBJECTDIR}/src/libChrisOS.o \
	${OBJECTDIR}/src/malloc.o \
	${OBJECTDIR}/src/time.o


# C Compiler Flags
CFLAGS=-m32 -ffreestanding -Wall -Wextra -masm=intel -fvisibility=hidden -Wl,-init,<function name>

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

${OBJECTDIR}/_ext/117d59b5/memcpy.o: /home/yogi/src/os/libChrisOS/src/memcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/117d59b5
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/117d59b5/memcpy.o /home/yogi/src/os/libChrisOS/src/memcpy.c

${OBJECTDIR}/_ext/117d59b5/memset.o: /home/yogi/src/os/libChrisOS/src/memset.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/117d59b5
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/117d59b5/memset.o /home/yogi/src/os/libChrisOS/src/memset.c

${OBJECTDIR}/_ext/85a4b428/strcat.o: /home/yogi/src/os/libChrisOS/src/strings/strcat.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strcat.o /home/yogi/src/os/libChrisOS/src/strings/strcat.c

${OBJECTDIR}/_ext/85a4b428/strcmp.o: /home/yogi/src/os/libChrisOS/src/strings/strcmp.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strcmp.o /home/yogi/src/os/libChrisOS/src/strings/strcmp.c

${OBJECTDIR}/_ext/85a4b428/strcpy.o: /home/yogi/src/os/libChrisOS/src/strings/strcpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strcpy.o /home/yogi/src/os/libChrisOS/src/strings/strcpy.c

${OBJECTDIR}/_ext/85a4b428/strlen.o: /home/yogi/src/os/libChrisOS/src/strings/strlen.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strlen.o /home/yogi/src/os/libChrisOS/src/strings/strlen.c

${OBJECTDIR}/_ext/85a4b428/strncmp.o: /home/yogi/src/os/libChrisOS/src/strings/strncmp.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strncmp.o /home/yogi/src/os/libChrisOS/src/strings/strncmp.c

${OBJECTDIR}/_ext/85a4b428/strncpy.o: /home/yogi/src/os/libChrisOS/src/strings/strncpy.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strncpy.o /home/yogi/src/os/libChrisOS/src/strings/strncpy.c

${OBJECTDIR}/_ext/85a4b428/stroul.o: /home/yogi/src/os/libChrisOS/src/strings/stroul.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/stroul.o /home/yogi/src/os/libChrisOS/src/strings/stroul.c

${OBJECTDIR}/_ext/85a4b428/strparts.o: /home/yogi/src/os/libChrisOS/src/strings/strparts.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strparts.o /home/yogi/src/os/libChrisOS/src/strings/strparts.c

${OBJECTDIR}/_ext/85a4b428/strtol.o: /home/yogi/src/os/libChrisOS/src/strings/strtol.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strtol.o /home/yogi/src/os/libChrisOS/src/strings/strtol.c

${OBJECTDIR}/_ext/85a4b428/strtrim.o: /home/yogi/src/os/libChrisOS/src/strings/strtrim.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/85a4b428
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/85a4b428/strtrim.o /home/yogi/src/os/libChrisOS/src/strings/strtrim.c

${OBJECTDIR}/src/input/input.o: src/input/input.c 
	${MKDIR} -p ${OBJECTDIR}/src/input
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/input/input.o src/input/input.c

${OBJECTDIR}/src/libChrisOS.o: src/libChrisOS.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/libChrisOS.o src/libChrisOS.c

${OBJECTDIR}/src/malloc.o: src/malloc.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/malloc.o src/malloc.c

${OBJECTDIR}/src/time.o: src/time.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -Iinclude -I../chrisOSKernel/include -I../chrisOS/include -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/time.o src/time.c

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
