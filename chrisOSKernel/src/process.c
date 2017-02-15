/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "../../chrisOS/include/chrisos.h"
#include <stdbool.h>
#include "task.h"
#include "process.h"
#include "alloc.h"
#include "printf.h"

void destroyProcess(process_t* process)
{
    freePage(process);
}

process_t* createProcess(bool kernelTSS, char* path)
{

    process_t* process;
    
    process=(process_t*)allocPages(sizeof(process_t));
    printd(DEBUG_PROCESS,"Created Process @ 0x%08X\n",process);
    process->task=createTask(true);
    
    
}