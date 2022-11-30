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
    
    if (file->pipeContent==NULL)
    {
        file->pipeContent = fileContents;
        file->pipeContentPtr=kMalloc(4);
        *file->pipeContentPtr = file->pipeContent;
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

bool pipeclose(file_t *file)
{
    pipe_t *pipe = file->pipe;
    bool bRetVal = false;

    if (--pipe->usecount==0)
    {
        printd(DEBUG_FILESYS,"\tpipeclose: Freeing pipe content area at 0x%08x\n",file->pipeContent);
        kFree(file->pipeContent);
        for (int cnt=0;cnt<1000;cnt++)
        {
            if (openPipes[cnt].pipe == pipe)
            {
                openPipes[cnt].pipe = NULL;
                openPipes[cnt].path = NULL;
                printd(DEBUG_FILESYS,"\tpipeclose: Marked pipe as freed in pipe set\n",file->pipeContent);
                break;
            }
        }
        printd(DEBUG_FILESYS,"\tpipeclose: Freeing pipe pair 0x%08x (r) and 0x%08x (w) (pipe at 0x%08x)\n",pipe->file[0], pipe->file[1], pipe);
        kFree(pipe);
        bRetVal = true;
    }
    else
        bRetVal = false;
    return bRetVal;
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
        if (copySize > (uintptr_t)*file->pipeContentPtr - (uintptr_t)file->pipeContent)
            copySize = (uintptr_t)*file->pipeContentPtr - (uintptr_t)file->pipeContent;
        if (copySize < size * length)
        {
            if (pipe->flags & PIPENOBLOCK) //Pipe doesn't block so oh well if the copy size is less than the caller wants
                break;
            //yield here
            printd(DEBUG_FILESYS, "\tpiperead: Need %u bytes, not available, sleeping until they are\n",size*length);
            sys_sigaction2(SIGSLEEP, 0, *kTicksSinceStart+kTicksPerSecond*9999, getCurrentProcess());
            triggerScheduler();
            __asm__("sti\nhlt\n");
        }
       
    } while (copySize < size * length);
    
    if (copySize > 0)
    {
        //Copy X bytes from pipe memory to the caller's buffer
        while (__sync_lock_test_and_set(&kPipeReadLock, 1));
        memcpy(buffer, file->pipeContent, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
        //Move the contents beyond what is being returned, to the beginning of the buffer, but only the length that has been written to the buffer
        memcpy(file->pipeContent, file->pipeContent+copySize, *file->pipeContentPtr-file->pipeContent-copySize);
        *file->pipeContentPtr-=copySize; 
        __sync_lock_release(&kPipeReadLock);   
        printd(DEBUG_FILESYS, "\t\tpiperead: Returning %u bytes from pipe %s (0x%08X), %u bytes left\n",
                copySize, 
                pipe->file[0]->f_path, 
                pipe->file,
                (uint32_t)*file->pipeContentPtr - (uint32_t)file->pipeContent);

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
        //If there isn't as much data as the caller wanted, give them what we have
        int available = (uintptr_t)file->pipeContent + PIPE_FILE_SIZE - (uintptr_t)*file->pipeContentPtr;
        if (copySize > available)
            copySize = available;
        if (copySize>0)
        {
            memcpy(*file->pipeContentPtr, data+written, copySize);  //Read everything from the beginning of the pipe to the pipe pointer (write pointer)
            *file->pipeContentPtr+=copySize;    
        }
        printd(DEBUG_FILESYS, "\t\tpipewrite: wrote %u bytes to pipe %s (0x%08x)\n", copySize, file->f_path, pipe->file);
        written += copySize;
        if (written < size*count)
        {
            copySize=(size*count)-written;
            //TODO: Fix this effectively polling solution to allos SIGSLEEP to wake on "data available in pipe"
            printd(DEBUG_FILESYS, "\t\tpipewrite: Not enough room to complete write (need=%u, available=%u)\n\tsleeping till more space is available in the pipe\n", copySize, PIPE_FILE_SIZE-((uint32_t)*file->pipeContentPtr - (uint32_t)file->pipeContent));
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

pipe_t *pipedup1(void* path, const char *mode, file_t* file)
{
    pipes_t *op;
    pipe_t *pipe;
    
    //Find the first available pipe to open
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
            file->pipeContent = openPipes[cnt].pipe->file[0]->pipeContent;
            file->fops = pipeFs->fops;
            file->pipeContentPtr = openPipes[cnt].pipe->file[0]->pipeContentPtr;

            return(pipe);
        }
    }
    return NULL;
}

int fs_pipe(process_t *process, int pipefd[2])
{
    int lpipes[2];
    
    copyToKernel(process, lpipes, pipefd,sizeof(int)*2);
    int flags = PIPENOBLOCK;
    fs_pipeI(process, lpipes, flags);
    copyFromKernel(process,pipefd,lpipes,sizeof(int)*2);
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
    filer = fs_open("/pipe/",mode,process);
    strcpy(mode, "w");
    filew = fs_open(filer->f_path,mode,process);
    
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
    printd(DEBUG_FILESYS, "\tCreated pipe pair %s (r=0x%08X/w=0x%08X) for %s\n", 
            pipe.file[0]->f_path, 
            pipe.file[0], 
            pipe.file[1], 
            process==NULL?"{no process id}":process->exename);
    pipe.usecount=2;
    return 0;
}

int fs_dup3(process_t *process, file_t *oldFile, int newFileFD, int flags)
{
    char mode[3]={0,0,0};

    pipe_t *pipe = oldFile->pipe;

    file_t *newFile = kMalloc(sizeof(file_t));
    memset(newFile,0,sizeof(file_t));

    newFile->verification=0xBABAABAB;
    
    strncpy(mode,pipe->mode,1);
    if (flags & PIPENOBLOCK)
        strcat(mode, "n");
        
    newFile->handle=newFile;
    newFile->pipe = (void*)pipedup1(oldFile->f_path, mode, newFile);
    newFile->f_path=kMalloc(1024);
    newFile->copyBuffer=kMalloc(FS_FILE_COPYBUFFER_SIZE);
    newFile->fops=kMalloc(sizeof(fileops_t));
    memcpy(newFile->fops,oldFile->fops,sizeof(fileops_t));
    strcpy(newFile->f_path,oldFile->f_path);
    
    if ((int)oldFile==newFileFD)
    {
        if (process->stdin==oldFile->handle)
            process->stdin=newFile;
        else if (process->stdout==oldFile->handle)
            process->stdout=newFile;
        else if (process->stderr==oldFile->handle)
            process->stderr=newFile;
        else
            panic("fs_dup3:Couldn't find old stdio pipe to replace!\n");

        //oldFile->fops->close(oldFile);
        
    }
    return (int)newFile;
}
