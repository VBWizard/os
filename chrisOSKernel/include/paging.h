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

#endif	/* PAGING_H */

