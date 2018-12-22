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
CND_CONF=Release_No_Optimization
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/asm/asmFunctions.o \
	${OBJECTDIR}/asm/boot.o \
	${OBJECTDIR}/asm/bootCPU.o \
	${OBJECTDIR}/asm/isr.o \
	${OBJECTDIR}/src/block/ahci.o \
	${OBJECTDIR}/src/block/pci.o \
	${OBJECTDIR}/src/bootShell.o \
	${OBJECTDIR}/src/char/console/basic_display.o \
	${OBJECTDIR}/src/char/console/strftime.o \
	${OBJECTDIR}/src/char/keyboard.o \
	${OBJECTDIR}/src/cpu/acpi.o \
	${OBJECTDIR}/src/cpu/apic.o \
	${OBJECTDIR}/src/cpu/bits.o \
	${OBJECTDIR}/src/cpu/gdt.o \
	${OBJECTDIR}/src/cpu/identify_cpu_features.o \
	${OBJECTDIR}/src/cpu/idt.o \
	${OBJECTDIR}/src/cpu/irqHandlers.o \
	${OBJECTDIR}/src/cpu/msr.o \
	${OBJECTDIR}/src/cpu/ports.o \
	${OBJECTDIR}/src/cpu/smp.o \
	${OBJECTDIR}/src/debugger/debugger.o \
	${OBJECTDIR}/src/fat/fat_access.o \
	${OBJECTDIR}/src/fat/fat_cache.o \
	${OBJECTDIR}/src/fat/fat_filelib.o \
	${OBJECTDIR}/src/fat/fat_format.o \
	${OBJECTDIR}/src/fat/fat_misc.o \
	${OBJECTDIR}/src/fat/fat_string.o \
	${OBJECTDIR}/src/fat/fat_table.o \
	${OBJECTDIR}/src/fat/fat_write.o \
	${OBJECTDIR}/src/filesystem/mbr.o \
	${OBJECTDIR}/src/init/ata_disk.o \
	${OBJECTDIR}/src/init/cpudet-clean.o \
	${OBJECTDIR}/src/init/e820.o \
	${OBJECTDIR}/src/init/init.o \
	${OBJECTDIR}/src/init/initPaging.o \
	${OBJECTDIR}/src/init/kpaging.o \
	${OBJECTDIR}/src/init/utility.o \
	${OBJECTDIR}/src/iodugging.o \
	${OBJECTDIR}/src/memcpy.o \
	${OBJECTDIR}/src/newloader.o \
	${OBJECTDIR}/src/panic.o \
	${OBJECTDIR}/src/printf.o \
	${OBJECTDIR}/src/strings/strcat.o \
	${OBJECTDIR}/src/strings/strcmp.o \
	${OBJECTDIR}/src/strings/strcpy.o \
	${OBJECTDIR}/src/strings/strlen.o \
	${OBJECTDIR}/src/strings/strncmp.o \
	${OBJECTDIR}/src/strings/strncpy.o \
	${OBJECTDIR}/src/strings/stroul.o \
	${OBJECTDIR}/src/strings/strparts.o \
	${OBJECTDIR}/src/strings/strtol.o \
	${OBJECTDIR}/src/strings/strtrim.o \
	${OBJECTDIR}/src/time.o


# C Compiler Flags
CFLAGS=-m32 -pipe -ffreestanding -masm=intel -Wno-unused-function

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=-msyntax=intel

# Link Libraries and Options
LDLIBSOPTIONS=-L/usr/local/lib -L/home/yogi/opt/cross/lib -static -lcpuid

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisos

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisos: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/chrisos ${OBJECTFILES} ${LDLIBSOPTIONS} -T linker.ld -ffreestanding -nostdlib -lgcc

${OBJECTDIR}/asm/asmFunctions.o: asm/asmFunctions.s
	${MKDIR} -p ${OBJECTDIR}/asm
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/asm/asmFunctions.o asm/asmFunctions.s

${OBJECTDIR}/asm/boot.o: asm/boot.s
	${MKDIR} -p ${OBJECTDIR}/asm
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/asm/boot.o asm/boot.s

${OBJECTDIR}/asm/bootCPU.o: asm/bootCPU.s
	${MKDIR} -p ${OBJECTDIR}/asm
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/asm/bootCPU.o asm/bootCPU.s

${OBJECTDIR}/asm/isr.o: asm/isr.s
	${MKDIR} -p ${OBJECTDIR}/asm
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/asm/isr.o asm/isr.s

${OBJECTDIR}/src/block/ahci.o: src/block/ahci.c
	${MKDIR} -p ${OBJECTDIR}/src/block
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/block/ahci.o src/block/ahci.c

${OBJECTDIR}/src/block/pci.o: src/block/pci.c
	${MKDIR} -p ${OBJECTDIR}/src/block
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/block/pci.o src/block/pci.c

${OBJECTDIR}/src/bootShell.o: src/bootShell.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/bootShell.o src/bootShell.c

${OBJECTDIR}/src/char/console/basic_display.o: src/char/console/basic_display.c
	${MKDIR} -p ${OBJECTDIR}/src/char/console
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/char/console/basic_display.o src/char/console/basic_display.c

${OBJECTDIR}/src/char/console/strftime.o: src/char/console/strftime.c
	${MKDIR} -p ${OBJECTDIR}/src/char/console
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/char/console/strftime.o src/char/console/strftime.c

${OBJECTDIR}/src/char/keyboard.o: src/char/keyboard.c
	${MKDIR} -p ${OBJECTDIR}/src/char
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/char/keyboard.o src/char/keyboard.c

${OBJECTDIR}/src/cpu/acpi.o: src/cpu/acpi.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/acpi.o src/cpu/acpi.c

${OBJECTDIR}/src/cpu/apic.o: src/cpu/apic.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/apic.o src/cpu/apic.c

${OBJECTDIR}/src/cpu/bits.o: src/cpu/bits.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/bits.o src/cpu/bits.c

${OBJECTDIR}/src/cpu/gdt.o: src/cpu/gdt.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/gdt.o src/cpu/gdt.c

${OBJECTDIR}/src/cpu/identify_cpu_features.o: src/cpu/identify_cpu_features.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/identify_cpu_features.o src/cpu/identify_cpu_features.c

${OBJECTDIR}/src/cpu/idt.o: src/cpu/idt.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/idt.o src/cpu/idt.c

${OBJECTDIR}/src/cpu/irqHandlers.o: src/cpu/irqHandlers.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/irqHandlers.o src/cpu/irqHandlers.c

${OBJECTDIR}/src/cpu/msr.o: src/cpu/msr.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/msr.o src/cpu/msr.c

${OBJECTDIR}/src/cpu/ports.o: src/cpu/ports.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/ports.o src/cpu/ports.c

${OBJECTDIR}/src/cpu/smp.o: src/cpu/smp.c
	${MKDIR} -p ${OBJECTDIR}/src/cpu
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/cpu/smp.o src/cpu/smp.c

${OBJECTDIR}/src/debugger/debugger.o: src/debugger/debugger.c
	${MKDIR} -p ${OBJECTDIR}/src/debugger
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/debugger/debugger.o src/debugger/debugger.c

${OBJECTDIR}/src/fat/fat_access.o: src/fat/fat_access.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_access.o src/fat/fat_access.c

${OBJECTDIR}/src/fat/fat_cache.o: src/fat/fat_cache.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_cache.o src/fat/fat_cache.c

${OBJECTDIR}/src/fat/fat_filelib.o: src/fat/fat_filelib.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_filelib.o src/fat/fat_filelib.c

${OBJECTDIR}/src/fat/fat_format.o: src/fat/fat_format.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_format.o src/fat/fat_format.c

${OBJECTDIR}/src/fat/fat_misc.o: src/fat/fat_misc.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_misc.o src/fat/fat_misc.c

${OBJECTDIR}/src/fat/fat_string.o: src/fat/fat_string.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_string.o src/fat/fat_string.c

${OBJECTDIR}/src/fat/fat_table.o: src/fat/fat_table.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_table.o src/fat/fat_table.c

${OBJECTDIR}/src/fat/fat_write.o: src/fat/fat_write.c
	${MKDIR} -p ${OBJECTDIR}/src/fat
	${RM} "$@.d"
	$(COMPILE.c) -O2 -w -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/fat/fat_write.o src/fat/fat_write.c

${OBJECTDIR}/src/filesystem/mbr.o: src/filesystem/mbr.c
	${MKDIR} -p ${OBJECTDIR}/src/filesystem
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/filesystem/mbr.o src/filesystem/mbr.c

${OBJECTDIR}/src/init/ata_disk.o: src/init/ata_disk.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/ata_disk.o src/init/ata_disk.c

${OBJECTDIR}/src/init/cpudet-clean.o: src/init/cpudet-clean.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/cpudet-clean.o src/init/cpudet-clean.c

${OBJECTDIR}/src/init/e820.o: src/init/e820.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/e820.o src/init/e820.c

${OBJECTDIR}/src/init/init.o: src/init/init.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/init.o src/init/init.c

${OBJECTDIR}/src/init/initPaging.o: src/init/initPaging.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/initPaging.o src/init/initPaging.c

${OBJECTDIR}/src/init/kpaging.o: src/init/kpaging.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/kpaging.o src/init/kpaging.c

${OBJECTDIR}/src/init/utility.o: src/init/utility.c
	${MKDIR} -p ${OBJECTDIR}/src/init
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/init/utility.o src/init/utility.c

${OBJECTDIR}/src/iodugging.o: src/iodugging.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/iodugging.o src/iodugging.c

${OBJECTDIR}/src/memcpy.o: src/memcpy.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/memcpy.o src/memcpy.c

${OBJECTDIR}/src/newloader.o: src/newloader.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/newloader.o src/newloader.c

${OBJECTDIR}/src/panic.o: src/panic.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/panic.o src/panic.c

${OBJECTDIR}/src/printf.o: src/printf.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/printf.o src/printf.c

${OBJECTDIR}/src/strings/strcat.o: src/strings/strcat.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcat.o src/strings/strcat.c

${OBJECTDIR}/src/strings/strcmp.o: src/strings/strcmp.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcmp.o src/strings/strcmp.c

${OBJECTDIR}/src/strings/strcpy.o: src/strings/strcpy.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strcpy.o src/strings/strcpy.c

${OBJECTDIR}/src/strings/strlen.o: src/strings/strlen.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strlen.o src/strings/strlen.c

${OBJECTDIR}/src/strings/strncmp.o: src/strings/strncmp.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strncmp.o src/strings/strncmp.c

${OBJECTDIR}/src/strings/strncpy.o: src/strings/strncpy.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strncpy.o src/strings/strncpy.c

${OBJECTDIR}/src/strings/stroul.o: src/strings/stroul.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/stroul.o src/strings/stroul.c

${OBJECTDIR}/src/strings/strparts.o: src/strings/strparts.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strparts.o src/strings/strparts.c

${OBJECTDIR}/src/strings/strtol.o: src/strings/strtol.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strtol.o src/strings/strtol.c

${OBJECTDIR}/src/strings/strtrim.o: src/strings/strtrim.c
	${MKDIR} -p ${OBJECTDIR}/src/strings
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/strings/strtrim.o src/strings/strtrim.c

${OBJECTDIR}/src/time.o: src/time.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -O2 -I/usr/local/include -I/usr/local/include/libcpuid -Iinclude -I../../chrisOSKernel/include -Iinclude -Iinclude/bits -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/time.o src/time.c

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
