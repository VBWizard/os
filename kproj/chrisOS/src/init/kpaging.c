#include <stdbool.h>
#include "chrisos.h"
#include "i386/bits/types.h"
#include "printf.h"
#include "i386/cpu.h"
#include "i386/gdt.h"
#include "i386/kPaging.h"
#include "kbd.h"

extern uint64_t kE820MemoryBytes;
extern bool kDebugStartsNow;
extern void set_gdt(struct gdt_ptr *);
extern void doPagingJump();
extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;



uint32_t kPagingGet4kPDEntryValueCR3(uintptr_t PageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    //uintptr_t*pageDirEntry=(uintptr_t*)((PageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
    uintptr_t* lTemp=(uint32_t*)((PageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kPagingGet4kPDEntryValueCR3: dirAddressPtr=0x%08x (PDIR=0x%08X)\n", *lTemp,PageDirAddress);
#endif
    return (uint32_t)*lTemp;
}

uint32_t kPagingGet4kPDEntryValue(uint32_t address)
{
    return kPagingGet4kPDEntryValueCR3(KERNEL_CR3,address);
}

uint32_t kPagingGet4kPDEntryAddressCR3(uintptr_t PageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t lTemp=((PageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kPagingGet4kPDEntryAddressCR3: dirEntryAddress=0x%08x  (PDIR=0x%08X)\n", lTemp, PageDirAddress);
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}

uint32_t kPagingGet4kPDEntryAddress(uint32_t address)
{
    return kPagingGet4kPDEntryAddressCR3(KERNEL_CR3,address);
}

uint32_t kPagingGet4kPTEntryAddressCR3(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t pDirPtr=kPagingGet4kPDEntryValueCR3(pageDirAddress,address) & 0xFFFFF000;
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
}

uint32_t kPagingGet4kPTEntryAddress(uint32_t address)
{
    return kPagingGet4kPTEntryAddressCR3(KERNEL_CR3,address);
}

uint32_t kPagingGet4kPTEntryValueCR3(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)kPagingGet4kPTEntryAddressCR3(pageDirAddress,address);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
             printd(DEBUG_PAGING,"kPagingGet4kPTEntryValueCR3: PTAddress=0x%08X, PTValue=0x%08X (PDIR=0x%08X)\n", pTablePtr,*pTablePtr,pageDirAddress);
#endif
    return *pTablePtr;
}

uint32_t kPagingGet4kPTEntryValue(uint32_t address)
{
    return kPagingGet4kPTEntryValueCR3(KERNEL_CR3,address);
}




void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
#endif
         if (readOnly)
            *ptEntry&=0xFFFFFFFD;
         else
            *ptEntry|=2; 
    RELOAD_CR3
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
#endif
}

void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
         if (present)
             *ptEntry=*ptEntry | 1;
         else
             *ptEntry&=0xFFFFFFFE;
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
}

void kSetVirtualRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
        //for cnt=0;cnt<=8192;cnt+=4096
}

//Absolute version, page passed is already virtual
void kpagingUpdatePresentFlagA(uint32_t address, bool present)
{
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
#endif
        uintptr_t* pagePTE= (uintptr_t*)kPagingGet4kPTEntryAddress(address&0xFFFFF000);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
#endif
        kPagingUpdatePTEPresentFlag(pagePTE, present);
}

void kpagingUpdatePresentFlagV(uint32_t address, bool present)
{
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    kpagingUpdatePresentFlagA(address, present);
}

void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
#endif
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
//                printd(DEBUG_PAGING,"ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}

bool kIsPageMapped(uintptr_t Address)
{
    if (!kPagingGet4kPTEntryValue(Address))
        return false;
    return true;
}

void kUnMapPage(uintptr_t mapTo)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
        ptrT[(mapTo&0x003FFFFF/4096)]=0;
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
#endif
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0;
//                printd(DEBUG_PAGING,"ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}

void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
#endif
    kSetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
        if (inUse)
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
        mmKernelSetPageInUseFlag(cnt,inUse);
}

void mmUnusePageRange()
{
    
}
