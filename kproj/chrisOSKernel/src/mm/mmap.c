/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "mmap.h"
#include "process.h"
#include "dllist.h"
#include "errors.h"
#include "paging.h"
#include "kmalloc.h"
#include "syscalls.h"
#include "fs.h"

#define ERROR_EXIT(a) {p->errno=a;goto mmap_exit;}

char *kMMAPBuffer = NULL;

dllist_t* kMemoryMapsList=NULL;

void globalMMapInit()
{
    if (kMMAPBuffer==NULL)
        kMMAPBuffer = kMalloc(MMAP_BUFFER_SIZE);
}

void mmapAddToGlobalList(memmap_t* map)
{
    if (kMemoryMapsList==NULL)
    {
        kMemoryMapsList=kMalloc(sizeof(dllist_t));
        memset(kMemoryMapsList,0,sizeof(dllist_t));
    }
    if (kMemoryMapsList->prev==0)
        listInit(kMemoryMapsList,map);
    else
        listAdd(kMemoryMapsList,&map->listItem,map);
}

//Need to change listRemove to reference the list head
/*void mmapRemoveFromGlobalList(memmap_t* map)
{
    listRemove(&map->listItem);
}
*/

void* sys_mmap (process_t* p, void *addr,size_t len,int prot,int flags,int fd,off_t offset) //memory map pages either to a file or anonymously
{
    memmap_t* map;
    uintptr_t virtStartAddress=0;
    uintptr_t currMapping=0;
    
    p->errno=0;
    
    //If address isn't page aligned, set global error and exit
    if ((uint32_t)addr%PAGE_SIZE)
        ERROR_EXIT(ERROR_MMAP_ADDRESS_INVALID)
    
    //If file offset isn't page aligned, set global error and exit
    if (offset%PAGE_SIZE)
        ERROR_EXIT(ERROR_MMAP_OFFSET_INVALID)
    
    if (prot>PROT_EXEC)
        ERROR_EXIT(ERROR_MMAP_PROT_INVALID)
    
//    if (flags>MAP_FIXED)
//        ERROR_EXIT(ERROR_MMAP_FLAGS_INVALID)
    
    //Either private or shared flag must be specified
    if (!(flags&MAP_PRIVATE) && !(flags&MAP_SHARED))
        ERROR_EXIT(ERROR_MMAP_FLAGS_INVALID)

    virtStartAddress=(uintptr_t)addr;
    currMapping=pagingGet4kPTEntryValueCR3(p->pageDirPtr,(uintptr_t)addr);
    if (currMapping!=0)//Removed second condition -  || (uintptr_t)addr<0x1100000
    {
        //If fixed flag was passed, we can't meet the address requirement so set errno and exit
        if (flags&MAP_FIXED)
        {
            printd(DEBUG_MMAP,"mmap:Fixed mapping requested.  Cannot use requested \n\taddress of 0x%08X, already in use.  Mapping=0x%08X\n",addr,currMapping);
            ERROR_EXIT(ERROR_MMAP_ADDRESS_IN_USE);
        }
    }

    //Page align the length of the mapping
    if (len%PAGE_SIZE)
        len+=(PAGE_SIZE-(len%PAGE_SIZE));

    if (!(flags&MAP_FIXED))
    {
        //mm needs to suggest a virtual address to map to, starting at MMAP_VIRT_START 0xA0000000
        virtStartAddress=mmGetFreeVirtAddress(p->pageDirPtr,MMAP_VIRT_START,len);
    }

   
    //At this point we are sure we want to create the mapping so allocate memory for the map struct
    map=kMalloc(sizeof(memmap_t));
    map->process=p;
    map->startAddress=(uintptr_t)virtStartAddress;
    map->startFileOffset=offset;
    map->currentFileOffset=offset;
    map->protection=prot;
    map->flags=flags;
    map->fd=fd;
    map->len=len;
    //Add to the global list of memory maps
    mmapAddToGlobalList(map);
    //Add to the process' list of memmory maps
    if (p->mmaps==NULL)
    {
        p->mmaps=kMalloc(sizeof(dllist_t));
        listInit(p->mmaps,map);
    }
    else
        listAdd(p->mmaps,&map->listItem,map);

    //Initialize the mmap page list and add first item to it
    map->mmappedPages=kMalloc(sizeof(mmappedPage_t));
    memset(map->mmappedPages,0,sizeof(mmappedPage_t));  //First entry will always be 0
    dllist_t* mapList=&map->mmappedPages->listItem;
    listInit(mapList,map);
    int mappedPageCount=1;
    
    //Set up the virtual memory for the mmap
    mmInitMMapPages(map->process->pageDirPtr,
            map->startAddress,
            map->len/PAGE_SIZE,
            ((map->protection&PROT_WRITE)==PROT_WRITE?(1<<1):0)  //Pass PTE writable flag if mmap page is PROT_WRITE, otherwise page will only be readable (and by default executable)
                | (p->kernelProcess << 2));     //Pass PTE user/admin 
    
    //Now we have an area of virtual memory that is mmapped (each phys=0x0)
    //Reads/write to any of the memory will trigger paging exceptions at which time
    //physical pages will be assigned, and read to from the file (if fd!=NULL)
    //and create a mmappedPages entry for the address' page
    
mmap_exit:
    if (p->errno)
        return (void*)MAP_FAILED;
    return (void*)virtStartAddress;
}

uint32_t mmapAllocatePages(process_t *process, memmap_t* mmap, uint32_t pageVirtAddress, int pageCount)
{
    uint32_t pagePhysAddr=(uint32_t)allocPages(PAGE_SIZE * pageCount);

    pagingMapPageCount(process->pageDirPtr, pageVirtAddress, pagePhysAddr, pageCount, 
            ((mmap->protection&PROT_WRITE)==PROT_WRITE?(1<<1):0)  //Pass PTE writable flag if mmap page is PROT_WRITE, otherwise page will only be readable (and by default executable)
        | (process->kernelProcess?0:1 << 2) | 1, true);
    pagingMapPageCount(KERNEL_CR3, pagePhysAddr, pagePhysAddr, pageCount, 0x7, true);
    mmappedPage_t* mappedPage=kMalloc(sizeof(mmappedPage_t));
    mappedPage->address=pageVirtAddress & 0xFFFFF000;
    mappedPage->loaded=true;
    dllist_t* mapList=&mmap->mmappedPages->listItem;
    listAdd(mapList,&mappedPage->listItem,mappedPage);
    printd(DEBUG_MMAP, "\t\tmmapAllocatePage: Allocated %u pages at physical 0x%08x for virtual 0x%08x and mapped, cr3=0x%08x\n",pageCount, pagePhysAddr, pageVirtAddress, process->pageDirPtr);
    return pagePhysAddr;
}

bool handleMMapPagingException(process_t* victimProcess, uintptr_t pagingExceptionCR2, uint32_t pteValue, int errorCode)
{
    dllist_t* mmaps=victimProcess->mmaps;
    memmap_t* mmap=(void*)0x10101010;
    uint32_t pagePhysAddr=pteValue&0xFFFFF000;
    uint32_t pageFlags=pteValue&0x00000FFF;
    uint32_t pageVirtAddress = pagingExceptionCR2;
    int pagesToMap;
    bool timeToExit = false;
    
    if (mmaps!=NULL)
    {
        while (!timeToExit)
        {
            if (mmaps->next==mmaps)
                timeToExit = true;
            mmap=mmaps->payload;
            if (mmap->startAddress<=pagingExceptionCR2 && mmap->startAddress+mmap->len>=pagingExceptionCR2)
                break;
            mmaps=mmaps->next;
            mmap = NULL;
        } 
            
        if (mmap==NULL)
            panic("handleMMapPagingException: Could not find mmap for address 0x%08x\n",pagingExceptionCR2);

        if (mmap->mmappedPages->loaded)
            panic("handleMMapPagingException: Paging exception triggered for already loaded page");

        if (mmap->flags & MAP_PRIVATE)
        {
            if (mmap->flags & MAP_ANONYMOUS) //memory mapping
            {
                if (mmap->flags & MAP_STACK)
                {
                    //Verify we're really in the process' stack space. Requested address has to be a virt address within stackStart and stackSize
                    if (pageVirtAddress < victimProcess->stackStart || pageVirtAddress > victimProcess->stackStart + victimProcess->stackSize)
                        panic("handleMMapPagingException: mmap is marked MAP_STACK but page exception was outside the process' stack space");
                }
                printd(DEBUG_MMAP,"\t\thandleMMapPagingException: Found private, anonymous mmap.  Will allocate, map this page and add to mmap->mmappedPages\n");
                mmapAllocatePages(victimProcess, mmap, pageVirtAddress, 1);
                printd(DEBUG_MMAP,"\t\tMapped v=0x%08x to p=0x%08x (CR3=0x%08x)\n",pageVirtAddress,pagePhysAddr,victimProcess->pageDirPtr);
            }
            else if (mmap->fd) //file mapping
            {
                uint32_t targetFileOffset = pagingExceptionCR2 - mmap->startAddress;
                if (targetFileOffset > mmap->startFileOffset + mmap->len)
                {
                    printd(DEBUG_EXCEPTIONS,"\t\thandleMMapPagingException: ERROR!  Attempt to read past end of mmap'd file. (handle=0x%08x)  File length = %u, read offset = %u\n", mmap->fd, mmap->len, targetFileOffset);
                    return false;
                }
                printd(DEBUG_MMAP,"\t\thandleMMapPagingException: Found private, mmap for handle 0x%08x, offset = %u, will fulfill\n", mmap->fd, targetFileOffset);

                if (targetFileOffset + (4*PAGE_SIZE) < mmap->len)
                    pagesToMap = 4;
                else
                    pagesToMap = 1;
                
                pagePhysAddr=mmapAllocatePages(victimProcess, mmap, pageVirtAddress, pagesToMap);
                if (fs_seek((void*)mmap->fd, targetFileOffset, SEEK_SET))
                    panic("\t\tthandleMMapPagingException: Seek error (SEEK_SET), fd=0x%08x, offset=%u.",mmap->fd, targetFileOffset);
                int bytesRead = fs_read(victimProcess, (void*)mmap->fd, (void*)pageVirtAddress, PAGE_SIZE, pagesToMap);
                if (bytesRead == 0)
                    memset((uintptr_t*)pagePhysAddr,0,PAGE_SIZE * pagesToMap);
                printd(DEBUG_MMAP,"\t\tMapped v=0x%08x to p=0x%08x (CR3=0x%08x), read %u bytes.\n",pageVirtAddress,pagePhysAddr,victimProcess->pageDirPtr, bytesRead);
                return true;
                
            }
        }
        //NOTE: Later we'll add loading from a file if one is defined in the mmap
        return true;
    }
    else
    {
        printd(DEBUG_MMAP | DEBUG_EXCEPTIONS,"\t\tProcess has no mmaps, skipping mmap check\n");
        return false;
    }
}

void* syscall_mmap (process_t *p, syscall_mmap_t *callParams)
{
    
    syscall_mmap_t sm;
    
    copyToKernel(p, &sm, callParams, sizeof(syscall_mmap_t));
    
    return sys_mmap (p, sm.addr, 
            sm.len, 
            sm.prot, 
            sm.flags, 
            sm.fd, 
            sm.offset);
}