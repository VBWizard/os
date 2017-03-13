/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "kInit.h"
#include "i386/cpu.h"
#include "i386/msr.h"
#include "paging.h"


extern void _sysCall();
extern void _sysEnter();
extern void vector32();
extern void vector128();

extern task_t* kKernelTask;
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern bool schedulerTaskSwitched;
extern cpuid_features_t kCPUFeatures;
struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;

void initKernelInternals()
{
    uint32_t oldCR3=0;

    kKernelTask=getAvailableTask();
     __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
    //Set up our kernel task
    kKernelTask->taskNum=0x1;
    kKernelTask->kernel=true;
    kKernelTask->pageDir=(uint32_t*)oldCR3;
    kKernelTask->tss->EIP=(uint32_t)0xBADBADBA;
    kKernelTask->tss->CS=0x10;
    kKernelTask->tss->DS=getDS();
    kKernelTask->tss->ES=getES();
    kKernelTask->tss->FS=getFS();
    kKernelTask->tss->GS=getGS();
    kKernelTask->tss->SS=0x18;
    kKernelTask->tss->CR3=oldCR3;
    kKernelTask->tss->SS0=0x18;
    kKernelTask->tss->ESP0=allocPages(0x16000);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for kernel task ESP0\n",kKernelTask->tss->ESP1);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP0 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP0,16,0x7);
    kKernelTask->tss->ESP0+=0x15000;
    kKernelTask->tss->ESP1=allocPagesAndMap(0x16000);           //Syscall stack
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP1 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP1,16,0x7);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for (ESP1) sysEnter\n",kKernelTask->tss->ESP1);
    kKernelTask->tss->ESP1+=0x15000;
    kKernelTask->tss->EFLAGS=0x200207;
    kKernelTask->tss->ESP=allocPagesAndMap(0x16000);
    kKernelTask->tss->LINK=0x0;
    kKernelTask->tss->IOPB=sizeof(tss_t);
    idt_set_gate (&idtTable[0x80], 0x8, (int)&_sysCall, ACS_INT | ACS_DPL_3);
    idt_set_gate (&idtTable[0x80], 0x8, (int)&vector128, ACS_INT | ACS_DPL_3);

    //Configure SysEnter/SysExit
    if (!kCPUFeatures.cpuid_feature_bits.sep)
        panic("CPU does not have syscall functionality, cannot continue to boot.");

    wrmsr32(SYSENTER_CS_MSR,0x88,0x33);                      //Set sysenter CS(10) and SS(18), and return CS(3b) & SS(40)
    wrmsr32(SYSENTER_ESP_MSR,kKernelTask->tss->ESP1,0);     //Set sysenter ESP
    wrmsr32(SYSENTER_EIP_MSR,(uint32_t)&_sysEnter,0);       //Set sysenter EIP
    printd(DEBUG_PROCESS,"Setup SYSENTER MSRs as CS:EIP=0x%04X:0x%08X, ESP=0x%08X\n",0x88,0x88+8,kKernelTask->tss->ESP1);
    printd(DEBUG_PROCESS,"Mapping sysEnter_Vector page (0x%08X) to kernel, r/o\n",&_sysEnter);

    printk("Installing new IRQ0 handler\n");
    idt_set_gate (&idtTable[0x20], 0x08, (int)&vector32, ACS_INT); //Move this out of the way of the exception handlers

}