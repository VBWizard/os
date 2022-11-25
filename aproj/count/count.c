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
    int iReturnValue = 0;
    unsigned int uCountedValue = 0;

    if (argc<2)
    {
        printf("Two arguments must be supplied, the signal to send and the PID of the process, in that order\n");
        iReturnValue = -1;
    }
    else
    {
        unsigned int uCountTo = atoi(argv[1]);
        
        printf("Counting to %i\n",uCountTo);
        for (int cnt=0;cnt<uCountTo;cnt++)
            uCountedValue++;
    }
    printf("Counted to %i\n ",uCountedValue);
    return iReturnValue;
}

