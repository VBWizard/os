/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   grep.c
 * Author: yogi
 *
 * Created on February 3, 2019, 5:19 PM
 */

#include "libChrisOS.h"
/*
 * 
 */

#define BUFSIZE 32768

void doFound(char *buffer, int buflen, char* location, char *needle);

char *printbuffer;

int getFileSize(char *inPath)
{
    char *ptr=inPath, *ptr2=inPath;
    char *path, *filename;
    int filesize = -1;
    direntry_t *dirbuff = malloc(16384);
    
    path=malloc(0x512);
    filename=malloc(0x512);
    
    while (ptr=(strstr(ptr,"/")))
    {
        ptr++;
        ptr2=ptr;
    }
    
    strncpy(path, inPath, (uint32_t)ptr2-(uint32_t)inPath);
    strcpy(filename, ptr2);
    int entryCount = getdir(path, (void*)dirbuff, 16384);
    
    for (int cnt=0;cnt<entryCount;cnt++)
        if (strcmp(filename,dirbuff[cnt].filename)==0)
        {
            filesize = dirbuff[cnt].size;
            return filesize;
        }
    return -1;
}

int main(int argc, char** argv) 
{
    char needle[512];
    int needleLength=0, fCount=0, readSize=0;
    char haystack[512];
    int argCount=argc, filesize=0;
    bool useStdIn = false;
    int *handle=0;
    char *buffer;
    
    if (argc==1)
        return 0;
    
    if (argc>=2)
    {
        strcpy(needle, argv[1]);
        needleLength = strnlen(needle, 512);
        if (needleLength<0 || needleLength>512)
            return -2;
    }
    
    if (argc==3)
        strncpy(haystack, argv[2],512);
    else
    {
        useStdIn=true;
        strcpy(haystack, "STDIN");
    }
    
    if (useStdIn)
        handle=STDIN_FILE;
    else
        handle=open(haystack, "r");
    
    if (handle==NULL)
    {
        printf("Unable to open file %s\n", haystack);
        return -3;
    }
    
    buffer = malloc(BUFSIZE);
    
    while (readSize=read((void*)handle, buffer, BUFSIZE,1))
    {
        for (int hstack=0;hstack<readSize;hstack++)
        {
            char *bufptr = &buffer[hstack];
            fCount=0;
            for (char *ndl=needle;*ndl;ndl++)
            {
                if (*bufptr++!=*ndl)
                    break;
                if (++fCount==needleLength)
                {
                    doFound(buffer, readSize, &buffer[hstack], needle);
                    hstack+=(uint32_t)(bufptr-buffer)+needleLength;
                    break;
                }
                    
            }
        }
    }
    
    if (handle!=STDIN_FILE)
        close(handle);
    free(buffer);
    if (printbuffer)
        free(printbuffer);
    return 0;
}

char *findPrevNewline(const char *buffer, const char *pos)
{
    char *lPos = (char*)pos;
    
    while (lPos>=buffer)
        if (*lPos=='\n')
            return lPos+1;
        else
            lPos--;
    
}

void doFound(char *buffer, int buflen, char* location, char *needle)
{
    int sz;
    
    if (printbuffer==NULL)
        printbuffer=malloc(65535);
    char *newlineB = findPrevNewline(buffer, location);
    char *newlineA = strstr(newlineB,"\n");
    if (newlineA > buffer+buflen)
        newlineA = buffer+buflen;
    sz = (int)(newlineA-newlineB);
    memcpy(printbuffer,newlineB, sz);
    printbuffer[sz]='\0';
    //printf("Found string %s at character %u\n", needle, (uint32_t)(location-buffer));
    printf("%s\n",printbuffer);
}