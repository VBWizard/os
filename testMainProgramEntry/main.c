/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include "../chrisOS/include/kernelObjects.h"
#include "../chrisOS/include/chrisos.h"
extern uint32_t* sysEnter_Vector;
/*
 * testMainProgramEntry
 */

int main(int argc, char** argv) {
    uint64_t temp;
    int a=argc;

    libc_init();
    printk("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
    }
    jumpHere:
/*    if (temp%1000000==0)
        printd(DEBUG_PROCESS,"\tStill in the loop, %u iterations\n",temp);
    temp++;
    goto jumpHere;
    __asm__("mov eax,0\ncld\nint 0x80\n");
*/
//    __asm__("mov eax,0\ncld\ncall sysEnter_Vector\n");
//    goto jumpHere;
    return 0x1234;
}
