/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */

#include <signal.h>

#include "../libChrisOS/include/libChrisOS.h"
#include "../../kproj/chrisOSKernel/include/thesignals.h"

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
    int num=0;
    int loopCount=0;
    
    
    //modifySignal(SIG_SEGV, &HandleSEGV, 0);

    
/*
    char input[100];
      print("Sleeping for 3 seconds");
    
    sleep(3);
    print("\n");
    
    print("Enter something: ");
    gets((char*)&input,100,1);
    print("\n");
    puts("This is what you entered: ");
    puts((char*)&input);
    
    char t;
    print("Getting one character: ");
    gets((char*)&t,1,1);
    print("\nGot character %c\n",t);
*/
    print("\nWelcome to tmpe!\n");
    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        print("Param %u=%s\n",cnt,argv[cnt]);
    }
    print("\n");
    
    if (argc>1)
        loopCount = atoi(argv[1]);
    else
        loopCount = 1;
    
    print ("Looping %u times\n",loopCount);
    
    while (num < loopCount)
    {
        sleep(1);
        num++;
        print("Still here!!! (%u)\n",num);
    }
    crashFail(argv);
    print ("Bye bye now!!!\n");
    return 0x1234;
}

void HandleSEGV()
{
    print("exiting program gracefully");
    return;
}