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

void cmdExecp(char* cmdline)
{
    bool background=false;
    uint32_t pid=0;
    char* tok;
    char* pgm=NULL;

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    
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
            bool retVal = getEnvVariableValue("PATH",path);
            int a = strlen(tok);
            pgm=malloc(strlen(tok)+1+strlen(path));  //NOTE: +1 is for the terminating \0
            
            strcpy(pgm,path);
            strcat(pgm,tok);
        }
        pcount++;
        tok=strtok(0,delim);
    }
    
    char** prms=paramsToArgv(paramCount-execParamCount,&params[execParamCount][0]);

    print ("Executing %s\n",pgm);
    pid=exec(pgm,paramCount-execParamCount,prms);
    if (pid>0)
    {
        if (!background)
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            waitpid(pid);
        }
    }
    else
        print("Error executing %s\n",pgm);
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
    free(pgm);
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

