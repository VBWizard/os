/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 16, 2016, 11:49 AM
 */


#include "../libChrisOS/include/libChrisOS.h"
#include "../../kproj/chrisOSKernel/include/thesignals.h"

/*
 * testMainProgramEntry
 */

void HandleSEGV();

void crashFail(char** argv, int count)
{

    jumpHere:
    print("\t%s: Counting down ... %u\n",argv[0],count);
    sleep(1);
    count--;
    if (count==0)
    {
        print("Triggering SEGV\n");
        __asm__("mov eax,[0x50000000]\n");
    }
    goto jumpHere;

}

int main(int argc, char** argv, char** envp) {
    int num=0;
    int loopCount=0;
    
    int largc=argc;
    char** largv=argv;
    char** lenvp=envp;
    
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
    
    print ("Environment @ 0x%08X:\n",&envp);
    for (int cnt=0;cnt<100;cnt++)
    {
        if (lenvp[cnt]!=0)
        {
            print("\t0x%08X: ",&lenvp[cnt]);
            print("\t%u: %s\n",cnt,lenvp[cnt]);
        }
    }
    print("end of environment ...\n\n");
    
    if (argc>1)
        loopCount = atoi(argv[1]);
    else
        loopCount = 1;
    
    print ("Looping %u times\n",loopCount-1);
    
    crashFail(argv,loopCount);
    print ("Bye bye now!!!\n");
    return 0x1234;
}

void HandleSEGV()
{
    print("exiting program gracefully");
    return;
}