/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "malloc.h"
#include "libChrisOS.h"

void initmalloc()
{
    heapBase=NULL;
    heapCurr=0;
    heapEnd=0;
}

uint32_t newHeapRequiredToFulfillRequest(size_t size)
{
    uint32_t newSize=size+sizeof(heaprec_t);
    print("",&printDebug);
    printDebug(DEBUG_MALLOC,"size=0x%08X, heapEnd=0x%08X, heapCurr=0x%08X\n",newSize, heapEnd, heapCurr);
    if (heapCurr+newSize > heapEnd)
    {
        printDebug(DEBUG_MALLOC,"Heap requested 0x%08X, heap available 0x%08X\n",newSize, heapEnd-heapCurr);
        newSize =(heapEnd-heapCurr);
        if (newSize== 0 || newSize%PAGE_SIZE)
       {
           newSize+=(PAGE_SIZE-(newSize % PAGE_SIZE));
           printDebug(DEBUG_MALLOC,"libcnewHeapRequiredToFulfillRequest: Size adjusted from %u to %u\n",size,newSize);
       }
        return newSize;
    }
    else
        return 0;
}

VISIBLE void*  malloc(size_t size)
{
    void* retVal;

    print("",&printDebug);
    uint32_t needed;
    uint32_t allocatedPtr;
    heaprec_t* heapPtr;
    needed = newHeapRequiredToFulfillRequest(size);
    printDebug(DEBUG_MALLOC,"libc_malloc: needed=0x%08X\n",needed);
    if (needed!=0)      //No new heap required
    {
        asm("mov eax,0x165\ncall sysEnter_Vector\n":"=a" (allocatedPtr):"b" (needed));
        //This is needed to keep in sync with what the kernel thinks
        printDebug(DEBUG_MALLOC,"libc_malloc: heaEnd=0x%08X\n",heapEnd);
        heapEnd=(uint32_t*)(allocatedPtr+needed);
        printDebug(DEBUG_MALLOC,"libc_malloc: Req 0x%08X bytes, ret was 0x%08X, heapEnd=0x%08X\n",needed,allocatedPtr,heapEnd);
        if (heapCurr==0)    //Hasn't been initialized yet!
            heapCurr=allocatedPtr;
    }
    heapPtr = (heaprec_t*)heapCurr;
    heapPtr->marker=0xB00F00D0;
    heapPtr->len=size;
    heapPtr->inUse=true;
    printDebug(DEBUG_MALLOC,"libc_malloc: heapCurr=0x%08X, sizeof(heaprec_t)=0x%08X\n",heapCurr,sizeof(heaprec_t));
    retVal=heapCurr+sizeof(heaprec_t);
    heapCurr+=size+(sizeof(heaprec_t));
    printDebug(DEBUG_MALLOC,"\n");
    return retVal;
}