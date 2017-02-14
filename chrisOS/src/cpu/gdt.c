#include <stdbool.h>
#include "i386/gdt.h"
#include "chrisos.h"
#include "i386/bits/bits.h"

extern struct KERNEL_DATA_SECTION GDT* rmGdt;
extern struct KERNEL_DATA_SECTION GDT* bootGdt;
extern uint32_t* kGDTSlotAvailableInd;

//Create/modify entries in the protected mode GDT
void HIGH_CODE_SECTION gdtEntry(int entryNo, int base, int limit, char access, char flags,bool inUse)
{
    bootGdt[entryNo].base_low        = base & 0xFFFF;
    bootGdt[entryNo].base_middle     = base >> 16 & 0xFF;
    bootGdt[entryNo].base_high       = base >> 24 & 0xFF;
    bootGdt[entryNo].limit_low       = limit & 0xFFFF;
    bootGdt[entryNo].flags_and_limit = flags | (limit >> 16 & 0xF);
    bootGdt[entryNo].access          = access | 0x10;
    if (inUse)
        bitsReset(kGDTSlotAvailableInd,entryNo);
    else
        bitsSet(kGDTSlotAvailableInd,entryNo);
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

