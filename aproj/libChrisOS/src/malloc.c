/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "malloc.h"
#include "libChrisOS.h"

#define HEAP_GET_NEXT(s,t) {t=(uint8_t*)s+s->len+sizeof(heaprec_t);}
#define HEAP_CURR(s,t) {t=((heaprec_t*)s)-1;}
void initmalloc()
{
    printdI(DEBUG_MALLOC,"heapBase @ 0X%08X = 0x%08X before\n", &heapBase, heapBase);
    heapBase=0;
    heapCurr=0;
    heapEnd=0;
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

void*  mallocI(size_t size)
{
    void* retVal;

    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    uint8_t* heapPtrNext;
    printdI(DEBUG_MALLOC,"malloc(0x%08X)\n",size);
    needed = newHeapRequiredToFulfillRequest(size);
    printdI(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
    if (needed!=0)      //New heap required
    {
        allocatedPtr = do_syscall2(SYSCALL_ALLOC, needed);
        //This is needed to keep in sync with what the kernel thinks
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
    heapPtr->len=size;
    heapPtr->inUse=true;
    printdI(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
    retVal=(void*)(heapCurr+sizeof(heaprec_t));
    HEAP_GET_NEXT(heapPtr,heapPtrNext);
    ((heaprec_t*)heapPtrNext)->prev=heapPtr;
    heapCurr+=size+(sizeof(heaprec_t));
    printdI(DEBUG_MALLOC,"malloc: returning 0x%08X\n",retVal);
    return retVal;
}

__attribute__((visibility("default"))) void*  malloc(size_t size)
{
    return mallocI(size);
}

__attribute__((visibility("default"))) void free(void* fpointer)
{
    heaprec_t* mp;;  //-1 means back up to the heaprec_t struct
    
    if (fpointer==NULL)
        return;             //CLR 04/20/2017: If pointer to be freed is NULL, don't do anything
    HEAP_CURR(fpointer,mp);
    
    //printDebug(DEBUG_MALLOC,"libc_free: Freeing heap @ fp=0x%08X (mp=0x%08X)\n",fpointer,mp);
    if (mp->marker!=ALLOC_MARKER_VALUE)
    {
        //print("malloc: marker not found error!!!\n");
gotoHere:
        goto gotoHere;
    }
    mp->inUse=false;
}

void malloc_cleanup()
{
    do_syscall2(SYSCALL_FREE, heapBase);
}