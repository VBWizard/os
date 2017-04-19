#include "chrisos.h"
#include "acpi.h"
#include "i386/bits/types.h"
#include "printf.h"
#include "strings.h"

extern uint32_t kDebugLevel;

uint32_t doRSDPSearch(int from, int count)
{
    uint8_t* fromPtr=(uint8_t*)from;
    
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_ACPI) == DEBUG_ACPI)
            printk("doRSDPSearch: 0x%08X(0x%08X)-0x%08X\n", from, &fromPtr[0], from+count);
#endif
    for (int cnt=0;cnt<count;cnt++)
        if (fromPtr[cnt]=='R' && fromPtr[cnt+1]=='S' && fromPtr[cnt+2]=='D' && fromPtr[cnt+3]==' ' && fromPtr[cnt+4]=='P' && fromPtr[cnt+5]=='T' && fromPtr[cnt+6]=='R' && fromPtr[cnt+7]==' ')
        {
            return (uint32_t)&fromPtr[cnt];
        }
    return 0xFFFFFFFF;
}

acpiFADT_t *acpiFindTable(void *RootSDT, char* tableSignature)
{
    acpiRSDT_t* rsdt = (acpiRSDT_t*) RootSDT;
    int entries = ((rsdt->header.Length - sizeof(rsdt->header)) / 4)+10;
 
    for (int i = 0; i < entries; i++)
    {
        acpiRSDT_t *nextRSDT = (acpiRSDT_t*)rsdt->PointerToOtherSDT[i];
        printd(DEBUG_ACPI,"***tableSignature=%s, header sig=%s***\n", tableSignature, nextRSDT->header.Signature);
        if (!strncmp(nextRSDT->header.Signature, tableSignature, 4))
            return (acpiFADT_t*)nextRSDT;
    }
 
    // No FACP found
    return NULL;
}
void *acpiFindTable2(void *RootSDT, char* tableSignature)
{
    acpiRSDT_t *rsdt = (acpiRSDT_t*) RootSDT;
    int entries = (rsdt->header.Length - sizeof(rsdt->header)) / 4;
 
    for (int i = 0; i < entries; i++)
    {
        acpiRSDT_t *nextRSDT = (acpiRSDT_t *) rsdt->PointerToOtherSDT[i];
        printd(DEBUG_ACPI,"***tableSignature=%s, header sig=%s***\n", tableSignature, nextRSDT->header.Signature);
        if (!strncmp(nextRSDT->header.Signature, tableSignature, 4))
            return (void *) nextRSDT;
    }
 
    // No FACP found
    return NULL;
}
void acpiFindTables()
{
    acpiRSDPHeader_t* lRSDPTable;
    acpiRSDT_t* lRootSDP;
    acpiFADT_t* lFADTSDP;
     printd(DEBUG_ACPI,"acpiFindTables: Looking for ACPI tables\n");
             uint16_t* lEBDABIOSPtr=(uint16_t*)0x40e;
    int32_t lRSDPPtr;
    uint32_t lRSDPBaseAddress=0xFFFFFFFF;
    
    //Start by looking in the bios for the extended bios data area (EBDA) segment address, and search there
    if (lEBDABIOSPtr != 0)
    {
        lRSDPPtr=*lEBDABIOSPtr*10;
        lRSDPBaseAddress = doRSDPSearch(lRSDPPtr, 0xFFFF);
    }
    //If we didn't find the RSDP table there, look from 0xE0000->0xFFFFF
    if (lRSDPBaseAddress==0xFFFFFFFF)
    {
        lRSDPBaseAddress=doRSDPSearch(0xE0000, 0x1FFFF);
    }
    if (lRSDPBaseAddress==0xFFFFFFFF)
    {
           printd(DEBUG_ACPI," table not found\n", lRSDPPtr);
        return;
    }
    lRSDPTable=(acpiRSDPHeader_t*)lRSDPBaseAddress;
    printd(DEBUG_ACPI," table found at 0x%08X\n", lRSDPBaseAddress);
    printk("ACPI version %s, RSPD OEM Id: %s\n", lRSDPTable->firstPart.Revision==0?"1.0":"2+", lRSDPTable->firstPart.OEMID);
    if (lRSDPTable->firstPart.Revision==0)
    {
        lRootSDP=(acpiRSDT_t*)lRSDPTable->firstPart.RsdtAddress;
        printd(DEBUG_ACPI,"RSDP is at 0x%08X, OEM Id: %s, OSDT=0x%08X\n", lRootSDP, lRootSDP->header.OEMID, lRootSDP->PointerToOtherSDT);
    }
    else
    {
        lRootSDP=(acpiRSDT_t*)(uint32_t)lRSDPTable->XsdtAddress;  //CLR 04/18/2017: Re-casting to 32-bit pointer
        printd(DEBUG_ACPI,"RSDP is at 0x%08X, OEM Id: %s, OSDT=0x%08X\n", lRootSDP, lRootSDP->header.OEMID, lRootSDP->PointerToOtherSDT);
    }
    lFADTSDP=acpiFindTable(lRootSDP,"FACP");
    if (lFADTSDP!=NULL)
    {
        printd(DEBUG_ACPI,"FACP found at 0x%08X. resetReg=0x%08X\n", lFADTSDP, lFADTSDP->ResetReg);
    }
    else
    {
        printd(DEBUG_ACPI,"Failed to find FACP table, cannot continue ACPI discovery.\n");
    }
    acpiFADT_t* ltemp=acpiFindTable(lFADTSDP,"DSDT");
    printd(DEBUG_ACPI,"lTemp=0x%08X\n", ltemp);
   
}
    
   
void acpiInitialize()
{
    acpiFindTables();
    
}
    
