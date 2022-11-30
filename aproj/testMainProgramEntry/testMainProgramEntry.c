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

char programName[255];

void HandleSEGV();

void crashFail(char** argv, int count)
{
    struct tm* time=malloc(sizeof(struct tm));
    jumpHere:
    gettime(time,true);
    print("\t%s: Counting down ... %u (%02u:%02u:%02u)\n",argv[0],count, time->tm_hour, time->tm_min, time->tm_sec);
    sleep(1);
    count--;
    if (count==0)
    {
        print("\tTriggering SEGV by attempting to move a value to the address 0x50000000 which we don't have access to\n");
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
    
    modifySignal(SIGSEGV, &HandleSEGV, 0);

    strcpy(programName,argv[0]);
    strreplace(programName,"/bin/","",programName);

    print("\n\tWelcome to tmpe!\n");
    print("\tParam count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        print("\t\tParam %u=%s\n",cnt,argv[cnt]);
    }
    print("\n");
    
    print ("\tEnvironment @ 0x%08X:\n",&envp);
    for (int cnt=0;cnt<100;cnt++)
    {
        if (lenvp[cnt]!=0)
        {
            print("\t\t0x%08X: ",&lenvp[cnt]);
            print("\t\t%u: %s\n",cnt,lenvp[cnt]);
        }
    }
    print("\tend of environment ...\n\n");
    
    if (argc>1)
        loopCount = atoi(argv[1]);
    else
        loopCount = 1;
    
    print ("\tSet loopCount = %u\n",loopCount);
    print ("\tLooping %u times\n",loopCount-1);
    
    crashFail(argv,loopCount);
    print ("\tBye bye now!!!\n");
    return 0x1234;
}

void HandleSEGV()
{
    print("\tHandleSEGV: %s caught the SEGV and is exiting gracefully with the exit code -12\n",programName);
    exit(-12);
}