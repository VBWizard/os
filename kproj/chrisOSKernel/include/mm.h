/* 
 * File:   mm.h
 * Author: yogi
 *
 * Created on June 1, 2016, 5:48 PM
 */

#ifndef MM_H
#define	MM_H

#include "kernel.h"
#include "i386/kPaging.h"
#include "charDev.h"
#include <stdbool.h>
#include <stdint.h>
#include "printf.h"
#include "paging.h"
#include "alloc.h"

#define ERROR_MM_CANNOT_ALLOCATE -1
    void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse);
    void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse);
    uintptr_t mmGetFreeVirtAddress(uintptr_t cr3, uintptr_t startVirt, int size);
    bool mmInitMMapPages(uintptr_t cr3, uintptr_t startVirt, int count, bool writable); //Set up not present mapping for each virtual page in the mmap
#endif	/* MM_H */

