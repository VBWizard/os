/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on February 16, 2019, 10:03 AM
 */

/*
 * 
 */
#include "free.h"

int main(int argc, char** argv) 
{
    bool humanReadable=false;
    char temp[20]={0};
    char *freeMem=malloc(1024);
    
    
    if (argc>1)
    {
        strcpy(temp,argv[1]);
        if (strcmp(argv[1],"-h")==0)
            humanReadable=true;
    }
    
    freeMem=getFree(humanReadable,freeMem,1024);
    
    printf("%s",freeMem);
    free(freeMem);
    return 0;
}

