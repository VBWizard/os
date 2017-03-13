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

extern char* kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
extern bool schedulerEnabled;
bool schedulerTaskSwitched=0;

task_t* kKernelTask;
uint32_t saveESP;
uint32_t kKernelCR3=KERNEL_CR3;


int main(int argc, char** argv) {
    init_serial();
    printk("\nkernel loaded ... \n");
/*    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    printp("Hello kernel world!!!\n");
    schedulerEnabled=false;
    schedulerTaskSwitched=false;
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
//    char program[40]="/testmainprogramentry";
//    printk("Loading and executing %s\n",program);
    /*NOTE: This is how to create argv!!!*/
//    char test[2][50];
//    strcpy(test[0],"hello");
//    strcpy(test[1],"there");
//    char* testp[2];
//    testp[0]=test[0];
//    testp[1]=test[1];
    /*************************************/
//    process_t* process = createProcess(program,2,&testp,false);
//    printk("Loading and executing %s again\n",program);
//    strcpy(test[0],"hello2");
//    strcpy(test[1],"there2");
//    printk("Loading and executing %s again\n",program);
//    process_t* process2 = createProcess(program,2,&testp,false);
    char path[40]="/libc.so";
    sysLoadElf(path,NULL,KERNEL_CR3,false);
    schedulerEnabled=true;
    return (0xbad);
}

