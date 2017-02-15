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
    kDebugLevel |= DEBUG_PAGING;
    kDebugLevel |= DEBUG_MALLOC;
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
    initMalloc();
    printk("Done initializing malloc\n\nInitializing task management ...\n");
    taskInit();
    printk("Done initializing task management\n\n");
    
    //process_t* process = createProcess(false,'/myhelloworld');

    printk("\n\n***************************MALLOC TEST 1***********************************\n");
    int* a = malloc(5000);
    a[0]=0xDEADBEEF;
    uint32_t* v=(uint32_t*)0x4c39ec;
    a[1]=0xBEADFEED;
    printk("\n\n***************************MALLOC TEST 2***********************************\n");
    char* b = malloc(512);
    strcpy(b,"Hello world!!!\n");
    printk("a[0](0x%08X)=0x%08X\n\n\n",&a[0],a[0]);
    printk("b[0](0x%08X)=0x%08X=%s\n",&b[0],b[0],b);

    terminal_clear();
    printk("\n\n*************************** MALLOC TEST 3 ***********************************\n");
    uint32_t* ca[10];
    goto MALLOCTESTS;   
    MALLOCTESTS:
    ca[0]=malloc(10);
    uint32_t* c = 0x4c3a00;
    printk ("ca[0] mapping = 0x%08X\n",(uint32_t*)*c);
    printk("\n\n***NEXT***\n");
    ca[1]=malloc(10);
    c = 0x4c3a04;
    printk ("ca[1] mapping = 0x%08X\n",(uint32_t*)*c);
    *ca[0]=1;
    *ca[1]=2;
    c = 0x4c3a00;
    printk ("ca[0] mapping = 0x%08X\n",(uint32_t*)*c);
    c = 0x4c3a04;
    printk ("ca[1] mapping = 0x%08X\n",(uint32_t*)*c);

    printk("ca[0]=0x%08X, *ca[0]=%u\n",ca[0],*ca[0]);
    printk("ca[1]=0x%08X, *ca[1]=%u\n",ca[1],*ca[1]);
    printk("\n");
    
    return (0xbad);
}

