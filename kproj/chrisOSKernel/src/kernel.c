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
#include "../../chrisOS/src/fat/fat_filelib.h"
#include "fs.h"
#include "filesystem/pipe.h"
#include "drivers/termdrv.h"
#include "drivers/tty_driver.h"
#include "thesignals.h"

extern char* kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
extern bool schedulerEnabled;
extern bool signalCheckEnabled;
bool schedulerTaskSwitched=0;
extern uint32_t* isrSavedStack; 
extern uint32_t kNextSignalCheckTicks;
extern void keyboardInit();
extern void initTerm();
extern int initTTY();
extern void globalMMapInit();

filesystem_t *rootFs, *pipeFs;
terminfo_t *sysConsole;
ttydevice_t *tty1;
process_t* kIdleProcess;
task_t* kIdleTask;
uint32_t kIdleTicks=0;
uint64_t kCPUCyclesPerSecond;
uint32_t saveESP;
uint32_t kKernelCR3=KERNEL_CR3;
void* kKeyboardHandlerRoutine=NULL;

int main(int argc, char** argv)  {
    printk("\nkernel loaded ... \n");
/*    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    __asm__("cli\n");
    kNextSignalCheckTicks = *kTicksSinceStart;
    kbd_handler_generic_init();
    printk("Kernel loaded...\n");
    schedulerEnabled=false;
    schedulerTaskSwitched=false;
    printk("Initializing hardware ...\n");
    hardwareInit();
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
    
    
    fileops_t fops;
    dirops_t dops;
    fops.open = &fl_fopen;
    fops.close = &fl_fclose;
    fops.read = &fl_fread;
    fops.seek = &fl_fseek;
    dops.open = &fl_opendir;
    dops.close = &fl_closedir;
    dops.read = &fl_readdir;
    
    rootFs = kRegisterFileSystem("/", &fops, &dops);
    pipeFs = initpipefs();
    
    globalMMapInit();
    initTerm();
    initTTY();
    sysConsole = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 0, 80, 50, "Main system console 0");
    tty1 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 0);
    kKernelProcess->stdout = tty1->stdOutWritePipe;
    kKernelProcess->stdin = tty1->stdInReadPipe;
    kKernelProcess->stderr = tty1->stdErrWritePipe;
    
    printd (DEBUG_PROCESS, "tty 1 pipes: stdinRead = 0x%08X, stdinWrite = 0x%08X, stdoutRead = 0x%08X, stdoutWrite = 0x%08X\n", 
            tty1->stdInReadPipe, tty1->stdInWritePipe, tty1->stdOutReadPipe, tty1->stdOutWritePipe);
    
    keyboardInit();
    //CLR 04/23/2018: Commented out because this references fs.h which we are modifying to make a VFS
    //console_file.fops.write(NULL,"hello kernel world!!!\n",21,NULL);
    
    kIdleTicks=0;
    kIdleProcess=createProcess("/sbin/idle", 0, NULL, kKernelProcess, true, false);
    kIdleTask=kIdleProcess->task;
    //Need to let the idle task run once so that it initializes, so make sure it is the first task to run when the scheduler starts
    kIdleTask->prioritizedTicksInRunnable = 0xDFFFFFFF;
    char program[40]="/kshell";
    printk("Loading and executing %s\n",program);
    /*NOTE: This is how to create argv!!!*/
    char params[2][50];
    strcpy(params[0],"1");
    strcpy(params[1],"1");
    char* args[2];
    args[0]=params[0];
    args[1]=params[1];

    
    process_t* initialShellProcess = createProcess(program, 2, args, kKernelProcess, false, false);
    printk("KSHELL LOADED!!!");
//    waitTicks(3);
    schedulerEnabled=true;
    signalCheckEnabled=true;
    sys_sigaction(SIGUSLEEP,0,initialShellProcess->task->taskNum, kKernelProcess);
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

    printk("\n\nLast task was killed, shutting down the kernel ...\n");
    schedulerEnabled=false;
    printk("Disabled scheduler ...\n");
    waitTicks(3);
    printk("All shut down, exiting kernel!\n");
    return (0xbad);
}

