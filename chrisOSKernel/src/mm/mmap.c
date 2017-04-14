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

#define ERROR_EXIT(a) {p->errno=a;goto mmap_exit;}

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

void mmapRemoveFromGlobalList(memmap_t* map)
{
    listRemove(&map->listItem);
}

void* mmap (void *addr,size_t len,int prot,int flags,int fd,off_t offset)
{
    memmap_t* map;
    process_t* p=(process_t*)PROCESS_STRUCT_VADDR+4;
    uintptr_t virtAddress=0;
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
    
    if (flags>MAP_FIXED)
        ERROR_EXIT(ERROR_MMAP_FLAGS_INVALID)
    
    //Either private or shared flag must be specified
    if (!(flags&MAP_PRIVATE) && !(flags&MAP_SHARED))
        ERROR_EXIT(ERROR_MMAP_FLAGS_INVALID)

    virtAddress=(uintptr_t)addr;
    currMapping=pagingGet4kPTEntryAddressCR3(p->pageDirPtr,(uintptr_t)addr);
    if (currMapping!=0 || (uintptr_t)addr<0x1100000)
    {
        //If fixed flag was passed, we can't meet the address requirement so set errno and exit
        if (flags&MAP_FIXED)
        {
            printd(DEBUG_MMAP,"mmap:Fixed mapping requested.  Cannot use requested \n\taddress of 0x%08X, already in use.  Mapping=0x%08X\n",addr,currMapping);
            ERROR_EXIT(ERROR_MMAP_ADDRESS_IN_USE);
        }
        else
        {
            //mm needs to suggest a virtual address to map to, starting at MMAP_VIRT_START 0xA0000000
            virtAddress=mmGetFirstFreeVirtAddress(p->pageDirPtr,MMAP_VIRT_START);
        }
    }
    //Page align the length of the mapping
    if (len%PAGE_SIZE)
        len+=(PAGE_SIZE-len);

    
    //At this point we are sure we want to create the mapping so allocate memory for the map struct
    map=kMalloc(sizeof(memmap_t));
    map->process=p;
    map->startAddress=(uintptr_t)virtAddress;
    map->startFileOffset=offset;
    map->protection=prot;
    map->flags=flags;
    map->fd=fd;
    map->len=len;
    mmapAddToGlobalList(map);
    if (p->mmaps->prev==0)
        listInit(p->mmaps,map);
    else
        listAdd(p->mmaps,&map->listItem,map);
    /*    if (p->mmaps->prev==0)
        listInit(p->mmaps,0);
    else
        listAdd(p->mmaps,p->mmaps,0);
*/


    
mmap_exit:
    if (p->errno)
        return (void*)MAP_FAILED;
    return 0;

}