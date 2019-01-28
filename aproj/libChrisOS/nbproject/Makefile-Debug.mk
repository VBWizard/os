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
	${OBJECTDIR}/_ext/4459a81c/strchr.o \
	${OBJECTDIR}/_ext/4459a81c/strcspn.o \
	${OBJECTDIR}/_ext/4459a81c/strtok.o \
	${OBJECTDIR}/src/ascii.o \
	${OBJECTDIR}/src/environment.o \
	${OBJECTDIR}/src/file.o \
	${OBJECTDIR}/src/input/input.o \
	${OBJECTDIR}/src/libChrisOS.o \
	${OBJECTDIR}/src/libcmmap.o \
	${OBJECTDIR}/src/malloc.o \
	${OBJECTDIR}/src/memcpy.o \
	${OBJECTDIR}/src/memset.o \
	${OBJECTDIR}/src/pipe.o \
	${OBJECTDIR}/src/sprintf.o \
	${OBJECTDIR}/src/stdio.o \
	${OBJECTDIR}/src/strings/strcat.o \
	${OBJECTDIR}/src/strings/strcmp.o \
	${OBJECTDIR}/src/strings/strcpy.o \
	${OBJECTDIR}/src/strings/strisnum.o \
	${OBJECTDIR}/src/strings/strlen.o \
	${OBJECTDIR}/src/strings/strncmp.o \
	${OBJECTDIR}/src/strings/strncpy.o \
	${OBJECTDIR}/src/strings/stroul.o \
	${OBJECTDIR}/src/strings/strparts.o \
	${OBJECTDIR}/src/strings/strtol.o \
	${OBJECTDIR}/src/strings/strtrim.o \
	${OBJECTDIR}/src/strstr.o \
	${OBJECTDIR}/src/time.o


# C Compiler Flags
CFLAGS=-ffreestanding -Wall -Wextra -masm=intel -fvisibility=hidden -Wl,-init,libc_init

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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libc.${CND_DLIB_EXT}

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libc.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libc.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -nostdlib -T linker.ld -ffreestanding -shared -fPIC

${OBJECTDIR}/_ext/4459a81c/strchr.o: ../../kproj/chrisOS/src/strings/strchr.c
	${MKDIR} -p ${OBJECTDIR}/_ext/4459a81c
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/4459a81c/strchr.o ../../kproj/chrisOS/src/strings/strchr.c

${OBJECTDIR}/_ext/4459a81c/strcspn.o: ../../kproj/chrisOS/src/strings/strcspn.c
	${MKDIR} -p ${OBJECTDIR}/_ext/4459a81c
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/4459a81c/strcspn.o ../../kproj/chrisOS/src/strings/strcspn.c

${OBJECTDIR}/_ext/4459a81c/strtok.o: ../../kproj/chrisOS/src/strings/strtok.c
	${MKDIR} -p ${OBJECTDIR}/_ext/4459a81c
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/4459a81c/strtok.o ../../kproj/chrisOS/src/strings/strtok.c

${OBJECTDIR}/src/ascii.o: src/ascii.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ascii.o src/ascii.c

${OBJECTDIR}/src/environment.o: src/environment.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/environment.o src/environment.c

${OBJECTDIR}/src/file.o: src/file.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/file.o src/file.c

${OBJECTDIR}/src/input/input.o: src/input/input.c
	${MKDIR} -p ${OBJECTDIR}/src/input
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/input/input.o src/input/input.c

${OBJECTDIR}/src/libChrisOS.o: src/libChrisOS.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/libChrisOS.o src/libChrisOS.c

${OBJECTDIR}/src/libcmmap.o: src/libcmmap.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/libcmmap.o src/libcmmap.c

${OBJECTDIR}/src/malloc.o: src/malloc.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/malloc.o src/malloc.c

${OBJECTDIR}/src/memcpy.o: src/memcpy.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/memcpy.o src/memcpy.c

${OBJECTDIR}/src/memset.o: src/memset.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/memset.o src/memset.c

${OBJECTDIR}/src/pipe.o: src/pipe.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/pipe.o src/pipe.c

${OBJECTDIR}/src/sprintf.o: src/sprintf.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/sprintf.o src/sprintf.c

${OBJECTDIR}/src/stdio.o: src/stdio.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/stdio.o src/stdio.c

${OBJECTDIR}/src/strings/strcat.o: src/strings/strcat.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcat.o src/strings/strcat.c

${OBJECTDIR}/src/strings/strcmp.o: src/strings/strcmp.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcmp.o src/strings/strcmp.c

${OBJECTDIR}/src/strings/strcpy.o: src/strings/strcpy.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcpy.o src/strings/strcpy.c

${OBJECTDIR}/src/strings/strisnum.o: src/strings/strisnum.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strisnum.o src/strings/strisnum.c

${OBJECTDIR}/src/strings/strlen.o: src/strings/strlen.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strlen.o src/strings/strlen.c

${OBJECTDIR}/src/strings/strncmp.o: src/strings/strncmp.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strncmp.o src/strings/strncmp.c

${OBJECTDIR}/src/strings/strncpy.o: src/strings/strncpy.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strncpy.o src/strings/strncpy.c

${OBJECTDIR}/src/strings/stroul.o: src/strings/stroul.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/stroul.o src/strings/stroul.c

${OBJECTDIR}/src/strings/strparts.o: src/strings/strparts.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strparts.o src/strings/strparts.c

${OBJECTDIR}/src/strings/strtol.o: src/strings/strtol.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strtol.o src/strings/strtol.c

${OBJECTDIR}/src/strings/strtrim.o: src/strings/strtrim.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strtrim.o src/strings/strtrim.c

${OBJECTDIR}/src/strstr.o: src/strstr.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strstr.o src/strstr.c

${OBJECTDIR}/src/time.o: src/time.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -Iinclude -I../../kproj/chrisOS/include -I../../kproj/chrisOSKernel/include -fPIC  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/time.o src/time.c

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
