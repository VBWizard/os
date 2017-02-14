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
    
    printk("kernelDataLoadAddress = 0x%08X \n\n",&kernelDataLoadAddress);
    mmInit();
    taskInit();
    
    task_t* task=createTask(true);
    
    printk("kernelGDT=0x%08X, base=0x%08X, limit=%u\n",&kernelGDT, kernelGDT.base,kernelGDT.limit);
    return (0xbad);
}

