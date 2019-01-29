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
    
*/    printf("File mmap test commencing ...\n");
    
    file = open(argv[1],"r");
    if (file)
    {
        seek(file, 0, 0);
        char *a = mmap(NULL, 51, PROT_WRITE, MAP_PRIVATE, (int)file, 0);

        char test[51];
        strncpy(test,a,51);
        
        a[1] = 0;
        write(1, a, 51, 1);
        close(file);
    }
    else
        printf("Error opening file %s\n",argv[1]);
    
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

