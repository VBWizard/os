/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include "../chrisOS/include/kernelObjects.h"
#include "../chrisOS/include/chrisos.h"
#include "../libChrisOS/include/libChrisOS.h"
#include "../chrisOSKernel/include/signals.h"

extern uint32_t* sysEnter_Vector;
/*
 * testMainProgramEntry
 */

void HandleSEGV();

int main(int argc, char** argv) {
    uint64_t temp;
    int a=argc;
    uint32_t cr3;
    
    libc_init();
    //modifySignal(SIG_SEGV,HandleSEGV,0);
    print("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
    {
        print("Param %u=%s\n",cnt,argv[cnt]);
    }
    jumpHere:
    sleep(1);
    temp++;
//    if (temp%1000000==0)
        print("\t%s: Still in the loop, %u iterations\n",argv[1],temp);
    //__asm__("mov eax,0\ncld\nint 0x80\n");  //Shouldn't do this from a program
//    __asm__("mov eax,0\ncld\ncall sysEnter_Vector\n");
    if (temp==5)
    {
        print("Triggering SEGV\n");
        __asm__("mov eax,[0x50000000]\n");
    }
    goto jumpHere;
    return 0x1234;
}

void HandleSEGV()
{
    print("exiting program gracefully");
    return;
}