/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "malloc.h"
#include "libChrisOS.h"
#include "config.h"

#define HEAP_GET_NEXT(s,t) {t=(uint8_t*)s+s->len+sizeof(heaprec_t);}
#define HEAP_GET_NEXTr(s) ({s=(uint8_t*)s+s->len+sizeof(heaprec_t);s;})
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
#define HEAP_PTR_MEM_ADDR(s) ({void *ptr=((void*)heapCurr)+sizeof(heaprec_t);ptr;})
void initmalloc()
{
    printdI(DEBUG_MALLOC,"heapBase @ 0X%08X = 0x%08X before\n", &heapBase, heapBase);
    heapBase=0;
    heapCurr=0;
    heapEnd=0;
    libcTZ=-5;

}

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
    //CLR 12/28/2018: Need to add 2 heap records instead of just 1, because in malloc we'll set the ->prev 
    //value of the heap record following ours before returning
    uint32_t newSize=size+(sizeof(heaprec_t)*2);
    //printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
    {
        //printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize -=(heapEnd-heapCurr);
        if (newSize== 0 || newSize%PAGE_SIZE)
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
           //printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        if (newSize < ALLOC_REQUEST_SIZE)
            return ALLOC_REQUEST_SIZE;
        else
            return newSize;
    }
    else
        return 0;
}

void freeI(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if ((uint32_t)fpointer < heapBase || (uint32_t)fpointer > heapCurr)
        return;
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
    {
        printI("malloc: marker not found error!!!\n");
        return; //Return silently ... for now
    }
    mp->inUse=false;
    
}

heaprec_t *mallocFindAvailableMemory(size_t size)
{
    heaprec_t* heapPtr=(heaprec_t*)heapBase;
    do
    {
        if (!heapPtr->inUse && heapPtr->len>=size && heapPtr->marker==ALLOC_MARKER_VALUE)
            return heapPtr;
        if (heapPtr->next)
            heapPtr=heapPtr->next;
        
    }
    while(heapPtr<(heaprec_t*)heapCurr && heapPtr->next && heapPtr->marker==ALLOC_MARKER_VALUE);
    //while (heapPtr->marker==ALLOC_MARKER_VALUE);
    return NULL;
}

void mallocSanityCheck(heaprec_t *heaprec)
{
#ifdef ALLOC_MALLOC_SANITY_CHECK
    heaprec_t *heapPtr=heaprec;
    while (heapPtr>=(heaprec_t*)heapBase && heapPtr->prev!=heapPtr)
    {
        if (heapBase<(uintptr_t)heapPtr-8)
        {
                printfI("\n**************************malloc base error!!!**************************\n");
    SanityLoop2:
                goto SanityLoop2;
        }
        if (heapPtr->marker!=ALLOC_MARKER_VALUE)
        {
            printfI("\n**************************malloc pointer error!!!**************************\n");
SanityLoop:
            goto SanityLoop;
        }
        heapPtr=heapPtr->prev;
    }
#endif
}

void*  mallocI(size_t size)
{
    void* retVal;

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr=NULL;
    size_t requestSize=size;
    static heaprec_t *lastHRCreated=NULL;

    if (size<ALLOC_MIN_MALLOC_SIZE)
        requestSize=ALLOC_MIN_MALLOC_SIZE;
    printdI(DEBUG_MALLOC,"libc_malloc: Request for 0x%08x bytes\n",requestSize);
/*    if (heapBase>0)
    {
        heapPtr=mallocFindAvailableMemory(requestSize);
        if (heapPtr!=NULL)
        {
            heapPtr->inUse=true;
            heapPtr->uses++;
            printdI(DEBUG_MALLOC,"libc_malloc: Reusing heaprec=0x%08x, address=0x%08x (uses=%u)",heapPtr,HEAP_PTR_MEM_ADDR(heapPtr),heapPtr->uses);
            return ((void*)heapPtr)+sizeof(heaprec_t);
        }
    }
*/    
    needed = newHeapRequiredToFulfillRequest(requestSize);
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
    if (needed!=0)      //New heap required
    {
        if (heapCurr>0)
            mallocSanityCheck(((heaprec_t*)heapCurr)->prev);        
        allocatedPtr = do_syscall1(SYSCALL_ALLOCHEAP, needed);
        //This is needed to keep in sync with what the kernel thinks
        memsetI((char*)allocatedPtr,0,needed);
        printdI(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
        heapEnd=allocatedPtr+needed;
        printdI(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
        if (heapBase==0)    //Hasn't been initialized yet!
        {
            heapCurr=allocatedPtr;
            heapBase=allocatedPtr;
            printdI(DEBUG_MALLOC,"libc_malloc: Initialized heapCurr and heapBase to 0x%08X\n",heapCurr);
        }
    }
    printdI(DEBUG_MALLOC,"libc_malloc:creating heap rec @ 0x%08X\n",heapCurr);
    heapPtr = (heaprec_t*)heapCurr;
    heapPtr->marker=ALLOC_MARKER_VALUE;
    heapPtr->len=requestSize;
    heapPtr->inUse=true;
    heapPtr->uses++;
    if (lastHRCreated!=NULL)
    {
        heapPtr->prev=lastHRCreated;
        heapPtr->prev->next=heapPtr;
    }

    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08x\n",heapCurr);
    retVal=((void*)(heapPtr)+sizeof(heaprec_t));
    heapCurr+=requestSize+(sizeof(heaprec_t));
    printdI(DEBUG_MALLOC,"malloc: returning 0x%08X\n",retVal);
    lastHRCreated=heapPtr;
    return retVal;
}

__attribute__((visibility("default"))) void*  malloc(size_t size)
{
    return mallocI(size);
}

void* reallocI(void *foldptr, uint32_t newlen)
{
    
    printdI(DEBUG_MALLOC,"libc_realloc: called for old pointer 0x%08x, new size=0x%08x",foldptr,newlen);

    //Get old heap pointer
    uint32_t realSize=newlen;
    heaprec_t* mp;  //-1 means back up to the heaprec_t struct
    HEAP_CURR(foldptr,mp);

    if (newlen==0)
        printdI(DEBUG_MALLOC,"libc_relloc: Request for 0 bytes, cannot fulfill\n");
    if (newlen==0 || newlen<=mp->len)
        return foldptr;

    if (newlen<ALLOC_MIN_MALLOC_SIZE)
        realSize=ALLOC_MIN_MALLOC_SIZE;
    
    //Allocate space of newlen
    uintptr_t *fnewptr = mallocI(realSize);
    printdI(DEBUG_MALLOC,"\tlibc_realloc: received new malloc pointer 0x%08x, old size=0x%08x, new size=0x%08x\n",fnewptr, mp->len, realSize);
   
    //Copy from old pointer to new memory using the old pointer's length
//    if (newlen>mp->len)
//        memsetI(fnewptr+mp->len,0,newlen-mp->len);
    memcpyI(fnewptr, foldptr, mp->len>realSize?realSize:mp->len);
    printdI(DEBUG_MALLOC,"\tlibc_realloc: updated new pointer 0x%08x with old pointer data and cleared out remaing if applicable\n",fnewptr);
    
   //free old pointer
    freeI(foldptr);
    return fnewptr;
}

VISIBLE void* realloc(void *foldptr, uint32_t newlen)
{
    return reallocI(foldptr, newlen);
}

__attribute__((visibility("default"))) void free(void* fpointer)
{
    freeI(fpointer);
}

void malloc_cleanup()
{
    do_syscall1(SYSCALL_FREE, heapBase);
}