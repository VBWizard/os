    /* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 31, 2016, 10:47 PM
 */

#include "utility.h"
#include "charDev.h"
#include "kernel.h"
#include "kernelObjects.h"
#include "mm.h"
#include "printf.h"
#include "syscall.h"
#include "sysloader.h"
#include "../../chrisOS/include/strings.h"
#include "../../chrisOS/include/i386/gdt.h"
#include "process.h"
#include <stddef.h>
#include <unistd.h>
#include "../include/sysloader.h"
#include "../../chrisOS/src/fat/fat_access.h"
#include "../include/task.h"
#include "io.h"
#include "kbd.h"
#include "thesignals.h"

extern char* kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
extern bool schedulerEnabled;
bool schedulerTaskSwitched=0;

process_t* kKernelProcess;
task_t* kKernelTask;
uint32_t saveESP;
uint32_t kKernelCR3=KERNEL_CR3;
void* keyboardHandlerRoutine=NULL;

int main(int argc, char** argv) {
    printk("\nkernel loaded ... \n");
/*    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    kbd_handler_generic_init();
    printk("Hello kernel world!!!\n");
    schedulerEnabled=false;
    schedulerTaskSwitched=false;
    printk("Initializing memory management ...\n");
    mmInit();
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
    initKMalloc();
    printk("Done initializing malloc\n\nInitializing task management ...\n");
    taskInit();
    printk("Done initializing task management\nInitializing kernel...\n");
    initKernelInternals();
    printk("Done initializing kernel\nInitializing scheduler...\n");
    initSched();
    printk("Done initializing scheduler\n");
    int lRetVal=fl_attach_media((fn_diskio_read)ahciBlockingRead28, (fn_diskio_write)ahciBlockingWrite28);

    char program[40]="/kshell";
    printk("Loading and executing %s\n",program);
    /*NOTE: This is how to create argv!!!*/
    char test[2][50];
    strcpy(test[0],"1");
    strcpy(test[1],"1");
    char* testp[2];
    testp[0]=test[0];
    testp[1]=test[1];
    process_t* process = createProcess(program, 2, &testp, NULL, false);
    schedulerEnabled=true;
/*#define pcount 3
    char* param1[pcount][10];
    char* param2[pcount][10];
    char* pptr[pcount][2];
    process_t* proc[pcount]={0};
    for (int cnt=0;cnt<pcount;cnt++)
    {
        sprintf(&param1[cnt][0],"%u",cnt+2);
        sprintf(&param2[cnt][0],"%u",cnt+2);
        pptr[cnt][0]=&param1[cnt][0];
        pptr[cnt][1]=&param1[cnt][0];
        proc[cnt]=createProcess(program,2,&pptr[cnt],false);
    }
*/

    //sys_sigaction(SIG_USLEEP,0,process->task->taskNum);
    kernelLoop:
    //triggerScheduler(); 
    goto kernelLoop;
    //sys_sigaction(SIG_SLEEP,0,*kTicksSinceStart+(TICKS_PER_SECOND*3));
    goto kernelLoop;
    return (0xbad);
}

