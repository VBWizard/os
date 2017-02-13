/* 
 * File:   alloc.h
 * Author: yogi
 *
 * Created on June 9, 2016, 11:40 PM
 */

#ifndef ALLOC_H
#define	ALLOC_H

typedef struct smeminfo
{
    uintptr_t* prior;       //4
    uint32_t address;       //4
    uint32_t size;          //4
    bool inUse;             //4
    uint32_t pid;           //4
    uint32_t cr3;           //4
    uintptr_t* next;        //4
} sMemInfo;                 //28


uintptr_t* malloc(uint32_t size);
uintptr_t* kMalloc(uint32_t size, uint32_t align);
uint32_t memAvailable();

#endif	/* ALLOC_H */

