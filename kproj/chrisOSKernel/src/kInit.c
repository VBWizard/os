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
#include "alloc.h"

extern void _sysCall();
extern void _sysEnter();
extern void vector7();
extern void vector13();
extern void vector14();
extern void vector32();
extern void vector128();
extern void setupPagingHandler();

extern task_t* kKernelTask;
extern process_t* kKernelProcess;
extern uint32_t getCS();
extern uint32_t getDS();
extern uint32_t getES();
extern uint32_t getFS();
extern uint32_t getGS();
extern uint32_t getSS();
extern uint32_t getESP();
extern uint64_t kCPUCyclesPerSecond;
extern uint32_t* isrSavedStack;
extern bool schedulerTaskSwitched;
extern cpuid_features_t kCPUFeatures;
extern time_t kSystemCurrentTime;
extern void getDateTimeString(char *s);
extern uint32_t exceptionSavedStack;
extern uint64_t kCPUCyclesPerSecond;

struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
dllist_t* kLoadedElfInfo=NULL;   //NOTE: Before using the list you must call listInit and pass the first item (a dllist_t*) to it

char env[50][50];
char* envs[100];
tss_t* pagingExceptionTSS;

void initKernelInternals()
{
    char currTime[50];
    getDateTimeString((char*)currTime);
    //printk("Kernel init time is: %s\n",currTime);
    
__asm__("cli\n");
    uint32_t oldCR3=0;
    isrSavedStack = (uint32_t *)SAVED_STACK_FOR_EXCEPTIONS_ADDRESS;
    
    kKernelTask=getAvailableTask();
    printd(DEBUG_PROCESS,"Allocated kernel task at 0x%08X\n",kKernelTask);
    kKernelProcess=(process_t*)allocPagesAndMap(sizeof(process_t));
    printd(DEBUG_PROCESS,"Allocated kernel process at 0x%08X\n",kKernelProcess);
    kKernelProcess->task=kKernelTask;
    kKernelProcess->priority=16;    //Set kernel task to low priority
    kKernelTask->process=kKernelProcess;
     __asm__("mov ebx,cr3\n":[oldCR3] "=b" (oldCR3));
    //Set up our kernel task
    kKernelTask->kernel=true;
    kKernelTask->pageDir=(uint32_t*)KERNEL_CR3;
//    kKernelProcess->pageDirPtr=oldCR3;
    kKernelTask->tss->EIP=(uint32_t)0xBADBADBA;
    kKernelTask->tss->CS=0x20;
    kKernelTask->tss->DS=0x10;
    kKernelTask->tss->ES=0x10;
    kKernelTask->tss->FS=0x10;
    kKernelTask->tss->GS=0x10;
    kKernelTask->tss->SS=0x18;
    kKernelTask->tss->CR3=oldCR3;
    kKernelTask->tss->SS0=0x18;
    kKernelTask->esp0Size=0x18000;
    kKernelTask->esp0Base=allocPages(0x20000);
    kKernelTask->tss->ESP0=kKernelTask->esp0Base;
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for kernel task ESP0\n",kKernelTask->tss->ESP0);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP0 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP0,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP0,kKernelTask->tss->ESP0,0x16,0x7);
    kKernelTask->tss->ESP0+=0x15000;
    printd(DEBUG_PROCESS,"Adjusted kernel task ESP0 to 0x%08X\n",kKernelTask->tss->ESP0);
    kKernelTask->tss->ESP1=allocPages(0x16000);           //Syscall stack
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP1 | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP1,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP1,kKernelTask->tss->ESP1,0x16,0x7);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for (ESP1) sysEnter\n",kKernelTask->tss->ESP1);
    kKernelTask->tss->ESP1+=0x15000;
    kKernelTask->tss->EFLAGS=0x200207;
    kKernelTask->tss->ESP=allocPages(0x16000);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP | KERNEL_PAGED_BASE_ADDRESS,kKernelTask->tss->ESP,0x16,0x7);
    pagingMapPageCount(KERNEL_CR3,kKernelTask->tss->ESP,kKernelTask->tss->ESP,0x16,0x7);
    printd(DEBUG_PROCESS,"Allocated pages at 0x%08X for (ESP)\n",kKernelTask->tss->ESP);
    kKernelTask->tss->ESP+=0x15000;
    kKernelTask->tss->LINK=0x0;
    kKernelTask->tss->IOPB=0;
    kKernelProcess->stdin=0;
    kKernelProcess->stdout=1;
    kKernelProcess->stderr=2;
    
    kKernelProcess->path=allocPagesAndMap(0x255);
    strcpy(kKernelProcess->path,"/kernel");
    printd(DEBUG_PROCESS,"Allocated memory at 0x%08X for kernel path and set to %s\n",(uint32_t*)kKernelProcess->path,kKernelProcess->path);
    strcpy(env[0],"PATH=/");
    strcpy(env[1],"HOSTNAME=localhost.localdomain");
    strcpy(env[2],"CWD=/");
    for (int cnt=0;cnt<100;cnt++)
        envs[cnt]=0;
    envs[0]=env[0];
    envs[1]=env[1];
    envs[2]=env[2];
    kKernelProcess->mappedEnvp = (uintptr_t)envs;
    
    //isrSavedStack = (uint32_t*)allocPagesAndMapI(kKernelTask->tss->CR3,0x1000); //1k saved stack area
    isrSavedStack = exceptionSavedStack;
    pagingMapPage(KERNEL_CR3, isrSavedStack,isrSavedStack,0x7);
    pagingMapPage(KERNEL_CR3, (uint32_t)isrSavedStack | 0xC0000000,(uintptr_t)isrSavedStack,0x7);

    printd(DEBUG_TASK,"Set up isrSavedStack at 0x%08X (and in the kernel)\n",isrSavedStack);
    
    pagingMapPage(kKernelTask->tss->CR3,(uintptr_t)kKernelTask->tss,(uintptr_t)kKernelTask->tss,0x7);
    pagingMapPage(KERNEL_CR3,(uintptr_t)kKernelTask->tss,(uintptr_t)kKernelTask->tss,0x7);
    printd(DEBUG_TASK,"Mapped tss of the first task run (0x%08X) into task and kernel\n", kKernelTask->tss);
    
    gdtEntryOS(kKernelTask->taskNum,(uint32_t)kKernelTask->tss,sizeof(tss_t), ACS_TSS | ACS_DPL_0,GDT_GRANULAR | GDT_32BIT,true);

    
    //idt_set_gate (&idtTable[0x80], 0x8, (int)&_sysCall, ACS_INT | ACS_DPL_3);
    idt_set_gate (&idtTable[0x80], 0x8, (int)&vector128, ACS_INT | ACS_DPL_3);
    //See setupPagingHandler
    //idt_set_gate (&idtTable[0xe], 0x8, (int)&vector14, ACS_INT);   //paging exception
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
    idt_set_gate (&idtTable[0x7], 0x08, (int)&vector7, ACS_INT);
    setupPagingHandler();

    __asm__("jmp 0x88:kernJump1\nkernJump1:\n");

kernJump1:    
__asm__("sti\n");

}

int tscGetTicksPerSecond()
{
    uint64_t ticksBefore=rdtsc();
    wait(500);
    return (rdtsc()-ticksBefore)*2;
}

void hardwareInit()
{
    kCPUCyclesPerSecond = tscGetTicksPerSecond();

    //Check for SEE and enable it if available, also disabling co emu and monitoring
    __asm__("mov eax, 0x1\n"
            "cpuid\n"
            "test edx, 1<<25\n"
            "jz .noSSE\n"
            "mov eax, cr0\n"
            "and ax, 0xFFFB\n"  //clear coprocessor emulation CR0.EM
            "or ax, 0x2\n"      //set coprocessor monitoring  CR0.MP
            "mov cr0, eax\n"
            "mov eax, cr4\n"
            "or ax, 3 << 9\n"   //set CR4.OSFXSR and CR4.OSXMMEXCPT at the same time
            "mov cr4, eax\n"
            ".noSSE:\n");
    
}
