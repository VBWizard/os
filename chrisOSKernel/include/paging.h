/* 
 * File:   paging.h
 * Author: yogi
 *
 * Created on June 10, 2016, 9:34 AM
 */

#ifndef PAGING_H
#define	PAGING_H
#include <stdbool.h>
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags);
void pagingMapPageRange(uintptr_t pageDirAddress, uintptr_t startVirtualAddress, uintptr_t endVirtualAddress, uintptr_t startPhysicalAddress,uint8_t flags);
void pagingMapPageCount(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress,int pageCount, uint8_t flags);
uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind);
uint32_t pagingGet4kPDEntryValueCR3(uintptr_t PageDirAddress, uint32_t address);
uint32_t pagingGet4kPDEntryValue(uint32_t address);
uint32_t pagingGet4kPDEntryAddressCR3(uintptr_t PageDirAddress, uint32_t address);
uint32_t pagingGet4kPDEntryAddress(uint32_t address);
uint32_t pagingGet4kPTEntryAddressCR3(uintptr_t pageDirAddress, uint32_t address);
uint32_t pagingGet4kPTEntryAddress(uint32_t address);
uint32_t pagingGet4kPTEntryValueCR3(uintptr_t pageDirAddress, uint32_t address);
uint32_t pagingGet4kPTEntryValue(uint32_t address);
bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address);
bool pagingMapPageIntoKernel(uintptr_t processCR3, uintptr_t virtualAddress, uint8_t flags);
#define RELOAD_CR3 __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");

#endif	/* PAGING_H */