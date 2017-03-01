/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "kInit.h"

extern task_t* kKernelTask;
extern void vector32();
extern void _sysCall();
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();

struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;

void initKernelInternals()
{
    uint32_t oldCR3=0;

    kKernelTask=getAvailableTask();

    //Set up syscall IDT entry
    idt_set_gate (&idtTable[0x80], 0x9<<3, (int)&_sysCall, ACS_TASK_GATE | ACS_DPL_3);               //
    //Change timer handler to our own
    printk("Installing new IRQ0 handler\n");
    idt_set_gate (&idtTable[0x20], 0x08, (int)&vector32, ACS_INT); //Move this out of the way of the exception handlers
    //idt_install();

    //Create up syscall (0x80) TSS
     gdtEntryOS(0x9 ,(uint32_t)kKernelTask->tss  ,sizeof(tss_t), ACS_DPL_0 | ACS_TSS ,GDT_GRANULAR | GDT_32BIT,true);

     __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
    //Set up our kernel task
    kKernelTask->tss->EIP=(uint32_t)_sysCall;
    kKernelTask->tss->CS=getCS();
    kKernelTask->tss->DS=getDS();
    kKernelTask->tss->ES=getES();
    kKernelTask->tss->FS=getFS();
    kKernelTask->tss->GS=getGS();
    kKernelTask->tss->SS=0x28;
    kKernelTask->tss->CR3=oldCR3;
    kKernelTask->tss->SS0=0x28;
    kKernelTask->tss->ESP0=0xFF000;
    kKernelTask->tss->EFLAGS=0x200207;
    kKernelTask->tss->ESP=getESP() & ~0x200;
    kKernelTask->tss->ESP0=getESP() & ~0x200;
    kKernelTask->tss->LINK=0x0;
    kKernelTask->tss->IOPB=sizeof(tss_t);
    //displayTSS(kKernelTask->tss);
    tss_t* t=kKernelTask->tss;
    printd(DEBUG_TASK,"cs=%2X, ds=%2X, es=%2X, fs=%2X, gs=%2X, ss=%2X, cr3=0x%08X, flags=0x%08X, return=0x%08X\n",t->CS, t->DS, t->ES, t->FS, t->GS, t->SS,t->EFLAGS,_sysCall);
}