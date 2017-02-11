/* 
 * File:   paging.h
 * Author: yogi
 *
 * Created on June 10, 2016, 9:34 AM
 */

#ifndef PAGING_H
#define	PAGING_H

void pagingMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags);

#endif	/* PAGING_H */

