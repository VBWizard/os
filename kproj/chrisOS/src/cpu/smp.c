#include "chrisos.h"
#include <stdbool.h>
#include "i386/smp.h"
#include "i386/bits/types.h"
#include "memory.h"
#include "strings.h"
#include "kbd.h"
#include "mpspec_def.h"
#include "printf.h"

struct mpf_intel* mp;
struct mpc_table* mc;

extern uint32_t kDebugLevel;
extern mpConfig_t* kMPConfigTable;
extern uintptr_t* kIOAPICPtr;

bool HIGH_CODE_SECTION mpScanForConfig(int start, int length)
{
    struct mpf_intel* lMP;
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_MP) == DEBUG_MP)
        printd(DEBUG_MP,"mpScanForConfig; 0x%08X-->0x%08X\n", start, start+length);
#endif
    for (int cnt=start;cnt<start+length;cnt++)
    {
        lMP=(struct mpf_intel*)cnt;
        if(!strncmp(lMP->signature,"_MP_",4))
        {
            mp=(struct mpf_intel*)cnt;
            return true;
        }
    }
    return false;
}

bool HIGH_CODE_SECTION  mpFindTables()
{
    uint16_t* lEBDAPtr=(uint16_t*)0x40e;
    bool lResult;
    
    if (lEBDAPtr != 0)
        lResult=mpScanForConfig(*lEBDAPtr<<4, 0x400);
    if (!lResult)
        if (!mpScanForConfig(0x9fc00, 0x400))
            if (!mpScanForConfig(0xF0000, 0xFFFF))
            {
#ifndef DEBUG_NONE
                 if ((kDebugLevel & DEBUG_MP) == DEBUG_MP)
                    printd(DEBUG_MP,"MP tables not found, MP not allowed, proceeding as single processor.\n");
#endif
                return false;
            }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_MP) == DEBUG_MP)
        printd(DEBUG_MP,"MP tables found at 0x%08X, spec %c\n", mp, mp->specification);
#endif
    return true;
        
}

void HIGH_CODE_SECTION printMPTable()
{
    mpConfig_t* mpptr=kMPConfigTable;
    int cnt=0;
    
    while (mpptr->nextRecAddress!=0xFFFFFFFF)
    {
        switch (mpptr->recType)
        {
            case CPU:
                printk("CPU: APICId=%u, Enabled=%s, %s\n", mpptr->cpu.apicid, (mpptr->cpu.cpuflag&0x1)?"yes":"no", (mpptr->cpu.cpuflag&0x2)?"BSP":"");
                break;
            case BUS:
                printk("BUS: ID=%u, BusType=%c%c%c%c%c%c, Type=%c\n", mpptr->bus.busid, mpptr->bus.bustype[0], mpptr->bus.bustype[1], mpptr->bus.bustype[2], mpptr->bus.bustype[3], mpptr->bus.bustype[4], mpptr->bus.bustype[5], mpptr->bus.type );
                break;
            case IOAPIC:
                printk("IO APIC: ID=%02X Address=0x%08X Enabled=%s\n",mpptr->apic.apicid, mpptr->apic.apicaddr, mpptr->apic.flags&0x1?"yes":"no");
                break;
            case IOINTASS:
                printk("Type=%s Pol=%s Trig=%s sB=%02X sI=%02X dA=%02X dI=%02X\n", 
                        mpptr->irqSrc.irqtype==0?"INT"                      
                            :mpptr->irqSrc.irqtype==1?"NMI"
                            :mpptr->irqSrc.irqtype==2?"SMI"
                            :mpptr->irqSrc.irqtype==3?"Ext"
                            :"unk",                                 //iType
                        (mpptr->irqSrc.irqflag&0x3)==0x0?"AL"
                            :(mpptr->irqSrc.irqflag&0x3)==0x1?"AH"
                            :(mpptr->irqSrc.irqflag&0x3)==0x2?"Res":"AL(2)", //Polarity
                        (mpptr->irqSrc.irqflag&0xc)==0x0?"E"
                            :(mpptr->irqSrc.irqflag&0xc)==0x4?"E(2)"
                            :(mpptr->irqSrc.irqflag&0xc)==0x8?"R":"L", //Trigger
                        mpptr->irqSrc.srcbus, mpptr->irqSrc.srcbusirq, mpptr->irqSrc.dstapic, mpptr->irqSrc.dstirq);
                break;
            case LOCALINTASS:
                printk("Type=%s Pol=%s Trig=%s sB=%02X sI=%02X dA=%02X dL=%02X\n", 
                             mpptr->lintSrc.irqtype==0?"INT"                      //type
                            :mpptr->lintSrc.irqtype==1?"NMI"
                            :mpptr->lintSrc.irqtype==2?"SMI"
                            :mpptr->lintSrc.irqtype==3?"Ext"
                            :"unk", //iType
                        (mpptr->lintSrc.irqflag&0x3)==0x0?"AL"
                            :(mpptr->lintSrc.irqflag&0x3)==0x1?"AH"
                            :(mpptr->lintSrc.irqflag&0x3)==0x2?"Res":"AL(2)", //Polarity
                        (mpptr->lintSrc.irqflag&0xc)==0x0?"E"
                            :(mpptr->lintSrc.irqflag&0xc)==0x4?"E(2)"
                            :(mpptr->lintSrc.irqflag&0xc)==0x8?"R":"L", //Trigger
                        mpptr->lintSrc.srcbusid, mpptr->lintSrc.srcbusirq, mpptr->lintSrc.destapic, mpptr->lintSrc.destapiclint);
                break;
            default:
                return;
        }
        mpptr++;
        cnt++;
        if (cnt>0 && ((cnt+2)%cursorGetMaxY())==0)
        {
            puts("Paused, press a key to continue");
            waitForKeyboardKey();
            cursorMoveTo(0,cursorGetPosY());
        }

    }
}

unsigned HIGH_CODE_SECTION mpInit()
{
    uint8_t* recPtr;
    char lTempString[15];
    memset(lTempString, 0, 15);
    mpFindTables();
    printd(DEBUG_MP,"MP table found @ 0x%08X, sig=%c%c%c%c, features=%u/%u/%u/%u/%u, length=%u\n", mp, mp->signature[0], mp->signature[1], mp->signature[2], mp->signature[3], mp->feature1, mp->feature2, mp->feature3, mp->feature4, mp->feature5, mp->length);
    if (mp->feature1!=0)
    {
        printk("NOTE: need to implement Intel MP default configurations (%u)",mp->feature1);
        return false;
    }
    mc=(struct mpc_table*)mp->physptr;
    printd(DEBUG_MP,"MC table found @ 0x%08X, sig=%c%c%c%c, length=%u, lapic=0x%08X, OEM tbl=0x%08X\n", mc, mc->signature[0], mc->signature[1], mc->signature[2], mc->signature[3], mc->length, mc->lapic, mc->oemptr);
    memcpy(lTempString, mc->oem,4);
    printd(DEBUG_MP,"\tMPC OEM '%s'", lTempString);
    memset(lTempString, 0, 15);
        memcpy(lTempString, mc->productid,12);
    printd(DEBUG_MP,", product '%s': %s\n", lTempString);
    recPtr=(uint8_t*)mp->physptr+sizeof(struct mpc_table);
    printd(DEBUG_MP,"Parsing MC %u table entries at 0x%08X\n", mc->count, recPtr);
    for (int cnt=0;cnt< mc->count;cnt++)
    {
        switch((int)*(uint8_t*)recPtr)
        {
            case 0:
                //TODO: Add all this info to a kernel structure
                printd(DEBUG_MP,"\tCPU:  ");
                struct mpc_cpu* cpu=(struct mpc_cpu*)recPtr;
                memcpy(kMPConfigTable[cnt].rec,recPtr,20);
                if (cnt==0)
                    kMPConfigTable[cnt].prevRecAddress=0xFFFFFFFF;
                else if (cnt==mc->count-1)
                    kMPConfigTable[cnt].nextRecAddress=0xFFFFFFFF;
                else
                {
                    kMPConfigTable[cnt].prevRecAddress=(uint32_t)&kMPConfigTable[cnt-1];
                    kMPConfigTable[cnt-1].nextRecAddress=(uint32_t)&kMPConfigTable[cnt];
                }
                kMPConfigTable[cnt].recType=CPU;
                printd(DEBUG_MP,"APICId=%u, Enabled=%s, %s\n", cpu->apicid, (cpu->cpuflag&0x1)?"yes":"no", (cpu->cpuflag&0x2)?"BSP":"");
                recPtr+=20;
                break;
            case 1:
                printd(DEBUG_MP,"\tBus:  ");
                struct mpc_bus* bus=(struct mpc_bus*)recPtr;
                memcpy(kMPConfigTable[cnt].rec,recPtr,8);
                if (cnt==0)
                    kMPConfigTable[cnt].prevRecAddress=0xFFFFFFFF;
                else if (cnt==mc->count-1)
                    kMPConfigTable[cnt].nextRecAddress=0xFFFFFFFF;
                else
                {
                    kMPConfigTable[cnt].prevRecAddress=(uint32_t)&kMPConfigTable[cnt-1];
                    kMPConfigTable[cnt-1].nextRecAddress=(uint32_t)&kMPConfigTable[cnt];
                }
                recPtr+=8;
                kMPConfigTable[cnt].recType=BUS;
                printd(DEBUG_MP,"ID=%u, BusType=%c%c%c%c%c%c, Type=%c\n", bus->busid, bus->bustype[0], bus->bustype[1], bus->bustype[2], bus->bustype[3], bus->bustype[4], bus->bustype[5], bus->type );
                break;
            case 2:
                printd(DEBUG_MP,"\tAPIC: ");
                struct mpc_ioapic* apic=(struct mpc_ioapic*)recPtr;
                memcpy(kMPConfigTable[cnt].rec,recPtr,8);
                if (cnt==0)
                    kMPConfigTable[cnt].prevRecAddress=0xFFFFFFFF;
                else if (cnt==mc->count-1)
                    kMPConfigTable[cnt].nextRecAddress=0xFFFFFFFF;
                else
                {
                    kMPConfigTable[cnt].prevRecAddress=(uint32_t)&kMPConfigTable[cnt-1];
                    kMPConfigTable[cnt-1].nextRecAddress=(uint32_t)&kMPConfigTable[cnt];
                }
                kMPConfigTable[cnt].recType=IOAPIC;
                recPtr+=8;
                printd(DEBUG_MP,"ID=%02X, Address=0x%08X, Enabled=%s\n",apic->apicid, apic->apicaddr, apic->flags&0x1?"yes":"no");
                kIOAPICPtr=(uintptr_t*)apic->apicaddr;
                break;
            case 3:
                printd(DEBUG_MP,"\tIRQ:  ");
                struct mpc_intsrc*intr=(struct mpc_intsrc*)recPtr;
                memcpy(kMPConfigTable[cnt].rec,recPtr,8);
                if (cnt==0)
                    kMPConfigTable[cnt].prevRecAddress=0xFFFFFFFF;
                else if (cnt==mc->count-1)
                    kMPConfigTable[cnt].nextRecAddress=0xFFFFFFFF;
                else
                {
                    kMPConfigTable[cnt].prevRecAddress=(uint32_t)&kMPConfigTable[cnt-1];
                    kMPConfigTable[cnt-1].nextRecAddress=(uint32_t)&kMPConfigTable[cnt];
                }
                kMPConfigTable[cnt].recType = IOINTASS;
                recPtr+=8;
                printd(DEBUG_MP,"Type=%s, Pol=%s, Trig=%s, sB=%02X, sI=%02X, dA=%02X, dI=%02X\n", 
                        intr->irqtype==0?"INT"                      
                            :intr->irqtype==1?"NMI"
                            :intr->irqtype==2?"SMI"
                            :intr->irqtype==3?"Ext"
                            :"unk",                                 //iType
                        (intr->irqflag&0x3)==0x0?"AL"
                            :(intr->irqflag&0x3)==0x1?"AH"
                            :(intr->irqflag&0x3)==0x2?"Res":"AL(2)", //Polarity
                        (intr->irqflag&0xc)==0x0?"E"
                            :(intr->irqflag&0xc)==0x4?"E(2)"
                            :(intr->irqflag&0xc)==0x8?"R":"L", //Trigger
                        intr->srcbus, intr->srcbusirq, intr->dstapic, intr->dstirq);
                break;
            case 4:
                printd(DEBUG_MP,"\tLINT: ");
                struct mpc_lintsrc* lint=(struct mpc_lintsrc*)recPtr;
                memcpy(kMPConfigTable[cnt].rec,recPtr,8);
                if (cnt==0)
                    kMPConfigTable[cnt].prevRecAddress=0xFFFFFFFF;
                else if (cnt==mc->count-1)
                    kMPConfigTable[cnt].nextRecAddress=0xFFFFFFFF;
                else
                {
                    kMPConfigTable[cnt].prevRecAddress=(uint32_t)&kMPConfigTable[cnt-1];
                    kMPConfigTable[cnt-1].nextRecAddress=(uint32_t)&kMPConfigTable[cnt];
                }
                kMPConfigTable[cnt].recType = LOCALINTASS;
                recPtr+=8;
                printd(DEBUG_MP,"Type=%s, Pol=%s, Trig=%s, sB=%02X, sI=%02X, dA=%02X, dL=%02X\n", 
                             lint->irqtype==0?"INT"                      //type
                            :lint->irqtype==1?"NMI"
                            :lint->irqtype==2?"SMI"
                            :lint->irqtype==3?"Ext"
                            :"unk", //iType
                        (lint->irqflag&0x3)==0x0?"AL"
                            :(lint->irqflag&0x3)==0x1?"AH"
                            :(lint->irqflag&0x3)==0x2?"Res":"AL(2)", //Polarity
                        (lint->irqflag&0xc)==0x0?"E"
                            :(lint->irqflag&0xc)==0x4?"E(2)"
                            :(lint->irqflag&0xc)==0x8?"R":"L", //Trigger
                        lint->srcbusid, lint->srcbusirq, lint->destapic, lint->destapiclint);
                break;
            default:
                printd(DEBUG_MP,"\tue %04X, ", (int)*(uint8_t*)recPtr);
                recPtr+=8;
                break;
        }
        if (cnt > 0 && cnt%250==0)
            waitForKeyboardKey();
    }
    printd(DEBUG_MP,"rec5 pp=%08X(%08X),np=%08X(%08X)\n", kMPConfigTable[5].prevRecAddress, &kMPConfigTable[4], kMPConfigTable[5].nextRecAddress, &kMPConfigTable[6]);
    return mc->count;
}