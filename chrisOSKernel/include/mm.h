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

#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;});

#endif	/* MM_H */

