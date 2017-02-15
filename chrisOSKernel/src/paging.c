#include <stdbool.h>
#include "chrisos.h"
#include "../../chrisOS/include/i386/bits/types.h"
#include "../../chrisOS/include/utility.h"  //for panic
#include "printf.h"
#include "i386/cpu.h"
#include "i386/gdt.h"
#include "i386/kPaging.h"
#include "kbd.h"
#include "paging.h"
#include "alloc.h"

extern uint64_t kE820MemoryBytes;
extern bool kDebugStartsNow;
extern void set_gdt(struct gdt_ptr *);
extern void doPagingJump();
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;
uint32_t kKernelPoolMemoryAddress;



uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind)
{
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
    uint32_t* tablePtr;
    uint32_t* currentPDE,*lastPDE;
    int foundPageEntryCount;
    bool found=false;
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
    uint32_t lRetVal;
    currentPDE=dir;
    lastPDE=dir+(PAGE_SIZE/4);
    
    printd(DEBUG_PAGING,"pFAATMT: Finding PTEs to accomodate 0x%08X pgs\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        //printd(DEBUG_PAGING,"pFAATMT: Finding existing page directory entry\n");
        for (uint32_t* cnt=currentPDE;cnt<=lastPDE;cnt++)
        {
            if (*dir==0)
            {
                dir++;
                dirEntryNumber++;
            }
            else
                break;
        }

        //If we didn't find a page directory in use, put the first entry into use
        if (*dir==0)
        {
            dir=(uint32_t*)pageDirAddress;
            *dir=(uint32_t)allocPages(PAGE_SIZE);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pFAATMT: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
        }

        currentPDE=dir;
        foundPageEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
        
        tablePtr=(uint32_t*)*dir;
        tablePtr=(uint32_t*)((uint32_t)tablePtr & 0xFFFFF000);
        
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08X (0x%08X)\n",currentPDE,*currentPDE);
        
        //Find sequential table entries large enough to hold the requested amount of memory
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
        {
            //If entry is in use
            if (*tablePtr!=0)
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundPageEntryCount=0;
                tablePtr++;
                foundPageTableEntry=0;
                foundPageTableEntryNum=0;
            }
            else
            {
                //Entry not in use, increment the found entry count
                foundPageEntryCount++;
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u available ... continuing\n",foundEntryCount,pagesToFind);
                if (foundPageTableEntry==0)
                {
                    foundPageTableEntry=(uint32_t)tablePtr;
                    foundPageTableEntryNum=cnt;
                }
                //If we found enough entries which aren't in use, bail out of the FOR
                if (foundPageEntryCount==pagesToFind)
                {
                    //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found available page entries at entry 0x%08X\n",foundPageTableEntry);
                    found=true;
                    break;
                }
            }
        }
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08X (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
        dir++;
        dirEntryNumber++;
    } while ( !found && currentPDE<lastPDE);
    
    if (!found)
        panic("pFAATMT: Could not find a free PTE, PDE=0x%08X\n",pageDirAddress);

    dirEntryNumber--;
    
    printd(DEBUG_PAGING,"pFAATMT: dirEntry#=0x%08X, ptEntry#=0x%08X\n",dirEntryNumber,foundPageTableEntryNum);
    lRetVal=(uint32_t)((dirEntryNumber*(PAGE_SIZE*1024)) + (foundPageTableEntryNum*PAGE_SIZE));
    printd(DEBUG_PAGING,"pFAATMT: Found PDE 0x%08X, starting PTE 0x%08X\n",currentPDE,foundPageTableEntry);
    printd(DEBUG_PAGING,"\tfor 0x%08X bytes at virt address 0x%08X\n",pagesToFind*PAGE_SIZE,lRetVal);
    return lRetVal;
}

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
    printd(DEBUG_PAGING,"pagingGet4kPDEntryAddress: dirEntryAddress=0x%08x\n", lTemp);
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
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(virtualAddress>>22)];
    if (ptrVal==0)
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",virtualAddress,pageDirAddress,  *ptrT);
        ptr[(virtualAddress>>22)]=0x20000063;
        ptrT[(virtualAddress&0x003FFFFF/4096)]=physicalAddress | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[(virtualAddress&0x003FFFFF/4096)],ptrT[(virtualAddress&0x003FFFFF/4096)]);
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)pageDirAddress;
        if (ptr[(virtualAddress>>22)]==0)
            ptr[virtualAddress>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((virtualAddress&0x003FFFFF)/4096)) | 0x63;
        ptrVal=ptr[virtualAddress>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(virtualAddress&0x003FFFFF)/4096;
        ptrT[ptrVal]=physicalAddress | flags;
        printd(DEBUG_PAGING,"kMapPage:(2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
    }
}

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
        return false;
    return true;
}

void unMapPage(uintptr_t pageDirAddress, uintptr_t pageToUnmap, uint8_t newFlags)
{
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(pageToUnmap>>22)];
    if (ptrVal==0 && pageToUnmap < kE820MemoryBytes)
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(pageToUnmap>>22)]=0x20000063;
        ptrT[(pageToUnmap&0x003FFFFF/4096)]=0 | newFlags;
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[(pageToUnmap&0x003FFFFF/4096)]);
    }
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)pageDirAddress;
        ptrVal=ptr[pageToUnmap>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(pageToUnmap&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[ptrVal]);
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
