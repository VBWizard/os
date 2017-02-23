/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//NOTE: alloc allocates a page on the heap, while malloc allocates space on the page

#include <stdbool.h>
#include "malloc.h"
#include "alloc.h"
#include "printf.h"
#include "../../../chrisOS/include/utility.h"  //for panic
#include "paging.h"
#include "i386/gdt.h"

heapPtrPage* kHeapPagePtr;
void* currAssignableMemoryPage;
int currAssignableMemoryPtr;
extern sGDT* bootGdt;
extern uint32_t getCS();

#define NO_PREV_HEAP_PTR (heapPtrPage*)0xFFFFFFFE
#define NO_NEXT_HEAP_PTR (heapPtrPage*)0xFFFFFFFF
#define END_OF_MEMORY_PTRS 0xFFFFFFFF
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

void initHeapPagePtr(heapPtrPage* pagePtr);

void initMalloc()
{
    kHeapPagePtr = allocPagesAndMap(sizeof(heapPtrPage));
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
    initHeapPagePtr(kHeapPagePtr);
}

void initHeapPagePtr(heapPtrPage* pagePtr)
{
    printd(DEBUG_MALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
    pagePtr->next=NO_NEXT_HEAP_PTR;
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
    {
        pagePtr->ptrs[cnt].address=NULL;
        pagePtr->ptrs[cnt].size=0;
    }
    printd(DEBUG_MALLOC,"initHeapPagePtr Done\n",pagePtr);
}

void* findFreeMallocPointer()
{
    heapPtrPage* ptrPg=kHeapPagePtr;
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
        {
            printd(DEBUG_MALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
            return &ptrPg->ptrs[cnt];
        }
        
        //If we've reached the last memory pointer on the page
        if (ptrPg->next==NO_NEXT_HEAP_PTR)
        {
            printd(DEBUG_MALLOC,"No next heapPtrPage, creating one\n",ptrPg->next);
            //Create a new page and link it to the existing one
            newPtrPage=allocPagesAndMap(sizeof(heapPtrPage));
            initHeapPagePtr(newPtrPage);
            ptrPg->next=newPtrPage;
            newPtrPage->prev=ptrPg;
            printd(DEBUG_MALLOC,"Initialized new heapPtrPage @ 0x%08X\n\n",newPtrPage);
        }
        printd(DEBUG_MALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
        ptrPg=(heapPtrPage*)ptrPg->next;
    }
    panic("findFreeMallocPointer: Should not have gotten to this point");
}

void allocateMemoryToProcess(heapPtr* ptr, size_t size, bool isKernel)
{
    uint32_t newSize=size;
    uint32_t* allocdPage;
    
    //While we are using allocPages, we need to adjust the size to a multiple of 4096
    //*******************************************************************************
    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
        printd(DEBUG_MALLOC,"aMTP: Size adjusted from %u to %u\n",size,newSize);
    }
    //*******************************************************************************
    allocdPage=allocPagesAndMap(newSize);
    printd(DEBUG_MALLOC,"aMTP: Used allocPagesAndMap to allocate 0x%08X bytes at 0x%08X\n",ptr->size,allocdPage);
    uintptr_t virtualAddress=allocdPage;  //=pagingFindAvailableAddressToMapTo(CURRENT_CR3,newSize/PAGE_SIZE);
   ptr->address=virtualAddress;
}


void* malloc(size_t size)
{
    uint32_t cs=getCS()>>3;
    bool isKernel=(bootGdt[cs].access & 0x60)==0x0;
    
    heapPtr* ptr;
    //First find a page to place the memory pointer on
    ptr=findFreeMallocPointer();
    //Next get a memory address to point to and map the memory into the process
    
    ptr->address=0;
    ptr->size=size;
    allocateMemoryToProcess(ptr,size,isKernel);
    return ptr->address;
}