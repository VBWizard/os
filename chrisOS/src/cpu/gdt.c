#include <stdbool.h>
#include "i386/gdt.h"
#include "chrisos.h"
#include "i386/bits/bits.h"

extern sGDT* rmGdt;
extern sGDT* bootGdt;
extern uint32_t* kGDTSlotAvailableInd;
extern struct gdt_ptr kernelGDT;
extern void set_gdt(struct gdt_ptr *);

uint16_t HIGH_CODE_SECTION getNonKernelCodeGDTIndex()
{
    return 7<<3;
}

uint16_t HIGH_CODE_SECTION getNonKernelDataGDTIndex()
{
    return 6<<3;
}

uint16_t HIGH_CODE_SECTION getKernelCodeGDTIndex()
{
    return 4<<3;
}

uint16_t HIGH_CODE_SECTION getKernelDataGDTIndex()
{
    return 2<<3;
}

sGDT* HIGH_CODE_SECTION getNewGDTEntry()
{
   int slot=0;
   uint32_t* ptr=kGDTSlotAvailableInd;
    slot=bitsScanF(ptr);
   sGDT* gdt=bootGdt+slot; 
   return gdt;
}

void HIGH_CODE_SECTION installGDT()
{
    kernelGDT.limit = sizeof(sGDT) * GDT_TABLE_SIZE - 1;
    kernelGDT.base = (unsigned int)INIT_GDT_TABLE_ADDRESS;
    set_gdt(&kernelGDT);
   
}

void HIGH_CODE_SECTION gdtEntryI(int entryNo, int base, int limit, char access, char flags,bool inUse,bool setSFlag)
{
    bootGdt[entryNo].base_low        = base & 0xFFFF;
    bootGdt[entryNo].base_middle     = (base >> 16) & 0xFF;
    bootGdt[entryNo].base_high       = (base >> 24) & 0xFF;
    bootGdt[entryNo].limit_low       = limit & 0xFFFF;
    bootGdt[entryNo].flags_and_limit = flags | (((limit >> 16) & 0xF));
    bootGdt[entryNo].access          = access;
    if (setSFlag)
        bootGdt[entryNo].access |= 0x10;
    if (inUse)
        bitsReset(kGDTSlotAvailableInd,entryNo);
    else
        bitsSet(kGDTSlotAvailableInd,entryNo);
}
//Create/modify entries in the protected mode GDT
void HIGH_CODE_SECTION gdtEntryApplication(int entryNo, int base, int limit, char access, char flags,bool inUse)
{
    gdtEntryI(entryNo,base,limit,access,flags,inUse,true);
}

void HIGH_CODE_SECTION gdtEntryOS(int entryNo, int base, int limit, char access, char flags,bool inUse)
{
    gdtEntryI(entryNo,base,limit,access,flags,inUse,false);
}

//Create entries in the real mode GDT table
void HIGH_CODE_SECTION gdtEntryRM(int entryNo, int base, int limit, char access, char flags)
{
    rmGdt[entryNo].base_low        = base & 0xFFFF;
    rmGdt[entryNo].base_middle     = base >> 16 & 0xFF;
    rmGdt[entryNo].base_high       = base >> 24 & 0xFF;
    rmGdt[entryNo].limit_low       = limit & 0xFFFF;
    rmGdt[entryNo].flags_and_limit = flags | (limit >> 16 & 0xF);
    rmGdt[entryNo].access          = access | 0x10;
}
