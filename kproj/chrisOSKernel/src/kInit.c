/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "kInit.h"
#include "i386/cpu.h"
#include "i386/msr.h"
#include "paging.h"
#include "elfloader.h"
#include "process.h"
#include "dllist.h"
#include "time_os.h"

extern void _sysCall();
extern void _sysEnter();
extern void vector13();
extern void vector14();
extern void vector32();
extern void vector128();

extern task_t* kKernelTask;
extern process_t* kKernelProcess;
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern bool schedulerTaskSwitched;
extern cpuid_features_t kCPUFeatures;
extern time_t kSystemCurrentTime;
extern void getDateTimeString(char *s);

struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
dllist_t* kLoadedElfInfo=NULL;   //NOTE: Before using the list you must call listInit and pass the first item (a dllist_t*) to it

char env[2][50];
char* envs[100];

void initKernelInternals()
{
    char currTime[50];
    getDateTimeString((char*)currTime);
    printk("Kernel init time is: %s\n",currTime);
    
__asm__("cli\n");
    uint32_t oldCR3=0;
    kKernelTask=getAvailableTask();
    kKernelProcess=(process_t*)allocPagesAndMap(sizeof(process_t));
    kKernelProcess->task=kKernelTask;
    kKernelProcess->priority=16;    //Set kernel task to low priority
    kKernelTask->process=kKernelProcess;
     __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
    //Set up our kernel task
    kKernelTask->kernel=true;
    kKernelTask->pageDir=(uint32_t*)oldCR3;
    kKernelTask->tss->EIP=(uint32_t)0xBADBADBA;
    kKernelTask->tss->CS=0x20;
    kKernelTask->tss->DS=0x10;
    kKernelTask->tss->ES=0x10;
    kKernelTask->tss->FS=0x10;
    kKernelTask->tss->GS=0x10;
    kKernelTask->tss->SS=0x18;
    kKernelTask->tss->CR3=oldCR3;
    kKernelTask->tss->SS0=0x18;
    kKernelTask->esp0Size=0x16000;
    kKernelTask->esp0Base=allocPages(0x16000);
    kKernelTask->tss->ESP0=kKernelTask->esp0Base;
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for kernel task ESP0\n",kKernelTask->tss->ESP0);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP0 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP0,0x16,0x7);
    kKernelTask->tss->ESP0+=0x15000;
    kKernelTask->tss->ESP1=allocPages(0x16000);           //Syscall stack
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP1 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP1,0x16,0x7);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for (ESP1) sysEnter\n",kKernelTask->tss->ESP1);
    kKernelTask->tss->ESP1+=0x15000;
    kKernelTask->tss->EFLAGS=0x200207;
    kKernelTask->tss->ESP=allocPages(0x16000);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP,0x16,0x7);
    kKernelTask->tss->LINK=0x0;
    kKernelTask->tss->IOPB=0;
    kKernelProcess->stdin=STDIN_FILE;
    kKernelProcess->stdout=STDOUT_FILE;
    kKernelProcess->stderr=STDERR_FILE;

    strcpy(env[0],"PATH=/");
    strcpy(env[1],"HOSTNAME=localhost.localdomain");
    for (int cnt=0;cnt<100;cnt++)
        envs[cnt]=0;
    envs[0]=env[0];
    envs[1]=env[1];
    kKernelProcess->envp = (uintptr_t)envs;
    
    pagingMapPage(kKernelTask->tss->CR3,(uintptr_t)kKernelTask->tss,(uintptr_t)kKernelTask->tss,0x7);
    pagingMapPage(KERNEL_CR3,(uintptr_t)kKernelTask->tss,(uintptr_t)kKernelTask->tss,0x7);
    printd(DEBUG_TASK,"Mapped tss of the first task run (0x%08X) into task and kernel\n", kKernelTask->tss);
    
    gdtEntryOS(kKernelTask->taskNum,(uint32_t)kKernelTask->tss,sizeof(tss_t), ACS_TSS | ACS_DPL_0,GDT_GRANULAR | GDT_32BIT,true);
    __asm__("mov eax,%[taskTSS]\n"                                    //Load task register with user process TSS entry
            "ltr ax\n"
            ::[taskTSS] "r" (kKernelTask->taskNum<<3));

    
    //idt_set_gate (&idtTable[0x80], 0x8, (int)&_sysCall, ACS_INT | ACS_DPL_3);
    idt_set_gate (&idtTable[0x80], 0x8, (int)&vector128, ACS_INT | ACS_DPL_3);
    idt_set_gate (&idtTable[0xe], 0x8, (int)&vector14, ACS_INT);   //paging exception
    //idt_set_gate (&idtTable[0xd], 0x8, (int)&vector13, ACS_INT); //Move this out of the way of the exception handlers

    //Configure SysEnter/SysExit
    if (!kCPUFeatures.cpuid_feature_bits.sep)
        panic("CPU does not have syscall functionality, cannot continue to boot.");

    wrmsr32(SYSENTER_CS_MSR,0x88,0x33);                      //Set sysenter CS(10) and SS(18), and return CS(3b) & SS(40)
    wrmsr32(SYSENTER_ESP_MSR,kKernelTask->tss->ESP1,0);     //Set sysenter ESP
    wrmsr32(SYSENTER_EIP_MSR,(uint32_t)&_sysEnter,0);       //Set sysenter EIP
    printd(DEBUG_PROCESS,"Setup SYSENTER MSRs as CS:EIP=0x%04X:0x%08X, ESP=0x%08X\n",0x88,&_sysEnter,kKernelTask->tss->ESP1);

    printk("Installing new IRQ0 handler\n");
    idt_set_gate (&idtTable[0x20], 0x08, (int)&vector32, ACS_INT); //Move this out of the way of the exception handlers
__asm__("sti\n");

}