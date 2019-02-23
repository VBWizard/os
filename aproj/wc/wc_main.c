/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   wc_main.c
 * Author: yogi
 *
 * Created on February 20, 2019, 7:16 AM
 */
#include "libChrisOS.h"
#define BUFSIZE 32768

int main(int argc, char** argv) 
{
    bool useStdIn = false;
    int *handle=NULL;
    char *buffer=NULL;
    int readSize;
    int words=0, lines=0, bytes=0;
    char lastChar=0;

    if (argc==1)
    {
        useStdIn=true;
        handle=STDIN_FILE;
    }
    else
        handle=open(argv[1], "r");
    
    if (handle || useStdIn)
    {
        buffer = malloc(BUFSIZE);
        while (readSize=read((void*)handle, buffer, BUFSIZE,1))
        {
            for (int cnt=0;cnt<readSize;cnt++)
            {
                bytes++;
                switch(buffer[cnt])
                {
                    case ' ':
                        if (lastChar==' ')
                            break;
                    case '\t':
                        words++;
                        break;
                    case '\n':
                        lines++;
                        words++;
                        break;

                }
                lastChar=buffer[cnt];
            }
        }
        free(buffer);
        if (handle!=STDIN_FILE)
            close(handle);    
        printf("%u %u %u\n",lines,words,bytes);
    }
    
    return 0;
}

