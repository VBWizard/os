/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   malloc.h
 * Author: yogi
 *
 * Created on March 23, 2017, 7:50 PM
 */

#ifndef MALLOC_H
#define MALLOC_H

/*Malloc creates a heap within the program's mapped memory.  The start of this
 heap is currently statically defined by the constant HEAP_START and the potential
 end of the heap is HEAP_END, so you can only allocate 1.25GB to any one process
 
 Malloc starts with no memory allocated to it.  When it needs memory to fulfill a request,
 it asks the kernel for memory.  The kernel only returns memory in PAGE_SIZE chunks,
 so if a program asks for 1 byte of memory, malloc requests 1 page.  After fulfilling the initial
 request, Malloc keeps track of how much memory is left on the page, and
 if it can fulfill the next request with the memory it has left on the page, it does so
 without asking the kernel for more memory.

 Malloc is not responsible for mapping the memory returned by the kernel into the program's
 mapped memory.  The kernel uses HEAP_START for every program 
 */


#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "time.h"
    
//This is the minimum request size for a call to the kernel to ALLOC memory. 
#define ALLOC_REQUEST_SIZE 0x32000
#define ALLOC_MARKER_VALUE 0xB00F00D0
    typedef struct sheap
    {
        uint32_t marker;
        uint32_t len;
        bool inUse;
        struct sheap* prev;
    } heaprec_t;

uint32_t heapBase;    
uint32_t heapCurr;
uint32_t heapEnd;
long libcTZ;

void initmalloc();
void* malloc(size_t size);
void*  mallocI(size_t size);
void malloc_cleanup();
void* reallocI(void *foldptr, int newlen);
void free(void* fpointer);
void freeI(void* fpointer);
#ifdef __cplusplus
}
#endif

#endif /* MALLOC_H */

