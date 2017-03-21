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
    
    __asm__("mov eax,[0xF000F004]\n":"=a" (cr3));

    
    libc_init();
    //modifySignal(SIG_SEGV,HandleSEGV,0);
    print("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
    {
        print("Param %u=%s\n",cnt,argv[cnt]);
    }
    jumpHere:
    sleep(10);
    //print("Calling stop\n");
    //stop();
//    if (temp%1000000==0)
        print("\t%s: Still in the loop, %u iterations (cr3=0x%08X)\n",argv[1],temp++,cr3);
  //  goto jumpHere;
    //__asm__("mov eax,0\ncld\nint 0x80\n");  //Shouldn't do this from a program

//    __asm__("mov eax,0\ncld\ncall sysEnter_Vector\n");
    goto jumpHere;
    return 0x1234;
}

void HandleSEGV()
{
    print("exiting program gracefully");
    return;
}