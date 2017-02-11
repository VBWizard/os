#include <stdbool.h>
#include "i386/gdt.h"
#include "chrisos.h"
#include "i386/bits/bits.h"

extern struct KERNEL_DATA_SECTION GDT* rmGdt;
extern struct KERNEL_DATA_SECTION GDT* gdt;
extern uint32_t* kGDTSlotAvailableInd;

//Create/modify entries in the protected mode GDT
void HIGH_CODE_SECTION gdtEntry(int entryNo, int base, int limit, char access, char flags,bool inUse)
{
    gdt[entryNo].base_low        = base & 0xFFFF;
    gdt[entryNo].base_middle     = base >> 16 & 0xFF;
    gdt[entryNo].base_high       = base >> 24 & 0xFF;
    gdt[entryNo].limit_low       = limit & 0xFFFF;
    gdt[entryNo].flags_and_limit = flags | (limit >> 16 & 0xF);
    gdt[entryNo].access          = access | 0x10;
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

