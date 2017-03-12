/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "kInit.h"

extern task_t* kKernelTask;
extern void _sysCall();
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern bool schedulerTaskSwitched;

struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
extern uint32_t vector128;
void initKernelInternals()
{
    uint32_t oldCR3=0;

    kKernelTask=getAvailableTask();
     __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
    //Set up our kernel task
    kKernelTask->taskNum=0x1;
    kKernelTask->kernel=true;
    kKernelTask->pageDir=oldCR3;
    kKernelTask->tss->EIP=(uint32_t)0xBADBADBA;
    kKernelTask->tss->CS=getCS();
    kKernelTask->tss->DS=getDS();
    kKernelTask->tss->ES=getES();
    kKernelTask->tss->FS=getFS();
    kKernelTask->tss->GS=getGS();
    kKernelTask->tss->SS=0x28;
    kKernelTask->tss->CR3=oldCR3;
    kKernelTask->tss->SS0=0x28;
    kKernelTask->tss->ESP0=allocPagesAndMap(0x16000);
    kKernelTask->tss->EFLAGS=0x200207;
    kKernelTask->tss->ESP=allocPagesAndMap(0x16000);
    kKernelTask->tss->LINK=0x0;
    kKernelTask->tss->IOPB=sizeof(tss_t);
    //idt_set_gate (&idtTable[0x80], 0x8, (int)&_sysCall, ACS_INT | ACS_DPL_3);
    idt_set_gate (&idtTable[0x80], 0x8, (int)&vector128, ACS_INT | ACS_DPL_3);

}