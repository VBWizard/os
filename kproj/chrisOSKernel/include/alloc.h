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

#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

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
void freeA(void* address);
uint32_t memAvailable();

#endif	/* ALLOC_H */

