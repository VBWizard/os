/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


#include "kshell.h"

int execPipes[2];

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

int kexec(char* cmdline, int stdinpipe, int stdoutpipe, int stderrpipe)
{
    bool background=false;
    int forkPid=0;
    char* tok;
    char* pgm=NULL;
    char fileToExec[256] = "/\0";

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];  //strangely, if I remove this variable I get a SEGV at 0x009B:0x7000e0bf for 0x00000023
    char *stdinRedir, *stdoutRedir;
    char *stdinfile=NULL, *stdoutfile=NULL, *stderrfile=NULL;
    int argc = 0;
    char **argv;
    
    //look for < and > redirects so that we can strip them from the command line and use them to redirect stdin/stdout
    stdinRedir = strstr(cmdline,"<");
    if (stdinRedir)
    {
        stdinfile = malloc(256);
        char *start = strstr(stdinRedir," ")+1;
        if (!start)
            start=stdinRedir;
        char *end = strstr(start," ");
        if (!end)
            end = strstr(start,"\n");
        if (end)
            strncpy(stdinfile,start,end-start);
        else
            strcpy(stdinfile, start);
        stdinRedir='\0';
    }
    
    argv = cmdlineToArgv(cmdline, &argc);

    if (argc==0)
        return -3;

    if (argc<1)
    {
        printf("kexec: Invalid command\n");
        return -5;
    }


    if (argv[0][0]=='/')
        strcpy(fileToExec,argv[0]);
    else
        strcat(fileToExec,argv[0]);

    fstat_t fstat;
    if (stat(argv[0],&fstat)) //stat returns 0 if successful
    {
        printf("invalid path or filename%s\n",argv[0]);
        return -4;
    }
    
    if (*argv[argc-1]=='&')
        background=true;
    
    forkPid = fork();
    
    if (forkPid == 0)
    {
        int retVal;
        
        //CLR 02/05/2019: Redirect standard input/output/err from/to a file (i.e. < and >)
        if (stdinfile!=NULL)
            if (freopen(stdinfile, "r",(void*)STDIN_FILE)==(void*)-1)
            {
                printf("Redirect of input failed, cannot continue\n");
                return -3;
            }
        if (stdoutfile!=NULL)
            freopen(stdoutfile,"w",(void*)STDOUT_FILE);
        if (stderrfile!=NULL)
            freopen(stderrfile,"w",(void*)STDERR_FILE);
        int childPid = exec(fileToExec, argc, argv);
        
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
                print("exec: Cannot execute %s\n",argv[0]);
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
        setenv("LASTEXIT",ret);    
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
    free(pgm);
    if (stdinfile)
        free(stdinfile);
    if (stdoutfile)
        free(stdoutfile);
    if (stderrfile)
        free(stderrfile);
    
}

void cmdTime(char* cmdline)
{
    uint32_t startTicks, endTicks;
    
    startTicks=getticks();
    execInternalCommand(cmdline);
    endTicks=getticks();
    print("\n%u ticks\n",endTicks-startTicks);
    
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
        execInternalCommand(newCmdLine);
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
    kexec(cmdline, STDIN_FILE, STDOUT_FILE, STDERR_FILE);
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

