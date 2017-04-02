/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//NOTE: alloc allocates a page on the heap, while malloc allocates space on the page

#include <stdbool.h>
#include "kmalloc.h"
#include "alloc.h"
#include "printf.h"
#include "../../../chrisOS/include/utility.h"  //for panic
#include "paging.h"
#include "i386/gdt.h"
#include "process.h"

heapPtrPage* kHeapPagePtr;
void* currAssignableMemoryPage;
int currAssignableMemoryPtr;
extern sGDT* bootGdt;
extern uint32_t getCS();
extern task_t* findTaskByCR3(uint32_t cr3);


#define NO_PREV_HEAP_PTR (heapPtrPage*)0xFFFFFFFE
#define NO_NEXT_HEAP_PTR (heapPtrPage*)0xFFFFFFFF
#define END_OF_MEMORY_PTRS 0xFFFFFFFF
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

void initHeapPagePtr(heapPtrPage* pagePtr);

void initKMalloc()
{
    kHeapPagePtr = allocPagesAndMap(sizeof(heapPtrPage));
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
    initHeapPagePtr(kHeapPagePtr);
}

void initHeapPagePtr(heapPtrPage* pagePtr)
{
    printd(DEBUG_KMALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
    pagePtr->next=NO_NEXT_HEAP_PTR;
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
    {
        pagePtr->ptrs[cnt].address=NULL;
        pagePtr->ptrs[cnt].size=0;
    }
    printd(DEBUG_KMALLOC,"initHeapPagePtr Done\n",pagePtr);
}

void* findFreeMallocPointer()
{
    heapPtrPage* ptrPg=kHeapPagePtr;
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_KMALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
        {
            printd(DEBUG_KMALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
            return &ptrPg->ptrs[cnt];
        }
        
        //If we've reached the last memory pointer on the page
        if (ptrPg->next==NO_NEXT_HEAP_PTR)
        {
            printd(DEBUG_KMALLOC,"No next heapPtrPage, creating one\n",ptrPg->next);
            //Create a new page and link it to the existing one
            newPtrPage=allocPagesAndMap(sizeof(heapPtrPage));
            initHeapPagePtr(newPtrPage);
            ptrPg->next=newPtrPage;
            newPtrPage->prev=ptrPg;
            printd(DEBUG_KMALLOC,"Initialized new heapPtrPage @ 0x%08X\n\n",newPtrPage);
        }
        printd(DEBUG_KMALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
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
        printd(DEBUG_KMALLOC,"aMTP: Size adjusted from %u to %u\n",size,newSize);
    }
    //*******************************************************************************
    allocdPage=allocPagesAndMap(newSize);
    printd(DEBUG_KMALLOC,"aMTP: Used allocPagesAndMap to allocate 0x%08X bytes at 0x%08X\n",ptr->size,allocdPage);
    uintptr_t virtualAddress=allocdPage;  //=pagingFindAvailableAddressToMapTo(CURRENT_CR3,newSize/PAGE_SIZE);
   ptr->address=virtualAddress;
}


void* kMalloc(size_t size)
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

//Called by syscall only
void* mallocI(uint32_t cr3, size_t size)
{
    uint32_t newSize, retVal;
    
   printd(DEBUG_KMALLOC,"mallocI: Entered ...\n");
    newSize=size;
     if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
        printd(DEBUG_KMALLOC,"mallocI: adjusted from %u to %u\n",size,newSize);
    }
    
    process_t* p=findTaskByCR3(cr3)->process;
    printd(DEBUG_KMALLOC,"mallocI: Found process 0x%04X\n",p->task->taskNum);
    uint32_t phys=(uint32_t)allocPages(size);
    printd(DEBUG_KMALLOC,"mallocI: Allocated 0x%08X bytes @ 0x%08X\n",size,phys);
    pagingMapPageCount(cr3,p->heapEnd,phys,newSize/PAGE_SIZE,0x7); //CLR 02/25/2017 - changed map page to map page count
    //Map phys to phys, kernel 
    pagingMapPageCount(KERNEL_CR3,phys,phys,newSize/PAGE_SIZE,0x7); //CLR 02/25/2017 - changed map page to map page count
    pagingMapPageCount(KERNEL_CR3,p->heapEnd,phys,newSize/PAGE_SIZE,0x7); //CLR 02/25/2017 - changed map page to map page count
    retVal=p->heapEnd;
    p->heapEnd+=newSize;
    printd(DEBUG_KMALLOC,"mallocI: returning 0x%08X\n",retVal);
   return retVal;
}