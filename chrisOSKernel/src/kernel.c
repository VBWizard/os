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
#include "../include/sysloader.h"
#include "../../chrisOS/src/fat/fat_access.h"
#include "../include/task.h"

extern char* kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
extern bool schedulerEnabled;

task_t* kKernelTask;
uint32_t saveESP;

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
    schedulerEnabled=false;
    printk("Initializing memory management ...\n");
    mmInit();
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
    initMalloc();
    printk("Done initializing malloc\n\nInitializing task management ...\n");
    taskInit();
    printk("Done initializing task management\nInitializing kernel...\n");
    initKernelInternals();
    printk("Done initializing kernel\nInitializing scheduler...\n");
    initSched();
    printk("Done initializing scheduler\n");
    int lRetVal=fl_attach_media((fn_diskio_read)ahciBlockingRead28, (fn_diskio_write)ahciBlockingWrite28);
    char program[40]="/testmainprogramentry";
    printk("Loading and executing %s\n",program);
    process_t* process = createProcess(program,false);
    //sysExec(process,1,"");
    schedulerEnabled=true;
    return (0xbad);
}

