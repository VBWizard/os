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
    uint64_t temp;
    //printk("Hello from testmainprogramentry!!!");
    jumpHere:
    temp++;
//    printd(DEBUG_PROCESS,"JumpHere iteration %u\n",temp);
    goto jumpHere;
    STOPHERE2
    __asm__("mov eax,0\ncld\nint 0x80\n");
    int a=argc;
    printk("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
    }
    return 0x1234;
}
