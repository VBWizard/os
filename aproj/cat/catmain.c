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
        int readSize = read(file, buffer, 4072, 1);
        close(file);
        print ("%s",buffer);
        //write(pipes[1], buffer, readSize, 1);
        char* chars[4072];
        int charsRead = read(pipes[0], chars, readSize, 1);
        free(buffer);
        return 0;
    }
    return -2;
}

