/* 
 * File:   mm.h
 * Author: yogi
 *
 * Created on June 1, 2016, 5:48 PM
 */

#ifndef MM_H
#define	MM_H

#include "kernel.h"
void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse);
void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse);
void buildTaskPaging(uint32_t* cr3);
#endif	/* MM_H */

