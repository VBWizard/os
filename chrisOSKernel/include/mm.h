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
    void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse);
    void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse);
    uintptr_t mmGetFirstFreeVirtAddress(uintptr_t cr3, uintptr_t startVirt);

#endif	/* MM_H */

