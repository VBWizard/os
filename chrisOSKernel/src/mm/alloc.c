#include <stdint.h>
#include "chrisos.h"
#include "printf.h"
#include "paging.h"
#include "alloc.h"


extern uint32_t kmmHeapMemoryBaseAddress,kMallocBaseAddress,kMallocCurrAddress;
extern int heapMemoryBlockAvailIndMax;
extern uint32_t* heapMemoryBlockAvailInd;
extern sMemInfo* heapMemoryInfo;

#define MEMORY_BLOCK_SIZE 0x1000

#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

//Returns pointer to first empty block found
sMemInfo* findEmptyBlock()
{
    sMemInfo* mInfo=heapMemoryInfo;
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
    {
        if (mInfo->next==NULL)
        {
            lRetVal=mInfo+1;
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
            return lRetVal;
        }
         mInfo++;
    }
    printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: No empty block found, returning NULL\n");
    return NULL;
}

sMemInfo* findBlockByMemoryAddress(uintptr_t* address)
{
    sMemInfo* mInfo=heapMemoryInfo;
    do
    {
        if (mInfo->address==address)
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
            return (sMemInfo*)mInfo;
        }
        mInfo++;
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
    return NULL;
}

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
    sMemInfo* mInfo=heapMemoryInfo;
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
    {
        if (mInfo->size>=pSize && (!mInfo->inUse))
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
            return (uintptr_t*)mInfo;
        }
        mInfo--;
    }
}

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
    sMemInfo* mNewInfo=findEmptyBlock();
    sMemInfo* mPriorInfo=mNewInfo-1;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
    
    mPriorInfo->next=(uintptr_t*)mNewInfo;
    
    //Set up the new sMemInfo
    mNewInfo->prior=(uintptr_t*)mPriorInfo;
    mNewInfo->address=mInfoToAllocateFrom->address;
    mNewInfo->size=size;
    mNewInfo->inUse=true;
    mNewInfo->cr3=CURRENT_CR3;
    //mNewInfo pid and next don't get set
    
    mInfoToAllocateFrom->address+=size;
    mInfoToAllocateFrom->size-=size;
    return (uintptr_t*)mNewInfo->address;
}

uintptr_t* malloc(uint32_t size)
{
    uint32_t newSize=size;
    if (newSize%MEMORY_BLOCK_SIZE)
    {
        newSize+=(MEMORY_BLOCK_SIZE-(size % MEMORY_BLOCK_SIZE));
        printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Size adjusted from %u to %u\n",size,newSize);
    }
    uintptr_t* lRetVal;
    uintptr_t* block=findAvailableBlockBySize(newSize);
    if ( ((sMemInfo*)(block))->size > newSize)
       lRetVal=allocateBlockFrom((sMemInfo*)block,newSize);
    else
        lRetVal=((sMemInfo*)(block))->address;
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Returning address 0x%08X\n",lRetVal);
    //Zero out the memory
    memset(lRetVal,0,newSize);
    //pagingMapPage();
    return lRetVal;
}

void free(uintptr_t* address)
{
    sMemInfo* mInfo = findBlockByMemoryAddress(address);
    if (mInfo!=NULL)
    {
        mInfo->inUse=false;
        printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,address);
    }
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",address);
}

uintptr_t* mallocA1k(uint32_t size)
{
    uintptr_t* lRetVal=0;
    
    return lRetVal;
}

uint32_t memAvailable()
{
    uint32_t lRetVal;
    sMemInfo* mInfo=heapMemoryInfo;

    do
    {
        if (!mInfo->inUse)
            lRetVal+=mInfo->size;
        mInfo++;
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
    return lRetVal;
}

/*
uintptr_t* kMmalloc(uint32_t size)
{
    uint32_t lRetVal;
    //printd(DEBUG_MEMORY_MANAGEMENT,"mallocA: Aligned kMallocCurrAddress from 0x%08X to ",kMallocCurrAddress);
    kMallocCurrAddress=(kMallocCurrAddress+0x1000) & (0xFFFFF000);
    //printd(DEBUG_MEMORY_MANAGEMENT,"0x%08X\n",kMallocCurrAddress);
    
    lRetVal=malloc(size);
    printd(DEBUG_MEMORY_MANAGEMENT,"mallocA: Returning address 0x%08X\n",lRetVal);
    return lRetVal;
}

//Allocates memory from the kernel pool, within the always mapped 0xC0000000-0xCFFFFFFF range
//NOTE: bits 9-11 of a page-table entry are available.  Bit 11 will be used as an "in use" indicator.
//That way we can quickly scan the page tables for non-used entries, rather than keep a table of tables
uintptr_t kmalloc()
{
   
}
*/