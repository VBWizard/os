#include "chrisos.h"
#include "i386/kPaging.h"
#include "mm.h"
#include "kbd.h"
#include "charDev.h"
#include <stdbool.h>
#include <stdint.h>
#include "printf.h"
#include "paging.h"

extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;
extern uint32_t kPagingPageMemoryAddress;       //Address to locate page defs at

//uint32_t 

uint32_t KERNEL_DATA_SECTION 
    kmmGrossMemoryAvailable, 
    kmmHeapMemoryTotal, 
        kmmHeapMemoryBaseAddress, kmmGrossKernelMemoryAvailable, kmmGrossUserMemoryAvailable,
        kMallocBaseAddress,kMallocCurrAddress;

uint32_t* kmmMemBlockData;

void mmInit()
{
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kmmGrossMemoryAvailable=(kE820MemoryBytes - (KERNEL_DATA_LOAD_ADDRESS+0x100000)) & 0xFFFFF000;
    kmmGrossUserMemoryAvailable=kmmGrossMemoryAvailable - (KERNEL_PHYSICAL_EXEC_ADDRESS + 100000);
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable;
    kmmHeapMemoryBaseAddress=kmmGrossMemoryAvailable-kmmHeapMemoryTotal;
    kPagingPageMemoryAddress=kmmHeapMemoryBaseAddress;
    kmmHeapMemoryBaseAddress+=(0x1000*0x200); //Need some page table memory but we don't want to use Malloc while creating page tables to get it
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
    kMallocCurrAddress=kMallocBaseAddress;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory Available after kernel loaded: %u kb\n", kmmGrossMemoryAvailable/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossMemoryAvailable/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",kmmGrossUserMemoryAvailable/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\tLength\t\t\n");
    printd(DEBUG_MEMORY_MANAGEMENT,"PTables\t%08X\t\t%08X\n",kPagingPageMemoryAddress,0x1000*0x200);
    printd(DEBUG_MEMORY_MANAGEMENT,"Heap\t\t%08X\t\t%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
    
    //We need to
    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (KERNEL_DATA_LOAD_ADDRESS+ 0x100000) & 0xFFFFF000;
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
    mmKernelSetPageRangeInUseFlag(startAddr,
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
    mmKernelSetPageRangeInUseFlag(startAddr,
            endAddr+1,
            0x1000, /*page size*/
            true);

    startAddr=(KERNEL_PHYSICAL_EXEC_ADDRESS+0x100000); //2nd 100000 is for the kernel run space
    printd(DEBUG_KERNEL_PAGING,"Setting kernel range 0x%08X-0x%08X not present ",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
        {
            kpagingUpdatePresentFlagA(cnt,false);
            if (cnt%0x10000000==0)
            {
//                printk("0x%08X-0x%08X\n",cnt,kPagingGet4kPTEntryValue(cnt));
                printd(DEBUG_KERNEL_PAGING,".");
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
    printk("\n");
    return;
    
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
