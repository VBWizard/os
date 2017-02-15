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

extern char kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
/*
 * 
 */
int main(int argc, char** argv) {
    //terminal_clear();
    printk("\nkernel loaded ... \n");
/*    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    printk("Initializing memory management ...\n");
    kDebugLevel |= DEBUG_KERNEL_PAGING;
    mmInit();
//    kDebugLevel |= DEBUG_MEMORY_MANAGEMENT;
//    kDebugLevel |= DEBUG_PAGING;
    kDebugLevel |= DEBUG_MALLOC;
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
    initMalloc();
    printk("Done initializing malloc\n\nInitializing task management ...\n");
    taskInit();
    printk("Done initializing task management\n\n");
    
    //process_t* process = createProcess(false,'/myhelloworld');

    int* a = malloc(50);
    a[0]=0xDEADBEEF;
    printk("a[0](0x%08X)=0x%08X\n",&a[0],a[0]);
    a[1]=0xBEADFEED;
    return 0;
    char* b = malloc(512);
    
    return (0xbad);
}

