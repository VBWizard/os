/* 
 * File:   initVars.h
 * Author: yogi
 *
 * Created on April 27, 2016, 4:31 PM
 */
#ifndef INITVARS_H
#define	INITVARS_H
#include "i386/gdt.h"
#include "memory.h"
#include "utility.h"
#include "ata_disk.h"
#include "../chrisos.h"
#include "pci/pci.h"
#include "../i386/cpu.h"
#include "filesystem.h"
#include "../kernelObjects.h"

//NOTE: This is a temporary idt pointer ... only used during init
struct idt_ptr kInitialIDTReg;
#endif	/* INITVARS_H */

