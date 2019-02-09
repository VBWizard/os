/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   ls.c
 * Author: yogi
 *
 * Created on January 30, 2019, 7:12 PM
 */

#include "libChrisOS.h"

int main(int argc, char** argv) 
{

    //char *garbage = malloc(1000*1024*1024);
    char *currPath;
    char cwd[512];
    direntry_t *buffer = malloc(16384);
    int retVal=-1;
    
    currPath=malloc(1024);

    if (argc==1)
        getcwd(currPath,512);
    else if (*argv[1]!='/')
    {
        getcwd((char*)cwd,512);
        strcpy(currPath,(char*)cwd);
        if (strncmp(currPath,"/",100)!=0)
            strcat(currPath,"/");
        strcat(currPath,argv[1]);
    }
    else
        strcpy(currPath,argv[1]);
    
    int entryCount = getdir(currPath, (direntry_t*)buffer, 16384);
        for (int cnt=0;cnt<entryCount;cnt++)
        {
            //printf("%s\t\t\t\t%u\t%s\n",buffer[cnt].filename, buffer[cnt].size, buffer[cnt].is_dir?"drw":"rwx");
            printf("%s\t\t%uK\t%s\n", buffer[cnt].is_dir?"drw":"rwx", buffer[cnt].size/1024, buffer[cnt].filename);
            retVal=0;
        }
    
    if (retVal==-1)
        printf("Invalid file or directory name '%s'\n",currPath);
    free(currPath);
    return retVal;
}

