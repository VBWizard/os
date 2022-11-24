/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   ps_main.c
 * Author: yogi
 *
 * Created on February 21, 2019, 11:36 AM
 */

#include <signal.h>

#include "libChrisOS.h"

int main(int argc, char** argv) 
{
    bool showAll=false;
    int iReturnValue = 0;
    
    if (argc<3)
    {
        printf("Two arguments must be supplied, the signal to send and the PID of the process, in that order\n");
        iReturnValue = -1;
    }
    else
    {
        int iPid = 0;
        
        int iSigNum = atoi(argv[1]);
        if (strstr(argv[2],"x") || strstr(argv[2],"X"))
            iPid = strtol(argv[2], NULL, 16);
        else
            iPid = atoi(argv[2]);
        printf("Killing pid %i (0x%04x)\n",iPid, iPid);
        signalTask(iSigNum, iPid);
    }
    
    

    return iReturnValue;
}

