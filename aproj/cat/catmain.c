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
    char fileName[20]="/test1.sh";
    
    if (argc<2)
        return -1;
    
    file = open(fileName,"r");
    if (file)
    {
        buffer = malloc(4072);
        
        int readSize = read(file, buffer, 4072, 1);
        
        print ("File: %s\nBytes read: %i\n",fileName, readSize);
        print ("Contents: %s",buffer);
        print ("<eof>\n");
        free(buffer);
        close(file);
    }
    return 0;
}

