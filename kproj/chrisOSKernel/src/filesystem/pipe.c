/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "filesystem/pipe.h"
#include "kmalloc.h"
#include "strings.h"
#include "utility.h"
#include "errors.h"
#include "printf.h"

extern filesystem_t* pipeFs;

filesystem_t *initpipefs()
{
    filesystem_t* fs;
    file_operations_t *fops = kMalloc(sizeof(file_operations_t));

    memset(fops, 0, sizeof(file_operations_t));
    fops->open=&pipeopen;
    fops->read=&piperead;
    fops->write=&pipewrite;
    fops->close=&pipeclose;
    fops->seek=NULL;
    fs = kRegisterFileSystem("/pipe/",fops);
    memset(fs, 0, sizeof(filesystem_t));
    fs->files = kMalloc(sizeof(dllist_t));
    return fs;
}

void *pipeopen(void* filePtr, const char *mode)
{
    file_t *file = filePtr;
    pipe_t *pipe = kMalloc(sizeof(pipe_t));
    char* fileContents;
    char temp[50];
    
    file->filetype = FILETYPE_PIPE;
    
    file->f_path = kMalloc(256);
    file->fops = pipeFs->fops;

    strcpy(file->f_path,"/pipe/");
    fileContents = kMalloc(PIPE_FILE_SIZE);
    memset(fileContents, 0, PIPE_FILE_SIZE);
    itoa((int)fileContents, temp);
    strcat(file->f_path, temp);
    
    if (file->buffer==NULL)
    {
        file->buffer = kMalloc(PIPE_FILE_SIZE);
        file->bufferPtr = file->buffer;
    }
    pipe->mode = (*mode=='r'?PIPEREAD:PIPEWRITE);
    pipe->file = file;
    return 0;
}

void pipeclose(pipe_t *pipe)
{
    kFree(pipe->buffer);
    kFree(pipe);
}

size_t piperead(void *buffer, int size, int length, void *f)
{
    file_t *file = f;
    pipe_t *pipe = file->pipe;
    int copySize = size*length;

    if (pipe==NULL)
        panic("piperead: NULL pipe detected on read\n");

    if (pipe->flags & PIPEREAD==0)
        return ERROR_FS_FILE_INVALID_OPERATION;
    
    if (copySize > (uintptr_t)file->bufferPtr - (uintptr_t)pipe->buffer)
        copySize = (uintptr_t)file->bufferPtr - (uintptr_t)pipe->buffer;
    
    if (copySize==0)
        return 0;
    
    //Copy X bytes from pipe memory to the caller's buffer
    memcpy(buffer, pipe->buffer, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
    //Move the contents beyond what is being returned, to the beginning of the buffer
    memcpy(pipe->buffer, file->bufferPtr, PIPE_FILE_SIZE-copySize);
    file->bufferPtr-=copySize;  
}

size_t pipewrite(const void *data, int size, int count, void *f)
{
    file_t *file = f;
    pipe_t *pipe = file->pipe;
    
    int copySize = size*count;

    if (pipe==NULL)
        panic("piperead: NULL pipe detected on write\n");
    if (pipe->flags & PIPEWRITE==0)
        return ERROR_FS_FILE_INVALID_OPERATION;

    //If there isn't as much data as the caller wanted, give them what we have
    int available = (uintptr_t)pipe->buffer + PIPE_FILE_SIZE - (uintptr_t)file->bufferPtr;
    if (copySize > available)
        copySize = available;
    
    if (copySize==0)
        return 0;

    memcpy(file->bufferPtr, data, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
    file->bufferPtr+=copySize;    
}