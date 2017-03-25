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

void helpMe();
void kShell();
char sExecutingProgram[512];
char* sbootShellProgramName;
command_table_t cmds[] = { 
        {"help","Get help (this information)",helpMe,0},
    };
void (*command_function)(void);
void (*command_function_p)(char*);

#endif	/* BISHELL_H */
