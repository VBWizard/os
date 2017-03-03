/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include "../chrisOS/include/kernelObjects.h"

/*
 * testMainProgramEntry
 */
int main(int argc, char** argv) {
    register int *esp __asm__("esp");
    //printk("Hello from testmainprogramentry!!!");
    //__asm__("cld\nint 0x80\n");
    int a=argc;
    printk("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
    }
jumpPoint:
    __asm__("int 0x80\n");
    goto jumpPoint;
    return 0x1234;
}
