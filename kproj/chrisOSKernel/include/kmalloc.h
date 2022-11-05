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
    
#define NO_PREV_HEAP_PTR (heapPtrPage*)0xFFFFFFFE
#define NO_NEXT_HEAP_PTR (heapPtrPage*)0xFFFFFFFF
#define END_OF_MEMORY_PTRS 0xFFFFFFFF
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})
    
    typedef struct s_heapptr    //8
    {
        void* address;          //4
        size_t size;            //4
    } heapPtr;

    #define POINTERS_PER_HEAP_PTR_PAGE (PAGE_SIZE/sizeof(heapPtr))-1 //The -1 is 8 bytes for prev and next

    typedef struct s_heapptr_page
    {
        void* prev;                     //4
        heapPtr ptrs[(PAGE_SIZE/sizeof(heapPtr))-1]; //-1=8 bytes, which covers our prev & next
        void* next;                     //4
    } heapPtrPage;

    void* kMalloc(size_t size);
    void* kCalloc(size_t num, size_t size);
    void* mallocI(uint32_t cr3, size_t size);
    void kFree(void* address);

    heapPtrPage* kHeapPagePtr;

#ifdef __cplusplus
}
#endif

#endif /* MALLOC_H */

