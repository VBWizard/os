#include <stdint.h>
#include "chrisos.h"
#include "../../../chrisOSKernel/include/paging.h"

extern uint32_t kmmHeapMemoryBaseAddress,kMallocBaseAddress,kMallocCurrAddress;

#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

uintptr_t* malloc(uint32_t size)
{
    uint32_t lRetVal = kMallocCurrAddress;
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Using heap address 0x%08X\n",lRetVal);
    pagingMapPage(CURRENT_CR3,lRetVal,lRetVal,0x03);
    printd(DEBUG_MEMORY_MANAGEMENT,"Mapped 0x%08X with attribs 0x03\n",lRetVal);
    kMallocCurrAddress+=size;   
    printd(DEBUG_MEMORY_MANAGEMENT,"Updated current malloc address to 0x%08X\n",kMallocCurrAddress);
    return lRetVal;
}

uintptr_t* mallocA1k(uint32_t size)
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