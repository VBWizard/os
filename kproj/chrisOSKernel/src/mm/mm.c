#include "mm.h"

extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;
extern uint32_t kKernelPoolMemoryAddress;       //Address to locate page defs at
extern char* kernelDataLoadAddress, kernelLoadAddress, kernelLoadEnd;

#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})


uint32_t KERNEL_DATA_SECTION 
    kmmHeapMemoryTotal,                         //User memory total
        kmmHeapMemoryBaseAddress,               //Base address of user memory
        kmmGrossUserMemoryAvailable,            
        kMallocBaseAddress,kMallocCurrAddress;  

uint32_t kernelSize;
uint32_t kernelStart = (uint32_t)&kernelLoadAddress;
uint32_t kernelMemoryUsed;
uint32_t kernelPoolMemorySize=100*1024*1024;   //20 MB kernel memory

sMemInfo* heapMemoryInfo;

void mmInitHeapTracking()
{
    heapMemoryInfo=(sMemInfo*)kmmHeapMemoryBaseAddress;
    printd(DEBUG_MEMORY_MANAGEMENT,"Assigning heapMemoryInfo address of 0x%08X\n",heapMemoryInfo);
    
    kmmHeapMemoryBaseAddress += sizeof(sMemInfo)*1000;
    kmmHeapMemoryBaseAddress += 0x1000;
    kmmHeapMemoryBaseAddress &= 0xFFFFF000;
    kmmHeapMemoryTotal-= sizeof(sMemInfo)*1000; 
    printd(DEBUG_MEMORY_MANAGEMENT,"heapMemoryInfo = 0x%08X\n",heapMemoryInfo);
    printd(DEBUG_MEMORY_MANAGEMENT,"Allocating 0x%08X bytes to memory block tracking\n",sizeof(sMemInfo)*1000);
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory base adjusted to 0x%08X\n",kmmHeapMemoryBaseAddress);
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory size adjusted to 0x%08X\n",kmmHeapMemoryTotal);

    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
    heapMemoryInfo->size=kmmHeapMemoryTotal;
    heapMemoryInfo->next=NULL;
    heapMemoryInfo->prev=NULL;
    
    for (int cnt=1;cnt<1000;cnt++)
    {
        heapMemoryInfo[cnt].address=0;
        heapMemoryInfo[cnt].prev=NULL;
        if (cnt<999)
            heapMemoryInfo[cnt].next=NULL;
        heapMemoryInfo[cnt].inUse=false;
        heapMemoryInfo[cnt].pid=0;
        heapMemoryInfo[cnt].size=0;
    }
}


void mmInit()
{
    uint32_t kOldDebugLevel=kDebugLevel;
    kDebugLevel &= ~DEBUG_PAGING;
    kernelSize=kernelLoadEnd-kernelLoadAddress;
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kernelMemoryUsed=kernelStart + kernelSize;
    kmmGrossUserMemoryAvailable=kE820MemoryBytes - kernelMemoryUsed;
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable - kernelPoolMemorySize - kernelMemoryUsed;
    kmmHeapMemoryBaseAddress=(kernelMemoryUsed + 0x100000) & 0xFFFFF000 ;
    kKernelPoolMemoryAddress=kmmHeapMemoryBaseAddress;
    kmmHeapMemoryBaseAddress+=kernelPoolMemorySize; //Need some page table memory but we don't want to use Malloc while creating page tables to get it
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
    kMallocCurrAddress=kMallocBaseAddress;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory used by the kernel: %u\n",kernelMemoryUsed);
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossUserMemoryAvailable/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",(kmmGrossUserMemoryAvailable - kernelPoolMemorySize)/1024);
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\t\tLength\t\t\n");
    printd(DEBUG_MEMORY_MANAGEMENT,"Kernel\t0x%08X\t\t0x%08X\n",kKernelPoolMemoryAddress,kernelPoolMemorySize);
    printd(DEBUG_MEMORY_MANAGEMENT,"User\t\t0x%08X\t\t0x%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);

    mmInitHeapTracking();    
    //We need to
    uintptr_t startAddr=0x1000;
    //CLR 02/21/2017 - Changed from (kernelMemoryUsed + 0x1000) & 0xFFFFF000 to heap memory base address
    uintptr_t endAddr= kmmHeapMemoryBaseAddress;
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

    startAddr=kmmHeapMemoryBaseAddress; 
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
        {
            unMapPage(CURRENT_CR3,cnt,0x0);
            if (cnt%0x10000000==0)
            {
//                printk("0x%08X-0x%08X\n",cnt,kPagingGet4kPTEntryValue(cnt));
                printd(DEBUG_KERNEL_PAGING,".");
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
 
    printk("\n");
    kDebugLevel=kOldDebugLevel;
/*    
    printd(DEBUG_KERNEL_PAGING,"Test mallocs:\n");
    uintptr_t* b1 = allocPages(50);
    sprintf(b1,"The value of b1 = 0x%08X",b1);
    printd(DEBUG_KERNEL_PAGING,"b1=malloc(1) returned 0x%08X\n\n",b1);
    uintptr_t* b2 = allocPages(4095);
    *b2=0xBEEFDEAD;
    printd(DEBUG_KERNEL_PAGING,"b2=malloc(4095) returned 0x%08X\n\n",b2);
    uintptr_t* b5 = allocPages(1024*1024*100);
    printd(DEBUG_KERNEL_PAGING,"b4=malloc(100MB) returned 0x%08X\n\n",b5);
    uintptr_t* b6 = allocPages(1024*1024*200);
    printd(DEBUG_KERNEL_PAGING,"b4=malloc(200MB) returned 0x%08X\n\n",b6);
    printd(DEBUG_KERNEL_PAGING,"freeing b2\n");
    freePage(b5);
    b5=allocPages(100);
    printd(DEBUG_KERNEL_PAGING,"b5=malloc(100) returned 0x%08X\n\n",b5);
    printd(DEBUG_KERNEL_PAGING,"Available memory: %u\n",memAvailable());
    return;
  */  
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}

///Find a free virtual address of size
uintptr_t mmGetFreeVirtAddress(uintptr_t cr3, uintptr_t startVirt, int size)
{
    uintptr_t ptValue=0xFFFFFFFF;
    int pagesNeeded=ALIGN_TO_PAGE_SIZE(size);
    int pagesFound=0;
    int firstVirt=0;
    
    while (pagesFound<pagesNeeded && startVirt<0xEFFFFFFF)
    {
        ptValue=pagingGet4kPTEntryValueCR3(cr3,startVirt);
        if (ptValue==0)
        {
            if (firstVirt==0)
                firstVirt=startVirt;
            pagesFound++;
        }
        else
        {
            pagesFound=0;
            firstVirt=0;
        }
        startVirt+=PAGE_SIZE;
    }
    if ((pagesFound<pagesNeeded) || startVirt>=0xEFFFFFFF)
        return ERROR_MM_CANNOT_ALLOCATE;
    else
        return firstVirt;
}

bool mmInitMMapPages(uintptr_t cr3, uintptr_t startVirt, int count, bool writable)
{
    //Set up not present mapping for each virtual page in the mmap
    //Set the user and write flags, but omit the present flag
    //We'll temporarily fill the physical address with the virtual address
    //Later the paging exception code will fill in the physical address
    pagingMapPageCount(cr3,startVirt,startVirt,count,0x4 | writable<<1);
    return true;
}