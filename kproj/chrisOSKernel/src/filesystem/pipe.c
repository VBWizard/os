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
#include "thesignals.h"

extern filesystem_t* pipeFs;
extern volatile int kTicksPerMS;
extern volatile int *kTicksSinceStart;
volatile int kPipeWriteLock;
volatile int kPipeReadLock;
volatile int kTicksPerSecond;

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
    fs = kRegisterFileSystem("/pipe/", fops, NULL);
    fs->files = kMalloc(sizeof(dllist_t));
    memset(openPipes,0,sizeof(pipes_t)*1000);
    kPipeWriteLock = 0;
    kPipeReadLock = 0;
    return fs;
}

void *pipeopen(void* filePtr, const char *mode)
{
    file_t *file = filePtr;
    pipe_t *pipe = kMalloc(sizeof(pipe_t));
    memset(pipe, 0, sizeof(pipe_t));
    
    char* fileContents;
    char temp[50];
    
    file->filetype = FILETYPE_PIPE;
    
    file->f_path = kMalloc(256);
    file->fops = pipeFs->fops;
    pipe->fops = pipeFs->fops;
    

    strcpy(file->f_path,"/pipe/");
    fileContents = kMalloc(PIPE_FILE_SIZE);
    memset(fileContents, 0, PIPE_FILE_SIZE);
    itoa((int)fileContents, temp);
    strcat(file->f_path, temp);
    
    if (file->buffer==NULL)
    {
        file->buffer = fileContents;
        file->bufferPtr=kMalloc(4);
        *file->bufferPtr = file->buffer;
    }
    strcpy(pipe->mode, mode);
    if (strstr((char*)pipe->mode,"r"))
    {
        pipe->flags |= PIPEREAD;
        pipe->file[0] = file;
        pipe->file[0]->pipe = pipe;
    }
    else
    {
        pipe->flags |= PIPEWRITE;
        pipe->file[1] = file;
        pipe->file[1]->pipe = pipe;
    }
    
    if (strstr(pipe->mode,"n"))
        pipe->flags |= PIPENOBLOCK;
    
    
    pipes_t *op;
    for (int cnt=0;cnt<1000;cnt++)
    {
        if (openPipes[cnt].pipe == NULL)
        {
            openPipes[cnt].path = file->f_path;
            openPipes[cnt].pipe = pipe;
            break;
        }
    }
    
    return pipe;
}

void pipeclose(file_t *file)
{
    pipe_t *pipe = file->pipe;
    
    kFree(file->buffer);
    kFree(pipe);
    for (int cnt=0;cnt<1000;cnt++)
    {
        if (openPipes[cnt].pipe == pipe)
        {
            openPipes[cnt].pipe = NULL;
            openPipes[cnt].path = NULL;
            break;
        }
    }
}

size_t piperead(void *buffer, int size, int length, void *f)
{
    file_t *file = f;
    pipe_t *pipe = file->pipe;
    int copySize = 0;

    if (pipe==NULL)
        panic("piperead: NULL pipe detected on read\n");

    if (pipe->flags & PIPEREAD==0)
        return ERROR_FS_FILE_INVALID_OPERATION;
    
    do
    {
        copySize = size * length;
        if (copySize > (uintptr_t)*file->bufferPtr - (uintptr_t)file->buffer)
            copySize = (uintptr_t)*file->bufferPtr - (uintptr_t)file->buffer;
        if (copySize < size * length)
        {
            if (pipe->flags & PIPENOBLOCK) //Pipe doesn't block so oh well if the copy size is less than the caller wants
                break;
            //yield here
            printd(DEBUG_FILESYS, "\tpiperead: Need %u bytes, not available, sleeping until they are\n",size*length);
            sys_sigaction2(SIGSLEEP, 0, *kTicksSinceStart+kTicksPerSecond, getCurrentProcess());
            triggerScheduler();
            __asm__("sti\nhlt\n");
        }
       
    } while (copySize < size * length);
    
    if (copySize > 0)
    {
        //Copy X bytes from pipe memory to the caller's buffer
        while (__sync_lock_test_and_set(&kPipeReadLock, 1));
        memcpy(buffer, file->buffer, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
        //Move the contents beyond what is being returned, to the beginning of the buffer, but only the length that has been written to the buffer
        memcpy(file->buffer, file->buffer+copySize, *file->bufferPtr-file->buffer-copySize);
        *file->bufferPtr-=copySize; 
        __sync_lock_release(&kPipeReadLock);   
        printd(DEBUG_FILESYS, "\t\tpiperead: Returning %u bytes from pipe %s (0x%08X), %u bytes left\n",
                copySize, 
                pipe->file[0]->f_path, 
                pipe->file,
                (uint32_t)*file->bufferPtr - (uint32_t)file->buffer);

    }
    return copySize;
}

size_t pipewrite(const void *data, int size, int count, void *f)
{
    file_t *file = f;
    pipe_t *pipe = file->pipe;
    
    int copySize = size*count;
    int written = 0;

    if (pipe==NULL)
        panic("pipewrite: NULL pipe detected on write\n");
    
    if ((pipe->flags & PIPEWRITE)==0)
        return ERROR_FS_FILE_INVALID_OPERATION;

    while (written < size*count)
    {
        while (__sync_lock_test_and_set(&kPipeWriteLock, 1));
        //If there isn't as much data as the caller wanted, give them what we have
        int available = (uintptr_t)file->buffer + PIPE_FILE_SIZE - (uintptr_t)*file->bufferPtr;
        if (copySize > available)
            copySize = available;
        if (copySize>0)
        {
            memcpy(*file->bufferPtr, data+written, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
            *file->bufferPtr+=copySize;    
        }
        __sync_lock_release(&kPipeWriteLock);   
        printd(DEBUG_FILESYS, "\t\tpipewrite: wrote %u bytes to pipe %s (0x%08x)\n", copySize, file->f_path);
        written += copySize;
        if (written < size*count)
        {
            copySize=(size*count)-written;
            //TODO: Fix this effectively polling solution to allos SIGSLEEP to wake on "data available in pipe"
            printd(DEBUG_FILESYS, "\t\tpipewrite: Not enough room to complete write (need=%u, available=%u)\n\tsleeping till more space is available in the pipe\n", copySize, PIPE_FILE_SIZE-((uint32_t)*file->bufferPtr - (uint32_t)file->buffer));
            sys_sigaction2(SIGSLEEP, 0, *kTicksSinceStart+(kTicksPerSecond/5), getCurrentProcess());
            triggerScheduler();
            __asm__("sti\nhlt\n");
        }
            
    }
    
    printd(DEBUG_FILESYS, "\t\tpipewrite: Done writing to pipe %s (0x%08x).  Wrote %u (total) bytes\n",
            pipe->file[1]->f_path, 
            pipe->file, 
            written);

    return written;
}

pipe_t *pipedup(void* path, const char *mode, file_t* file)
{
    pipes_t *op;
    pipe_t *pipe;
    
    for (int cnt=0;cnt < 1000;cnt++)
    {
        if (strncmp(openPipes[cnt].path, path,256)==0)
        {
            pipe = kMalloc(sizeof(pipe_t));
            memcpy(pipe, openPipes[cnt].pipe, sizeof(pipe_t));
            pipe->fops = pipeFs->fops;
            strcpy(pipe->mode, mode);
            pipe->flags = 0;
            if (strstr(mode, "r"))
                pipe->flags |= PIPEREAD;
            else
                pipe->flags |= PIPEWRITE;
            
            if (strstr(pipe->mode,"n"))
                pipe->flags |= PIPENOBLOCK;
            
            for (int cnt2=0;cnt2<1000;cnt2++)
            {
                if (openPipes[cnt2].pipe==NULL)
                {
                    openPipes[cnt2].path = path;
                    openPipes[cnt2].pipe = pipe;
                    break;
                }
            }
            file->buffer = openPipes[cnt].pipe->file[0]->buffer;
            file->fops = pipeFs->fops;
            file->bufferPtr = openPipes[cnt].pipe->file[0]->bufferPtr;

            return(pipe);
        }
    }
    return NULL;
}

int fs_pipe(process_t *process, int pipefd[2])
{

    int flags = PIPENOBLOCK;
    fs_pipeI(process, pipefd, flags);
    return 0;
}

int fs_pipeI(process_t *process, int pipefd[2], int flags)
{
    file_t *filer, *filew;
    char mode[10];
    int pipes[2];
    pipe_t pipe;
    
    strcpy(mode, "r");
    if (flags & PIPENOBLOCK)
        strcat(mode, "n");
    filer = fs_open("/pipe/",mode);
    strcpy(mode, "w");
    filew = fs_open(filer->f_path,mode);
    
    pipes[0] = (int)filer;
    pipes[1] = (int)filew;
    if (process != NULL)
        copyFromKernel(process, pipefd, pipes, sizeof(int)*2);
    else
    {
    pipefd[0] = (int)filer;
    pipefd[1] = (int)filew;
    } 
    
    pipe.owner = process;
    
    pipe.file[0] = filer;
    pipe.file[1] = filew;
    
    pipe.owner = process;
    printd(DEBUG_FILESYS, "\tCreated pipe pair %s/%s (0x%08X/0x%08X) for %s\n", 
            pipe.file[0]->f_path, 
            pipe.file[1]->f_path, 
            pipe.file[0], 
            pipe.file[1], 
            process->exename);
    return 0;
}
