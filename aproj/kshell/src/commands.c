/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


#include "kshell.h"

void cmdClearScreen()
{
    printf("\033[2J");
}

void cmdPrintEnv()
{
    for (int cnt=0;cnt<100;cnt++)
    {
        if (environmentLoc[cnt]!=0)
        {
            print("%s\n",environmentLoc[cnt]);
        }
    }
   
}

void cmdSetEnv(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    char *varName, *varValue;
    
    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
    {
        int nameLen=0, valueLen=0;
        int found=(uintptr_t)strstr(params[0],"=");
        if (found==0)
        {
            print("Usage: set variable=value\n");
            return;
        }
        nameLen=found-(uintptr_t)params[0];
        valueLen=strlen(params[0])-nameLen-1;
        varName = malloc(nameLen+1);
        varValue = malloc(valueLen);
        strncpy(varName,params[0],nameLen);
        varName[nameLen]=0;
        strncpy(varValue,params[0]+nameLen+1,valueLen);
        strtrim(varName);
        strtrim(varValue);
        setenv(varName, varValue);
        free(varName);
        free(varValue);
    }
    else
        cmdPrintEnv();
}

int kexec2(char* path, int argc, char** argv, bool background)
{
    int pid=execa(path,argc,argv);

    if (pid>0)
    {
        if (!background)
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
            char ret[10];
            itoa(lastExecExitCode,ret);
            setenv("LASTEXIT",ret);
        }
    }
    else
        print("Error executing %s\n",path);

}

int kexec(char* cmdline, bool timeIt)
{
    bool background=false;
    int forkPid=0;
    char* tok;
    char* pgm=NULL;

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    struct tm *startTime, *endTime;
    uint32_t startTicks, endTicks;
    
    if (paramCount==0)
        return -3;

    int argc = 0;
    char **argv;
    
    argv = cmdlineToArgv(cmdline, &argc);

    if (argc<1)
    {
        printf("kexec: Invalid command\n");
        return -5;
    }
    
    if (*argv[argc-1]=='&')
        background=true;

    
    startTicks=getticks();
    
    forkPid = fork();
    
    if (forkPid == 0)
    {
        int retVal;
        int childPid = exec(argv[0], argc, argv);
        
        if (childPid > 0)
        {
            retVal = waitpid(childPid);
        }
        else
            retVal = 0xBADBADBA;
        exit(retVal);
    }
    else if (forkPid < 0)
        print("Fork error %u", forkPid);
    else
    {
        if (!background)
        {
            lastExecExitCode = waitpid(forkPid);
            if (lastExecExitCode == 0xBADBADBA)
                print("execTime: Cannot execute %s\n",argv[0]);
        }
        if (timeIt)
        {
            endTicks=getticks();
            print("\n%u ticks\n",endTicks-startTicks);
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
        setenv("LASTEXIT",ret);    
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
    free(pgm);
    
}

void cmdTime(char* cmdline)
{
    kexec(cmdline,true);
}

void cmdRepeat(char * cmdline)
{
    int argc = 0;
    char **argv;
    int count = 0;
    char *newCmdLine=cmdline;
    argv = cmdlineToArgv(cmdline, &argc);
    
    count = atoi(argv[0]);

    if (count >= 100)
        newCmdLine+=3;
    else if (count >= 10)
        newCmdLine+=2;
    else 
        newCmdLine+=1;
    
    for (int cnt=0;cnt<count;cnt++)
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
        kexec(newCmdLine,false);
        if (bSigIntReceived)
        {
            if (processSignal(SIGINT)==SIGINT)
                cnt=count;
            break;
        }
    }
    
}

void cmdExecp(char* cmdline)
{
    kexec(cmdline,false);
}

void cmdExit(char *cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
    {
        exitCode = strtoul(params[0],0,10);
    }
    else
        exitCode = 0;
    timeToExit=true;
}

void cmdHelp(char *cmdline)
{
    char* tok;
    
    tok=strtok(cmdline,delim);
/*    while (tok!=NULL)
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
        if (tok!=NULL)
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}

void cmdPwd()
{
    char* buf=malloc(512);
    print("%s\n",getcwd(buf,512));
    free(buf);
}

void cmdSleep(char *cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
}

