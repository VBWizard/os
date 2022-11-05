/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on January 1, 2019, 2:15 PM
 */

/*
 * 
 */
#include "libChrisOS.h"
#include "types.h"

int main(int argc, char** argv) {

    void* file;
    char* buffer;
    
    int readSize;
    
    if (argc<2)
        return -1;

/*    printf("Stack CoW test commencing ...\n");
    //Exercise the stack so that stack exceptions don't get in the way of testing mmap
    int size = 10000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
        if (test[cnt]!=cnt)
            printf("uh oh!");

   printf("Anonymous mmap test commencing ...\n"); 
    int *a = mmap(0, 1025*sizeof(int), PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
    
    for (int cnt=0;cnt<1025;cnt++)
        a[cnt]=cnt;

    return 0;
    
    printf("File mmap test commencing ...\n");
*/    
    direntry_t *dirbuff = malloc(16384);
    
    char *ptr=argv[1], *baseFileName=argv[1];
    char *path, *qualifiedFileName;
    
    path=malloc(0x512);
    qualifiedFileName=malloc(0x512);
    
    while (ptr=(strstr(ptr,"/")))
    {
        ptr++;
        baseFileName=ptr;
    }
    
    strncpy(path, argv[1], (uint32_t)baseFileName-(uint32_t)argv[1]);

    char *temp=malloc(1024);
    fstat_t fstat;

    if (resolvePath(argv[1], temp,false)==0)
    {
        strcpy(qualifiedFileName,temp);
    }
    else
        strcpy(qualifiedFileName, path);

    int statResult=stat(qualifiedFileName,&fstat);
    
    if (statResult)
    {
        printf("Error, can't stat file %s\n",qualifiedFileName);
        return -2;
    }
    
    file = open(qualifiedFileName,"r");
    if (file)
    {
        seek(file, 0, 0);
        char *a = mmap(NULL, fstat.st_size, PROT_WRITE, MAP_PRIVATE, (int)file, 0);

        buffer=malloc(fstat.st_size);
        
        strncpy(buffer,a,fstat.st_size);
        
        write(1, a, fstat.st_size, 1);
        printf("\n");
        close(file);
    }
    else
        printf("Error opening file %s\n",argv[1]);
    if (temp)
        free(temp);
    if (dirbuff)
        free(dirbuff);
    if (path)
        free(path);
    if (qualifiedFileName)
        free(qualifiedFileName);
    if (temp)
        free(temp);
    if (dirbuff)
        free(dirbuff);
    return 0;
/*    file = open(argv[1],"r");
    if (file)
    {

        buffer = malloc(4072);
        do
        {
            readSize = read(file, buffer, 4072, 1);
            if (readSize > 0)
            {
                buffer[readSize]=0x0;
                printf("%s",buffer);
            }
        } while (readSize);
        
        close(file);
        free(buffer);
        return 0;
    }
 */
}

