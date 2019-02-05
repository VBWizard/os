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
#include "../../../kproj/chrisOSKernel/include/signals.h"
#include "../../../kproj/chrisOSKernel/include/thesignals.h"

#define INITIAL_MAXARGC 20
#define EOS '\0'
#define NUMBER_OF_COMMANDS sizeof(cmds)/sizeof(command_table_t)
#define KEY_BACKSPACE "\033[1D \033[1D"
//Max cmds that can be parsed at once
#define PARSE_CMD_COUNT 100
#define CMDLINE_MAX_SIZE 512
#define CMDLINE_BUFFER_SIZE CMDLINE_MAX_SIZE*PARSE_CMD_COUNT


typedef struct
{
    char *name;
    char *description;
    void *function;
    int paramCount;
} command_table_t;

    void cmdHelp(char *cmdline);
    void cmdClearScreen();
    void cmdExit(char *cmdline);
    void cmdExecp(char* cmdline);
    void cmdSleep(char *cmdline);
    void cmdTime(char *cmdline);
    void cmdPrintEnv();
    void cmdPwd();
    void cmdSetEnv(char *cmdline);
    void cmdRepeat(char *cmdline);
    void (*command_function)(void);
    void (*command_function_p)(char*);
    bool getEnvVariableValue(char* evName, char* value);
    char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr);
    void freeArgV(int pcount, char **params);
    int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size);
    int processSignal(int signal);
    void execInternalCommand(char lCommand[256]);

    char sExecutingProgram[512];
    char* sKShellProgramName;
    char** environmentLoc;
    char delim[6];
    uint32_t exitCode, lastExecExitCode;
    bool timeToExit;
    char cwd[256];
    bool bSigIntReceived;

static command_table_t cmds[] = { 
        {"clear","Clear the screen",cmdClearScreen,0},
        {"env","Print environment",cmdPrintEnv,0},
        {"exec","Execute a program",cmdExecp,1},
        {"exit","Exit kshell",cmdExit,1},
        {"help","Get help (this information)",cmdHelp,1},
        {"pwd","Print working directory",cmdPwd,0},
        {"repeat","Repeat a command x times",cmdRepeat,1},
        {"set","Set an environment variable",cmdSetEnv,1},
        {"sleep","Sleep for x seconds",cmdSleep,1},
        {"time","Time a program while it runs.\n\t\tUsage: time program [parameters]",cmdTime,1}
    };

#endif	/* BISHELL_H */

