/* 
 * File:   bishell.h
 * Author: yogi
 *
 * Created on May 19, 2016, 12:15 PM
 */

#ifndef BISHELL_H
#define	BISHELL_H
/*Parts from: http://wiki.osdev.org/Creating_A_Shell*/
#include "libChrisOS.h"

#define INITIAL_MAXARGC 20
#define EOS '\0'
#define NUMBER_OF_COMMANDS sizeof(cmds)/sizeof(command_table_t)


typedef struct
{
    char *name;
    char *description;
    void *function;
    int paramCount;
} command_table_t;

    void cmdHelp(char *cmdline);
    void cmdExit(char *cmdline);
    void cmdExecp(char* cmdline);
    void cmdSleep(char *cmdline);
    void cmdPrintEnv();
    void cmdPwd();

    void (*command_function)(void);
    void (*command_function_p)(char*);
    bool getEnvVariableValue(char* evName, char* value);
    char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr);
    void freeArgV(int pcount, char **params);
    int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size);
    
    char sExecutingProgram[512];
    char* sKShellProgramName;
    char** environmentLoc;
    char delim[6];
    uint32_t exitCode, lastExecExitCode;
    bool timeToExit;
    char cwd[256];
    
static command_table_t cmds[] = { 
        {"env","Print environment",cmdPrintEnv,0},
        {"exec","Execute a program",cmdExecp,1},
        {"exit","Exit kshell",cmdExit,1},
        {"help","Get help (this information)",cmdHelp,1},
        {"pwd","Print working directory",cmdPwd,0},
        {"sleep","Sleep for x seconds",cmdSleep,1}
    };

#endif	/* BISHELL_H */

