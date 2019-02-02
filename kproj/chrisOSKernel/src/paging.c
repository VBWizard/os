#include "chrisos.h"
#include "../../chrisOS/include/i386/bits/types.h"
#include "../../chrisOS/include/utility.h"  //for panic
#include "printf.h"
#include "i386/cpu.h"
#include "i386/gdt.h"
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
    uint32_t* dir=(uint32_t*)pageDirAddress;
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
    printd(DEBUG_PAGING,"pFAATMT: Finding PTEs to accomodate 0x%08x pgs\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        printd(DEBUG_PAGING,"pFAATMT: Finding existing page directory entry (0x%08x)\n",dir);
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
            pagingMapPage(pageDirAddress,*dir,*dir,(uint16_t)0x07);
            pagingMapPage(KERNEL_CR3,*dir | KERNEL_PAGED_BASE_ADDRESS,*dir,(uint16_t)0x03);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pFAATMT: No available directory entry, allocated one at 0x%08x, placed at PDE entry 0 (0x%08x)\n",*dir,dir);
        }

        currentPDE=dir;
        foundPageEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
        
        tablePtr=(uint32_t*)*dir;
        tablePtr=(uint32_t*)((uint32_t)tablePtr & 0xFFFFF000);
        
//        pagingMapPage(pageDirAddress,*dir | KERNEL_PAGED_BASE_ADDRESS,*dir,0x03);
        
        
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08x (0x%08x)\n",currentPDE,*currentPDE);
        
        //Find sequential table entries large enough to hold the requested amount of memory
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
        {
            //If entry is in use
            if (*tablePtr!=0)
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08x=0x%08x), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
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
                    //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found available page entries at entry 0x%08x\n",foundPageTableEntry);
                    found=true;
                    break;
                }
            }
        }
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08x (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
        dir++;
        dirEntryNumber++;
    } while ( !found && currentPDE<lastPDE);
    
    if (!found)
        panic("pFAATMT: Could not find a free PTE, PDE=0x%08x\n",pageDirAddress);

    dirEntryNumber--;
    
    printd(DEBUG_PAGING,"pFAATMT: dirEntry#=0x%08x, ptEntry#=0x%08x\n",dirEntryNumber,foundPageTableEntryNum);
    lRetVal=(uint32_t)((dirEntryNumber*(PAGE_SIZE*1024)) + (foundPageTableEntryNum*PAGE_SIZE));
    printd(DEBUG_PAGING,"pFAATMT: Found PDE 0x%08x, starting PTE 0x%08x\n",currentPDE,foundPageTableEntry);
    printd(DEBUG_PAGING,"\tfor 0x%08x bytes at virt address 0x%08x\n",pagesToFind*PAGE_SIZE,lRetVal);
    return lRetVal;
}

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
    kKernelPoolMemoryAddress+=0x1000;
    return lRetVal;
}

uint32_t pagingGet4kPDEntryValueCR3(uintptr_t PageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t*pageDirEntry=((PageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
    uintptr_t* lTemp=(uint32_t*)((PageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: pageDirEntry=0x%08x, *pageDirEntry=0x%08x, dirAddressPtr=0x%08x (CR3=0x%08x)\n", 
                    pageDirEntry, *pageDirEntry, *lTemp,PageDirAddress);
#endif
    return (uint32_t)*lTemp;
}

uint32_t pagingGet4kPDEntryValue(uint32_t address)
{
    return pagingGet4kPDEntryValueCR3(KERNEL_CR3,address);
}

uint32_t pagingGet4kPDEntryAddressCR3(uintptr_t PageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uintptr_t lTemp=((PageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printd(DEBUG_PAGING,"dirEntryAddress=0x%08x\n", lTemp);
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}

uint32_t pagingGet4kPDEntryAddress(uint32_t address)
{
    return pagingGet4kPDEntryAddressCR3(KERNEL_CR3,address);
}

uint32_t pagingGet4kPTEntryAddressCR3(uintptr_t pageDirAddress, uint32_t address)
{
    uint32_t retVal=0;
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValueCR3(pageDirAddress,address) & 0xFFFFF000;
    if (pDirPtr!=0)
    retVal=((address & 0x3FF000) >> 12) << 2 | pDirPtr;
    else
        retVal = 0;
    printd(DEBUG_PAGING,"pagingGet4kPTEntryAddressCR3: returning 0x%08x for address 0x%08x (CR3=0x%08x)\n",retVal,address,pageDirAddress);
    return retVal;
}

uint32_t pagingGet4kPTEntryAddress(uint32_t address)
{
    return pagingGet4kPTEntryAddressCR3(KERNEL_CR3,address);
}

uint32_t pagingGet4kPTEntryValueCR3(uintptr_t pageDirAddress, uint32_t address)
{
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddressCR3(pageDirAddress,address);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
             printd(DEBUG_PAGING,"pagingGet4kPTEntryValueCR3: PTAddress=0x%08x, PTValue=0x%08x (PDIR=0x%08x)\n", pTablePtr,*pTablePtr,pageDirAddress);
#endif
    return *pTablePtr;
}

uint32_t pagingGet4kPTEntryValue(uint32_t address)
{
    return pagingGet4kPTEntryValueCR3(KERNEL_CR3,address);
}

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
    printd(DEBUG_PAGING,"pagingSetPageReadOnlyFlag: 0x%08x - before/after: 0x%08x/", ptEntry, *ptEntry);
    if (readOnly)
       *ptEntry&=0xFFFFFFFD;
    else
       *ptEntry|=2; 
    RELOAD_CR3
    printd(DEBUG_PAGING,"0x%08x\n", *ptEntry);
}

static inline void invlpg(void* m)
{
    /* Clobber memory to avoid optimizer re-ordering access before invlpg, which may cause nasty bugs. */
    __asm__ volatile ( "invlpg [%0]" : : "b"(m) : "memory" );
}

void pagingMakePageCoW(uintptr_t* ptEntry, bool makeCoW)
{
    printd(DEBUG_COW,"\tpagingSetCowFlag: CoW 0x%08x? %c: (after: ",*ptEntry, (makeCoW?'Y':'N'), *ptEntry);
    if (makeCoW)
    {
       *ptEntry|=PAGE_COW_FLAG; //Set CoW (bit 9) flag
       *ptEntry&=0xFFFFFFFD; //Unset Read/Write (bit 1) flag
       *ptEntry&=(~PAGE_MMAP_FLAG); //Wipe out the MMAP flag when setting the COW flag
    }
    else
    {
       *ptEntry&=(~PAGE_COW_FLAG); //Unset CoW (bit 9) flag
       *ptEntry|=0x2;       //Set Read/Write (bit 1) flag
    }   
    printd(DEBUG_COW,"0x%08x)\n", *ptEntry);    
}

void pagingSetAddressReadOnlyFlag(uintptr_t CR3, uintptr_t address, bool readOnly)
{
    uintptr_t ptEntryToUpdate = pagingGet4kPTEntryAddressCR3(CR3,address);
    uintptr_t* ptEntry=(uintptr_t*)ptEntryToUpdate;
    
    printd(DEBUG_PAGING,"pagingSetAddressReadOnlyFlag: pt entry address to update=0x%08x, value before=0x%08x\n",ptEntryToUpdate, *ptEntry);
    if (readOnly)
       *ptEntry&=0xFFFFFFFD;
    else
       *ptEntry|=2; 
    printd(DEBUG_PAGING,"pagingSetAddressReadOnlyFlag: value after=0x%08x\n",*ptEntry);
}

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08x - before/after: 0x%08x/", ptEntry, *ptEntry);
         if (present)
             *ptEntry=*ptEntry | 1;
         else
             *ptEntry&=0xFFFFFFFE;
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
         printd(DEBUG_PAGING,"0x%08x\n", *ptEntry);
}

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08x-0x%08x r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddressCR3(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08x (0x%08x) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08x %s\n", address, present?"present":"not present");
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddressCR3(pageDirAddress,address&0xFFFFF000);
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08x\n", pagePTE);
    pagingUpdatePTEPresentFlag(pagePTE, present);
}

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
}

///Map a page to a new address
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint16_t flags)
{
    uint32_t *dirPtr;
    uint32_t dirPtrVal;
    uint32_t *pagePtr;
    
    virtualAddress &= 0xFFFFF000;
    physicalAddress &= 0xFFFFF000;
    
    printd(DEBUG_PAGING,"pagingMapPage: Via CR3=0x%08x, mapping v=0x%08x to p=0x%08x with flags 0x%02X\n",pageDirAddress,virtualAddress,physicalAddress,flags);
    
    //Get pointer to the page directory
    dirPtr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    dirPtrVal=dirPtr[(virtualAddress>>22)];
    if (dirPtrVal==0)
    {
        //Get a page for the page table
        pagePtr=(uint32_t*)pagingAllocatePagingTablePage();
        printd(DEBUG_PAGING,"pmp:Page table doesn't exist for address 0x%08x (CR3=0x%08x)\n",virtualAddress,pageDirAddress);
        //Set the page directory entry to the newly allocated page, with flags
        dirPtr[(virtualAddress>>22)]=((uint32_t)(pagePtr) | flags);
        printd(DEBUG_PAGING,"pmp:Allocated page @ 0x%08x for the page table, PDE=0x%08x (flags=0x%02X)\n", pagePtr,dirPtr[(virtualAddress>>22)],flags);
/*        ptrT[(virtualAddress&0x003FFFFF/4096)]=physicalAddress | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped v=0x%08x via dir=0x%08x, page=0x%08x, to p=0x%08x\n", virtualAddress, &dirPtr[(virtualAddress>>22)], &pagePtr[(virtualAddress&0x003FFFFF/4096)],pagePtr[(virtualAddress&0x003FFFFF/4096)]);
*/
    }
    //CLR 1/28/2019: Noticed this while testing anonymous mmap.
    //Need to update pdir flags if page to be mapped has more permissive perms
    //There's probably more to do here to remove flags, but ... TODO
    else 
    {
        if (flags & 0x1)
            dirPtr[(virtualAddress>>22)] |= 1;
        if (flags & 0x2)
            dirPtr[(virtualAddress>>22)] |= 2;
        if (flags & 0x4)
            dirPtr[(virtualAddress>>22)] |= 4;
    }
    if (dirPtr[(virtualAddress>>22)]==0)
        dirPtr[virtualAddress>>22]=(pageDirAddress + ((virtualAddress&0x003FFFFF)/4096)) | flags;
    dirPtrVal=dirPtr[virtualAddress>>22];
    dirPtrVal=(dirPtrVal&0xFFFFF000);
    pagePtr=(uint32_t*)dirPtrVal;
    //Now ptrVal will point to offset within page table
    dirPtrVal=(virtualAddress&0x003FFFFF)/4096;
    pagePtr[dirPtrVal]=physicalAddress | flags;
    printd(DEBUG_PAGING,"pmp:v=0x%08x via dir=0x%08x, page=0x%08x, to p=0x%08x, flags=%02X\n", virtualAddress, &dirPtr[(virtualAddress>>22)], &pagePtr[dirPtrVal],pagePtr[dirPtrVal],flags);
}

void pagingMapPageRange(uintptr_t pageDirAddress, uintptr_t startVirtualAddress, uintptr_t endVirtualAddress, uintptr_t startPhysicalAddress,uint8_t flags)
{
    while (startVirtualAddress<=endVirtualAddress)
        pagingMapPage(pageDirAddress,
                startVirtualAddress+=0x1000,
                startPhysicalAddress+=0x1000,
                (uint16_t)flags);
}

//CLR 01/20/2019: Added incrementPhysical parameter so that when we are mmapping (where we don't set the physical address when page mapping,
//or un-mapping (setting all phys to 0), phys doesn't increment!
void pagingMapPageCount(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, int pageCount, uint16_t flags, bool incrementPhysical)
{
    for (int cnt=0;cnt<pageCount;cnt++)
    {
        //Doing this check first makes (especially) un-mapping pages much quicker. (didn't really work)
        //if (pagingGet4kPTEntryValueCR3(pageDirAddress, virtualAddress+(0x1000*cnt)) != physicalAddress+(incrementPhysical?0x1000:0))
            pagingMapPage(pageDirAddress,virtualAddress+(0x1000*cnt),physicalAddress+((incrementPhysical?0x1000:0)*cnt),(uint16_t)flags);
    }
}

//Can only be called by kernel code
bool pagingMapProcessPageIntoKernel(uintptr_t processCR3, uintptr_t virtualAddress, uint8_t flags)
{
    
    pagingMapPage(KERNEL_CR3, virtualAddress, pagingGet4kPTEntryValueCR3(processCR3,virtualAddress), (uint16_t)flags);
}

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
    uint32_t pageDirValue=pagingGet4kPDEntryValueCR3(pageDirAddress,Address);
    uint32_t pageEntryValue=pagingGet4kPTEntryValueCR3(pageDirAddress,Address);
    uint32_t mapping=pagingGet4kPTEntryValueCR3(pageDirAddress,Address);
    if (!mapping || pageDirValue==0 || pageEntryValue==0)
    {
        printd(DEBUG_PAGING,"isPageMapped: Page is not mapped, CR3=0x%08x, Address=0x%08x, mapping=\n",pageDirAddress,Address,mapping);
        return false;
    }
    printd(DEBUG_PAGING,"isPageMapped: Page @ 0x%08x is already mapped to 0x%08x, CR3=0x%08x\n",Address, mapping,pageDirAddress);
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
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08x via dir=0x%08x, page=0x%08x\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[(pageToUnmap&0x003FFFFF/4096)]);
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
        printd(DEBUG_PAGING,"2) Unmapped 0x%08x via dir=0x%08x, page=0x%08x\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[ptrVal]);
    }
}

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08x(0x%08x)-0x%08x(0x%08x) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
        panic("fix this!!!");
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08x as %s\n", address, inUse?"in use":"not in use");
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddressCR3(pageDirAddress,address);
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08x, Before PTE value=0x%08x\n",ptEntry,*ptEntry);
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

void *cowPages(uintptr_t pdt, void *addr, size_t len)
{
    for (uint32_t addressToCow=(uint32_t)addr;addressToCow<(uint32_t)addr+len;addressToCow+=PAGE_SIZE)
    {
        uintptr_t currPageEntry = pagingGet4kPTEntryValueCR3(pdt, addressToCow);
        if ( currPageEntry != 0 && (currPageEntry & PAGE_COW_FLAG)!= PAGE_COW_FLAG)
            pagingMakePageCoW((uintptr_t*)pagingGet4kPTEntryAddressCR3((uint32_t)pdt,addressToCow),true);
    }
    return addr;
}
