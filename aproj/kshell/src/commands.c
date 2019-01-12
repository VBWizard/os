/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


#include "kshell.h"

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

int kexec(char* path, int argc, char** argv, bool background)
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

void execTime(char* cmdline, bool timeIt)
{
    bool background=false;
    uint32_t pid=0;
    char* tok;
    char* pgm=NULL;

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    struct tm *startTime, *endTime;
    uint32_t startTicks, endTicks;
    
    if (paramCount==0)
        return;

    tok=strtok(cmdline,delim);
    while (tok!=NULL)
    {
        if (strncmp(tok,"b",2)==0)
        {
            background=true;
            execParamCount++;
        }
        else if (pgm==NULL)
        {
            char path[50];
            bool retVal = getenv("CWD",path);
            pgm=malloc(strlen(tok)+1+(retVal?strlen(path):0));  //NOTE: +1 is for the terminating \0
            
            if (retVal)
                strcpy(pgm,path);
            strcat(pgm,tok);
        }
        pcount++;
        tok=strtok(0,delim);
    }
    
    char** prms=malloc(sizeof(char*)*pcount);
    paramsToArgv(paramCount-execParamCount,&params[execParamCount][0], prms);

//    print ("Executing %s\n",pgm);
    if (timeIt)
        startTicks=getticks();

    pid=kexec(pgm,paramCount-execParamCount,prms,background);
    if (timeIt)
    {
        endTicks=getticks();
        print("%u ticks\n",endTicks-startTicks);
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
    free(pgm);
    
}

void cmdTime(char* cmdline)
{
    execTime(cmdline,true);
}

void cmdExecp(char* cmdline)
{
    execTime(cmdline,false);
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
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        
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

    if (params[0][0]==0)
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
}

