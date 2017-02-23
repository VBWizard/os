/* 
 * File:   paging.h
 * Author: yogi
 *
 * Created on June 10, 2016, 9:34 AM
 */

#ifndef PAGING_H
#define	PAGING_H
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags);
uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind);
uint32_t pagingGet4kPDEntryValueCR3(uintptr_t PageDirAddress, uint32_t address);
uint32_t pagingGet4kPDEntryValue(uint32_t address);
uint32_t pagingGet4kPDEntryAddressCR3(uintptr_t PageDirAddress, uint32_t address);
uint32_t pagingGet4kPDEntryAddress(uint32_t address);
uint32_t pagingGet4kPTEntryAddressCR3(uintptr_t pageDirAddress, uint32_t address);
uint32_t pagingGet4kPTEntryAddress(uint32_t address);
uint32_t pagingGet4kPTEntryValueCR3(uintptr_t pageDirAddress, uint32_t address);
uint32_t pagingGet4kPTEntryValue(uint32_t address);

#define RELOAD_CR3 __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");

#endif	/* PAGING_H */

