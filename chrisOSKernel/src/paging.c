#include <stdbool.h>
#include "chrisos.h"
#include "../../chrisOS/include/i386/bits/types.h"
#include "printf.h"
#include "i386/cpu.h"
#include "i386/gdt.h"
#include "i386/kPaging.h"
#include "kbd.h"
#include "paging.h"

extern uint64_t kE820MemoryBytes;
extern bool kDebugStartsNow;
extern void set_gdt(struct gdt_ptr *);
extern void doPagingJump();
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;
uint32_t kKernelPoolMemoryAddress;

#define PAGE_SIZE 0x1000

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
    kKernelPoolMemoryAddress+=0x1000;
    return lRetVal;
}

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
    return (uint32_t)*lTemp;
}

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
    printd(DEBUG_PAGING,"dirEntryAddress=0x%08x\n", lTemp);
    return (uint32_t)lTemp & 0xFFFFFFFF;
}

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
}

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
    return *pTablePtr;
}

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
    if (readOnly)
       *ptEntry&=0xFFFFFFFD;
    else
       *ptEntry|=2; 
    RELOAD_CR3
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
}

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
         if (present)
             *ptEntry=*ptEntry | 1;
         else
             *ptEntry&=0xFFFFFFFE;
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
}

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
    pagingUpdatePTEPresentFlag(pagePTE, present);
}

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
}

///Map a page to a new address
///mapFrom is the original address
///mapTo is the new address that the page will be available at
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(mapTo>>22)];
    if (ptrVal==0)
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",mapTo,pageDirAddress,  *ptrT);
        ptr[(mapTo>>22)]=0x20000063;
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)pageDirAddress;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
        printd(DEBUG_PAGING,"2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
    }
}

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
        return false;
    return true;
}

void unMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uint8_t newFlags)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(mapTo>>22)];
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)pageDirAddress;
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
    }
}

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
        panic("fix this!!!");
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
