#include <stdint.h>
#include "printf.h"
#include "paging.h"
#include "alloc.h"


extern uint32_t kmmHeapMemoryBaseAddress,kMallocBaseAddress,kMallocCurrAddress;
extern int heapMemoryBlockAvailIndMax;
extern uint32_t* heapMemoryBlockAvailInd;
extern sMemInfo* heapMemoryInfo;
extern uint32_t **kTicksSinceStart;

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
        if (mInfo->address==(uintptr_t)address)
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
            return (sMemInfo*)mInfo;
        }
        mInfo++;
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
    return NULL;
}

//Returns a block with enough memory to fulfill the request
sMemInfo* findAvailableBlockBySize(uint32_t pSize)
{
    //The first sMemInfo is the one with all of the available space, but we want to first see if there is another block that was previously
    //allocated, which has space to fulfill this request.
    //So we will skip the first sMemInfo when others are available, and only come back to use it if no other is found
    sMemInfo* mInfo=heapMemoryInfo;

    //Skip the master block
    if (mInfo->next)
    {
        mInfo=mInfo->next;
        do
        {
            //Found an mInfo bigger than or equal to the required size, and it isn't in use, so return it
            //a later call to allocateFromBlock will break off a piece of memory big enough to fulfill the request if necessary
            //and make a new sMemInfo for the remaining memory
            if (!mInfo->inUse)
                if (mInfo->size >= pSize)
                {
                    printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Reusing previously allocated block at address 0x%08x, size =  0x%08x (zeroed)\n",mInfo->address, mInfo->size);
                    pagingMapPageCount(KERNEL_CR3, 
                            mInfo->address, 
                            mInfo->address, 
                            pSize%PAGE_SIZE==0?pSize/PAGE_SIZE: (pSize/PAGE_SIZE)+1, 0x7, true);
                    memset((uintptr_t*)mInfo->address, 0, pSize);
                    return mInfo;
                }
            mInfo++;
        } 
    while (mInfo->next);
    }
    //Instead of panicking like we used to do we'll first check to see if the first (big) sMemInfo has space to fulfill the requests
    if (heapMemoryInfo->size > pSize)
    {
        printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning the address of the master block at address 0x%08X\n",heapMemoryInfo);
        return heapMemoryInfo;
    }
    panic("findAvailableBlockBySize: Memory appears to be exhausted.  Iterated all of the memory blocks and couldn't find one with enough space to use!\n");
}

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
    sMemInfo* mNewInfo=findEmptyBlock();
    sMemInfo* mPriorInfo=mNewInfo-1;
    uint32_t taskNum;
    __asm__("str eax\nshr eax,3\n":"=a" (taskNum));
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
    
    mPriorInfo->next=(sMemInfo*)mNewInfo;
    
    //Set up the new sMemInfo
    mNewInfo->prev=(sMemInfo*)mPriorInfo;
    mNewInfo->address=mInfoToAllocateFrom->address;
    mNewInfo->size=size;
    mNewInfo->inUse=true;
    mNewInfo->useCount++;
    mNewInfo->pid=taskNum;
    mNewInfo->lastAllocTicks=*kTicksSinceStart;
    mInfoToAllocateFrom->address+=size;
    mInfoToAllocateFrom->size-=size;
    return (uintptr_t*)mNewInfo->address;
}

void* allocPages(uint32_t size)
{
    uint32_t newSize=size;
    uint32_t taskNum;
    __asm__("str eax\nshr eax,3\n":"=a" (taskNum));

    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Size adjusted from %u to %u\n",size,newSize);
    }
    uintptr_t* lRetVal;
    //CLR 2/2/2019: TODO: Remove me.  Temporary code to find other code requesting 0 bytes of memory
    if (size==0)
    {
        printd(DEBUG_EXCEPTIONS, "allocPages: Request for 0 bytes of memory, nothing to see here, move on\n");
        return NULL;
    }
    printd(DEBUG_MEMORY_MANAGEMENT, "allocPages: Request for %u bytes of memory (adjusted to %u).  Finding an available sMemInfo block\n", size, newSize);
    sMemInfo* block=findAvailableBlockBySize(newSize);
    //CLR 02/02/2019: Removed block->inUse=true ... was setting the base block to inuse
    if ( block->size > newSize)
       lRetVal=allocateBlockFrom(block,newSize);
    else
    {
        lRetVal=(void*)block->address;
        block->inUse=true;
        block->useCount++;
        block->pid=taskNum;
    }
    return lRetVal;
}

//Allocates pages and maps both into the process' mapping and the kernel's
void* allocPagesAndMapI(uintptr_t cr3,uint32_t size)
{
    uintptr_t* phys;
    uint32_t newSize=size;

    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: Size adjusted from %u to %u\n",size,newSize);
    }
    
    phys=allocPages(newSize);
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: allocPage'd 0x%08X bytes at 0x%08X\n",newSize,phys);
    //Using random mappings isn't working, it stomps on other things
    //uintptr_t virtualAddress=pagingFindAvailableAddressToMapTo(cr3,newSize/PAGE_SIZE);
    
    //Map page into cr3 address space
    pagingMapPageCount(cr3, (uintptr_t)phys, (uintptr_t)phys, newSize/PAGE_SIZE, 0x7, true); //CLR 02/25/2017 - changed map page to map page count
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: Mapped v=0x%08X to p=0x%08X\n",phys,phys);
    pagingMapPageCount(KERNEL_CR3, (uint32_t)(phys) | 0xC0000000, (uintptr_t)phys, newSize/PAGE_SIZE, 0x7, true); //CLR 02/25/2017 - changed map page to map page count
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: Mapped v=0x%08X to p=0x%08X\n",(uint32_t)(phys) | 0xC0000000,phys);
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: Zeroing out page(s) at 0x%08X for 0x%08X\n",phys,newSize);
    //Zero out the memory
    memset(phys,0,newSize);
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPagesAndMap: Returning address 0x%08X\n",phys);
    return (void*)((uint32_t)(phys) & 0xFFFFF000);
}

void* allocProcessPages(uintptr_t cr3, uint32_t size)
{
    return allocPagesAndMapI(cr3,size);
}

//Allocates full pages (PAGE_SIZE) and maps them
void* allocPagesAndMap(uint32_t size)
{
    return allocPagesAndMapI(CURRENT_CR3, size);
}

void freeI(uintptr_t cr3, void* physAddress, uintptr_t* virtAddress)
{
    sMemInfo* mInfo = findBlockByMemoryAddress(physAddress);
    int pageCounter=0;
    
    if (mInfo!=NULL)
        if (mInfo->inUse)
        {
            //Clear everything except address and size because this is still a valid sMemInfo, and we can't give the memory
            //back to the master block (although we might merge free blocks back into master later
            mInfo->inUse=false;
            mInfo->cr3 = 0;
            mInfo->pid = 0;
            if (virtAddress!=NULL)
                for (uintptr_t cnt=mInfo->address;cnt<mInfo->address+mInfo->size;cnt+=PAGE_SIZE)
                    pagingMapPage(cr3, (uintptr_t)virtAddress+(pageCounter*PAGE_SIZE), mInfo->address, 0x0);
            printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,physAddress);
        }
        else
            printd(DEBUG_MEMORY_MANAGEMENT,"Block 0x%08x for memory address 0x%08 already freed, doing nothing\n",mInfo,physAddress);
            
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",physAddress);
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