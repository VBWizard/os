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

void helpMe(char *cmdline);
void kExit(char *cmdline);
void execp(char* cmdline);
void kSleep(char *cmdline);
void pwd();

char sExecutingProgram[512];
char* sKShellProgramName;
command_table_t cmds[] = { 
        {"help","Get help (this information)",helpMe,1},
        {"exec","Execute a program",execp,1},
        {"exit","Exit kshell",kExit,1},
        {"pwd","Print working directory",pwd,0},
        {"sleep","Sleep for x seconds",kSleep,1}
    };
void (*command_function)(void);
void (*command_function_p)(char*);

#endif	/* BISHELL_H */

