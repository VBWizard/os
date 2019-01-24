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

int main(int argc, char** argv) {

    void* file;
    char* buffer;
    
    int readSize;
    int pipes[2];
    pipe(pipes);
    close(pipes[0]);
    close(pipes[1]);
    
    if (argc<2)
        return -1;
    
    file = open(argv[1],"r");
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
    return -2;
}

