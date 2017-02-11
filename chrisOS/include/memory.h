/* 
 * File:   memory.h
 * Author: yogi
 *
 * Created on April 27, 2016, 4:41 PM
 */

#ifndef MEMORY_H
#define	MEMORY_H
#include "i386/bits/types.h"
#include <stddef.h>
#include "chrisos.h"

#define SWITCH_TO_NON_KERNEL_DATA_AND_STACK __asm__("push eax\nmov eax,0x18\nmov ds,eax\nmov es,eax\nmov fs,eax\nmov gs,eax\nmov ss,eax\npop eax");
#define SWITCH_TO_KERNEL_DATA_AND_STACK __asm__("push eax\nmov eax,0x10\nmov ds,eax\nmov es,eax\nmov fs,eax\nmov gs,eax\nmov ss,eax\npop eax");

int getInt12Memory();
int isE820Available();
// SMAP entry structure
typedef struct  {
	uint32_t BaseL; // base address uint64_t
	uint32_t BaseH;
	uint32_t LengthL; // length uint64_t
	uint32_t LengthH;
	uint32_t Type; // entry Type
	uint32_t ACPI; // extended
}__attribute__((packed)) SMAP_entry;
//e820.c
void __attribute__((noinline)) __attribute__((regparm(3))) detectE820Memory(SMAP_entry* buffer, int maxentries);
void print_e820_map(SMAP_entry* buffer, int entryCount);
void printE820Map();
uint64_t sum_e820_usable_memory(SMAP_entry* buffer, int entryCount);
void *memset(void *d1, int val, size_t len);
void * memcpy(void *s1, const void *s2, size_t n);
int getE820Memory_asm(void);
void initializeKernelPaging(void);
#define __pa(x)                 ((unsigned long)(x)-KERNEL_PAGED_BASE_ADDRESS)
#define __va(x)                 ((void *)((unsigned long)(x)+KERNEL_PAGED_BASE_ADDRESS))
#endif	/* MEMORY_H */

