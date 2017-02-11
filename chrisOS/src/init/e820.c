#include <stdbool.h>
#include "memory.h"
#include "printf.h"
#include "kbd.h"

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
    
    for (int cnt=0;cnt<entryCount;cnt++)
    {
        if (buffer[cnt].Type==1)    
            lRetVal += buffer[cnt].LengthL;
    }
    return lRetVal;
}