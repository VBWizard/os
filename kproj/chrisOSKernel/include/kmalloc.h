/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   malloc.h
 * Author: yogi
 *
 * Created on February 14, 2017, 6:08 AM
 */


#ifndef MALLOC_H
#define MALLOC_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stddef.h>
#include "../../chrisOS/include/chrisos.h"
    
    typedef struct s_heapptr
    {
        void* address;     //4
        size_t size;            //4
    } heapPtr;

    #define POINTERS_PER_HEAP_PTR_PAGE (PAGE_SIZE/sizeof(heapPtr))-1 //The -1 is 8 bytes for prev and next

    typedef struct s_heapptr_page
    {
        void* prev;                     //4
        heapPtr ptrs[(PAGE_SIZE/sizeof(heapPtr))-1];
        void* next;                     //4
    } heapPtrPage;

void* kMalloc(size_t size);
void* mallocI(uint32_t cr3, size_t size);
void kFree(void* address);

#ifdef __cplusplus
}
#endif

#endif /* MALLOC_H */

