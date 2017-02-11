/* 
 * File:   paging.h
 * Author: yogi
 *
 * Created on May 11, 2016, 7:31 PM
 */

#ifndef PAGING_H
#define	PAGING_H
#include <stdbool.h>
uint32_t kPagingGet4kPDEntryValue(uint32_t address);
uint32_t kPagingGet4kPDEntryAddress(uint32_t address);
uint32_t kPagingGet4kPTEntryAddress(uint32_t address);
uint32_t kPagingGet4kPTEntryValue(uint32_t address);
void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly);
void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present);
void kpagingUpdatePresentFlagV(uint32_t address, bool present);
void kMakePhysicalRangeRO(uint32_t startAddy, uint32_t endAddy);
void kSetVirtualRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly);
void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags);
void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse);
void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse);
#define RELOAD_CR3 __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
#endif	/* PAGING_H */

