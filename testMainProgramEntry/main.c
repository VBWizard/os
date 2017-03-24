/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include "../libChrisOS/include/libChrisOS.h"
extern uint32_t* sysEnter_Vector;
/*
 * testMainProgramEntry
 */

void HandleSEGV();

void crashFail(char** argv)
{
    uint64_t temp=0;

    jumpHere:
    sleep(1);
    temp++;
    print("\t%s: Still in the loop, %u iterations\n",argv[1],temp);
    if (temp==5)
    {
        print("Triggering SEGV\n");
        __asm__("mov eax,[0x50000000]\n");
    }
    goto jumpHere;

}

int main(int argc, char** argv) {
    
    libc_init();
    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        print("Param %u=%s\n",cnt,argv[cnt]);
    }
    print("\n");
    for (int cnt=0;cnt<0x100;cnt++)
    {
        char* test=malloc(25);
        print("Malloc%x returned 0x%08X\n",cnt,test);
    }
    
    //crashFail(argv);
    return 0x1234;
}

void HandleSEGV()
{
    print("exiting program gracefully");
    return;
}