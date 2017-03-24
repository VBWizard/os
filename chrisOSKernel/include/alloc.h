/* 
 * File:   alloc.h
 * Author: yogi
 *
 * Created on June 9, 2016, 11:40 PM
 */

#include <stdint.h>

#ifndef ALLOC_H
#define	ALLOC_H

#include "chrisos.h"

typedef struct smeminfo
{
    uintptr_t* prev;       //4
    uint32_t address;       //4
    uint32_t size;          //4
    bool inUse;             //4
    uint32_t pid;           //4
    uint32_t cr3;           //4
    uintptr_t* next;        //4
} sMemInfo;                 //28


void* allocPages(uint32_t size);
void* allocPagesAndMap(uint32_t size);
void freePage(void* address);
uint32_t memAvailable();

#endif	/* ALLOC_H */

