#include <stdbool.h>
#include "memory.h"
#include "printf.h"
#include "kbd.h"
#include "charDev.h"

extern word kE820RecordCount;
extern SMAP_entry* KERNEL_DATA_SECTION smap_table;

void print_e820_entry(SMAP_entry buffer)
{
    printk("mem[%016X-%016X] (%016X) %s\n",buffer.BaseL, 
                                           buffer.BaseL + buffer.LengthL -1 , buffer.LengthL,
                                            buffer.Type==1?"Usable":buffer.Type==2?"Rsvd(2)":buffer.Type==3?"Rclm":buffer.Type==4?"NVS":"Rsvd");
}

void printE820Map()
{
    SMAP_entry* buffer=smap_table;
    int entryCount=kE820RecordCount;
    print_e820_map(smap_table, kE820RecordCount);
        for (int cnt=0;cnt<entryCount;cnt++)
        {
        print_e820_entry(buffer[cnt]);
        cnt++;
        if (cnt>0 && ((cnt+2)%cursorGetMaxY())==0)
        {
            puts("Paused, press a key to continue");
            waitForKeyboardKey();
            cursorMoveTo(0,cursorGetPosY());
        }
        }
}

void print_e820_map(SMAP_entry* buffer, int entryCount)
{
    bool printOnlyUsable=entryCount>10?true:false;
    
        for (int cnt=0;cnt<entryCount;cnt++)
        {
            if ((!printOnlyUsable) || (printOnlyUsable && buffer[cnt].Type==1))
                print_e820_entry(buffer[cnt]);
            else
                print_e820_entry(buffer[cnt]);
        }
}

uint64_t sum_e820_usable_memory(SMAP_entry* buffer, int entryCount)
{
    qword lRetVal = 0;
    bool useEntry=false;
    printk("\n");
    for (int ptr=0;ptr<entryCount;ptr++)
    {
        useEntry=true;
        if (buffer[ptr].Type==1)
        {
            printk("\tEvaluating entry %u, start=0x%08x, length=0x%08x, type=%u\n",ptr,buffer[ptr].BaseL, buffer[ptr].LengthL, buffer[ptr].Type);
            for (int cmp=0;cmp<ptr;cmp++)
            {
                //If there is a previous entry where the current base is between the previous entry's base and base+length then don't use it
                if (buffer[ptr].BaseL>=buffer[cmp].BaseL 
                        && buffer[ptr].BaseL < buffer[cmp].BaseL+buffer[cmp].LengthL)
                {
                printk("\t\tFound overlapping entry %u, start=0x%08x, length=0x%08x, type=%u\n",cmp,buffer[cmp].BaseL, buffer[cmp].LengthL, buffer[cmp].Type);
                    useEntry=false;
                    break;
                }
            }
            if (useEntry) 
            {
                lRetVal += buffer[ptr].LengthL;
                printk("\t\tNo overlaps, using this entry ... new sum of available memory is 0x%08x\n",lRetVal);
            }
        }
    }
    return lRetVal;
}