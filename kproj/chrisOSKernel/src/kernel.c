    /* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 31, 2016, 10:47 PM
 */

#include "kernel.h"
#include <stdint.h>
#include <unistd.h>
#include "utility.h"
#include "charDev.h"
#include "kernelObjects.h"
#include "mm.h"
#include "printf.h"
#include "syscall.h"
#include "../../chrisOS/include/strings.h"
#include "../../chrisOS/include/i386/gdt.h"
#include "process.h"
#include "../../chrisOS/src/fat/fat_access.h"
#include "../include/task.h"
#include "io.h"
#include "../../chrisOS/src/fat/fat_filelib.h"
#include "fs.h"
#include "filesystem/pipe.h"
#include "drivers/termdrv.h"
#include "drivers/tty_driver.h"
#include "thesignals.h"
#include "chrisos.h"
#include "io.h"
#include "utility.h"
#include "filesystem/procfs.h"

extern char* kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
extern bool schedulerEnabled;
extern bool signalCheckEnabled;
bool schedulerTaskSwitched=0;
extern uint32_t* isrSavedStack; 
extern uint32_t kNextSignalCheckTicks;
extern pipe_t *activeSTDOUT;
extern pipe_t *activeSTDIN;

extern void keyboardInit();
extern void initTerm();
extern int initTTY();
extern void globalMMapInit();

filesystem_t *rootFs, *pipeFs, *procFs;
terminfo_t *sysConsole1, *sysConsole2, *sysConsole3, *sysConsole4, *sysConsole5, *sysConsole6, *sysConsole7, *sysConsole8;
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
    fops.tell = &fl_ftell;
    dops.open = &fl_opendir;
    dops.close = &fl_closedir;
    dops.read = &fl_readdir;
    
    rootFs=kRegisterFileSystem("/", &fops, &dops);
    pipeFs=initpipefs();
    procFs=initprocfs();
    
    globalMMapInit();
    initTerm();
    initTTY();
    sysConsole1 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 0, 80, 50, "Main system console 0");
    sysConsole2 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 1, 80, 50, "Main system console 0");
    sysConsole3 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 2, 80, 50, "Main system console 0");
    sysConsole4 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 3, 80, 50, "Main system console 0");
    sysConsole5 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 4, 80, 50, "Main system console 0");
    sysConsole6 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 5, 80, 50, "Main system console 0");
    sysConsole7 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 6, 80, 50, "Main system console 0");
    sysConsole8 = registerTerminal(TERMINAL_CONSOLE_MAJOR_NUMBER, 7, 80, 50, "Main system console 0");
    tty1 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 1);
    tty2 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 2);
    tty3 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 3);
    tty4 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 4);
    tty5 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 5);
    tty6 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 6);
    tty7 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 7);
    tty8 = registerTTY(TERMINAL_CONSOLE_MAJOR_NUMBER, 8);
    kKernelProcess->stdout = tty1->stdOutWritePipe;
    kKernelProcess->stdin = tty1->stdInReadPipe;
    kKernelProcess->stderr = tty1->stdErrWritePipe;
    activeSTDOUT = tty1->stdOutWritePipe;
    activeSTDIN=tty1->stdInReadPipe;
    activeTTY=tty1;
    
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
    char program[40]="/bin/kshell";
    printk("Loading and executing %s\n",program);
    /*NOTE: This is how to create argv!!!*/
    char params[2][50];
    strcpy(params[0],"1");
    strcpy(params[1],"1");
    char* args[2];
    args[0]=params[0];
    args[1]=params[1];

    kKernelProcess->cwd=kMalloc(1024);
    strcpy(kKernelProcess->cwd,"/");
    
    process_t* initialShellProcess = createProcess(program, 0, args, kKernelProcess, false, false);
    schedulerEnabled=true;
    signalCheckEnabled=true;
    sys_sigaction(SIGSLEEP,0,*kTicksSinceStart+50, kKernelProcess);
    process_t* tty2ShellProcess = createProcess(program,0, args, kKernelProcess, false, false);
    tty2ShellProcess->stdout=tty2->stdOutWritePipe;
    tty2ShellProcess->stdin=tty2->stdInReadPipe;
    tty2ShellProcess->stderr=tty2->stdErrWritePipe;
    tty2ShellProcess->childNumber=1;
    sys_sigaction(SIGSLEEP,0,*kTicksSinceStart+50, kKernelProcess);
    process_t* tty3ShellProcess = createProcess(program,0, args, kKernelProcess, false, false);
    tty3ShellProcess->stdout=tty3->stdOutWritePipe;
    tty3ShellProcess->stdin=tty3->stdInReadPipe;
    tty3ShellProcess->stderr=tty3->stdErrWritePipe;
    tty3ShellProcess->childNumber=2;
    sys_sigaction(SIGSLEEP,0,*kTicksSinceStart+50, kKernelProcess);
    process_t* tty4ShellProcess = createProcess(program,0, args, kKernelProcess, false, false);
    tty4ShellProcess->stdout=tty4->stdOutWritePipe;
    tty4ShellProcess->stdin=tty4->stdInReadPipe;
    tty4ShellProcess->stderr=tty4->stdErrWritePipe;
    tty4ShellProcess->childNumber=3;
    sys_sigaction(SIGSLEEP,0,*kTicksSinceStart+50, kKernelProcess);
    process_t* tty5ShellProcess = createProcess(program,0, args, kKernelProcess, false, false);
    tty5ShellProcess->stdout=tty5->stdOutWritePipe;
    tty5ShellProcess->stdin=tty5->stdInReadPipe;
    tty5ShellProcess->stderr=tty5->stdErrWritePipe;
    tty5ShellProcess->childNumber=4;
    sys_sigaction(SIGSLEEP,0,*kTicksSinceStart+50, kKernelProcess);
    process_t* tty6ShellProcess = createProcess(program,0, args, kKernelProcess, false, false);
    tty6ShellProcess->stdout=tty6->stdOutWritePipe;
    tty6ShellProcess->stdin=tty6->stdInReadPipe;
    tty6ShellProcess->stderr=tty6->stdErrWritePipe;
    tty6ShellProcess->childNumber=5;
    printk("All terminals started.");
    sys_sigaction(SIGUSLEEP,0,initialShellProcess->task->taskNum, kKernelProcess);
    printk("\n\nLast task was killed, shutting down the kernel ...\n");
    schedulerEnabled=false;
    printk("Disabled scheduler ...\n");
    waitTicks(3);
    printk("All shut down, exiting kernel!\n");
    return (0xbad);
}

