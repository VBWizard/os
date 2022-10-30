/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "fs.h"
#include "kmalloc.h"
#include "strings.h"
#include "printf.h"
#include "kernel.h"
#include "alloc.h"
#include "errors.h"
#include "filesystem/pipe.h"

extern filesystem_t* rootFs;
extern filesystem_t* pipeFs;
extern filesystem_t* procFs;

struct fs_dir_list_status
{
    uint32_t                  sector;
    uint32_t                  cluster;
    uint8_t                   offset;
};

typedef struct fs_dir_list_status    FL_DIR;
uint32_t pipeFileHandle = 0xFFFFFFFF;
char* vfs_writeBuffer;
char* vfs_readBuffer;
volatile int kFileWriteLock;
volatile int kFileReadLock;

filesystem_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops, const dirops_t * dops)
{
    filesystem_t *fs;
    vfs_mount_t *vfs;
    
    fs = kMalloc(sizeof(filesystem_t));
    memset(fs, 0, sizeof(filesystem_t));

    fs->mount = kMalloc(sizeof(vfs_mount_t));
    
    fs->mount->mnt_root = kMalloc(sizeof(dentry_t));
    fs->mount->mnt_root->d_name = kMalloc(strlen(mountPoint));
    strcpy(fs->mount->mnt_root->d_name,mountPoint);
    
    //See if the filesystem being mounted is the root of the filesystem
    if (strncmp(mountPoint,"/",1024)==0)
        fs->mount->mnt_root->d_parent = (dentry_t*)DENTRY_ROOT;
    else if (strncmp(mountPoint,"/pipe/",1024)==0)
    {}
    else if (strncmp(mountPoint,"/proc",1024)==0)
    {}
    else
        panic("Mounting filesystem as non-root ... this is not yet supported");
    
    fs->fops = kMalloc(sizeof(fileops_t));
    fs->dops = kMalloc(sizeof(dirops_t));
    memcpy(fs->fops, fops, sizeof(fileops_t));
    memcpy(fs->dops, dops, sizeof(dirops_t));
    vfs_writeBuffer = NULL;
    vfs_readBuffer = NULL;
    kFileWriteLock = 0;
    kFileReadLock = 0;
    return fs;
}

dllist_t* getListEntry(filesystem_t *fs, eListType listType, void* entryToFind)
{
    dllist_t* list;
    
    if (listType== LIST_DIRECTORY)
        list = listHead(fs->dirs);
    else
        list = listHead(fs->files);
    
    while (1)
    {
        if (listType == LIST_FILE)
        {
            if (((file_t*)list->payload)->handle==entryToFind)
                return list;
        }
        else if (((directory_t*)list->payload)==entryToFind)
                return list;
        if (list->next==list)
            break;
        list=listNext(list);
            
    }
    return NULL;
}

void* getFileFromList(filesystem_t *fs, eListType listType, void* file)
{
    dllist_t* list;
    
    if (listType == LIST_DIRECTORY)
        list = listHead(fs->dirs);
    else
        list = listHead(fs->files);
    
    return getListEntry(fs, listType, file)->payload;
}


void* fs_open(char* path, const char* mode)
{
    void* handle;
    dllist_t* list;
    file_t *file;
    bool isPipeFile=false;
    bool isProcFile=false;
    
    printd(DEBUG_FILESYS, "\t\tfs_open: called with path=%s, mode=%s\n", path, mode);
    file = kMalloc(sizeof(file_t));
    memset(file,0,sizeof(file_t));
    
    //call the fs's open method
    if (strncmp(path,"/pipe/",6)==0)
    {
        //handle = (uintptr_t*)pipeFileHandle--;
        handle = file;
        isPipeFile = true;
    }
    else if (strncmp(path,"/proc",5)==0)
    {
        isProcFile = true;
        handle=procFs->fops->open(path, mode);
    }
    else
        handle = rootFs->fops->open(path, mode);

    if (handle)
    {
        if (isPipeFile)
        {
            file->handle = handle;
            if (strlen(path)>7)
            {
                file->pipe = (void*)pipedup1(path, mode, file);
                file->f_path = path;
                if (!file->pipe)
                    return ERROR_FS_PIPE_DOESNT_EXIST;
                if (strstr(mode,"r"))
                    ((pipe_t *)file->pipe)->file[0] = file;
                else
                    ((pipe_t *)file->pipe)->file[1] = file;
            }
            else if (strstr(mode,"r"))
                file->pipe = pipeFs->fops->open(file,mode);
            else
                file->pipe = pipeFs->fops->open(file,mode);
        }
        else
        {
            file->handle = handle;
            file->filetype=FILETYPE_FILE;
            file->f_path = kMalloc(1024);
            file->fops = kMalloc(sizeof(file_operations_t));
            strncpy(file->f_path, path, 1024);
            if (isProcFile)
                memcpy(file->fops, procFs->fops, sizeof(file_operations_t));
            else
                memcpy(file->fops, rootFs->fops, sizeof(file_operations_t));
        }
        //identify the fs that the path is on

/*        list = kMalloc(sizeof(dllist_t));

        if (rootFs->files == NULL)
        {
            rootFs->files = kMalloc(sizeof(dllist_t));
            listInit(rootFs->files,file);
        }
        else
            listAdd(rootFs->files,list,file);
*/
        file->verification=0xBABAABAB;
        file->copyBuffer=kMalloc(FS_FILE_COPYBUFFER_SIZE);
        printd(DEBUG_FILESYS, "\t\tfs_open: returning handle 0x%08x\n",handle);
        return file;
    }
    printd(DEBUG_FILESYS, "\t\tfs_open: returning NULL\n",handle);
    return NULL;
}

//NOTE: if less than size+length is available, the call will block until it is available
//     unless the pipe was opened with the "n" flag meaning don't block, in which case
//     we'll return whatever is available, or nothing
int fs_read(process_t* process, void* file, void * buffer, int size, int length)
{
    file_t* theFile = file;
    int totalBytesRead=0, bytesRead=0, readSize;
    
    printd(DEBUG_FILESYS, "\t\tfs_read: called for file %s (handle=0x%08X), %u bytes to 0x%08x\n", theFile->f_path, theFile->handle, size*length, buffer);

    if (size * length == 0)
        return 0;
    
    if (theFile->verification!=0xBABAABAB)
        panic("fs_read: Referenced a file that is not a file");
    
    //For kernel processes, just read the file and return in the kernel's buffer
    if (process==NULL)
        totalBytesRead=theFile->fops->read(buffer,size*length,1,theFile->handle);
    else //For user processes, have to use kernel file_t copy buffer which is limited in length, so loop until all bytes are read
        while (totalBytesRead<size*length)
        {
            //Figure out how many bytes we will read in this iteration
            readSize=(size*length)-totalBytesRead>FS_FILE_COPYBUFFER_SIZE?FS_FILE_COPYBUFFER_SIZE:(size*length)-totalBytesRead; //Only read up to the size of the file_t buffer
            //Read the bytes from the file
            printd(DEBUG_FILESYS, "\t\tfs_read: Reading %u bytes to 0x%08x\n", readSize, theFile->copyBuffer);
            bytesRead = theFile->fops->read(theFile->copyBuffer,readSize,1,theFile->handle);
            //If the read returned bytes, copy them from the file_t buffer to the process' buffer
            if (bytesRead > 0)
            {
                printd(DEBUG_FILESYS, "\t\tfs_read: Read %u bytes, copying (partial) from kernel address 0x%08x to process address 0x%08x\n", bytesRead, theFile->copyBuffer, buffer+totalBytesRead);
                copyFromKernel(process, buffer+totalBytesRead, theFile->copyBuffer, bytesRead);
                totalBytesRead+=bytesRead;
            }
            else //Otherwise, if the read didn't return bytes
            {
                break;
            }
        }
        printd(DEBUG_FILESYS, "\t\tfs_read: Done reading.  Read %u bytes to user process buffer at 0x%08x\n", totalBytesRead, buffer);
    return totalBytesRead;
}

int fs_write(process_t* process, void* file, void * buffer, int size, int length)
{
    file_t* theFile = file;
    int retVal = 0;

    printd(DEBUG_FILESYS, "\t\tfs_write: called for file %s (handle=0x%08X), %u bytes from 0x%08x\n", theFile->f_path, theFile->handle, size*length, buffer);

    if (theFile->verification!=0xBABAABAB)
        panic("fs_write: Referenced a file that is not a file");

    if (process == NULL) //process == null means that this is being called by kernel so no need to allocate buffer or copy from kernel
        return theFile->fops->write(buffer, size, length, theFile->handle);
    
    if (vfs_writeBuffer==NULL)
        vfs_writeBuffer = allocPagesAndMap(FS_BUFFERSIZE);
    copyToKernel(process, vfs_writeBuffer, buffer, size*length);
    retVal = theFile->fops->write(vfs_writeBuffer, size, length, theFile->handle);
    return retVal;
}

int fs_seek(void* file, long offset, int whence)
{
    file_t* theFile = file;
    
    printd(DEBUG_FILESYS, "\t\tfs_seek: called for file %s (handle=0x%08X), offset %u, whence %u\n", theFile->f_path, theFile->handle, offset, whence);

    if (theFile->verification!=0xBABAABAB)
        panic("fs_seek: Referenced a file that is not a file",file);
    
    return theFile->fops->seek(theFile->handle, offset, whence);
}

int fs_stat(process_t *process, void *path, fstat_t *buffer)
{
    
    char lpath[512], lfile[512];
    dirent_t *dir=kMalloc(16384);
    int dircnt=0;
    int retVal=-1;
    fstat_t lbuffer;
    
    strcpy(lpath,path);
    strtrim2(lpath);
    if (*lpath==0 || strcmp(lpath,"/")==0)
    {
        if (process)
        {
            /*lbuffer.st_size=0;
            lbuffer.st_lastmod=0;
            copyFromKernel(process,buffer,&lbuffer,sizeof(fstat_t));*/
            return -1;
        }
        else
        {
            buffer->st_size=0;
            buffer->st_lastmod=0;
        }
        return 0;
    }
    
    parsePath(path, lpath, lfile, NULL, 0);
    
    dircnt=getDirEntries(NULL, lpath, dir, 16384);
    
    for (int cnt=0;cnt<dircnt;cnt++)
        if (strcmp(dir[cnt].filename,lfile)==0)
        {
            if (process)
            {
                uint32_t lastMod=dir[cnt].write_date << 16 | dir[cnt].write_time;
                copyFromKernel(process,&buffer->st_size,&dir[cnt].size,sizeof(dir[cnt].size));
                copyFromKernel(process,&buffer->st_lastmod,&lastMod,sizeof(uint32_t));
            }
            else
            {
                buffer->st_size=dir[cnt].size;
                buffer->st_lastmod=dir[cnt].write_date << 16 | dir[cnt].write_time;
            }
            retVal=0;
            break;
        }
    
    if (dir)
        kFree(dir);
    
    return retVal;
}

long fs_tell(void* file)
{
    file_t* theFile = file;
    
    printd(DEBUG_FILESYS, "\t\tfs_tell: called for file %s (handle=0x%08X)\n", theFile->f_path, theFile->handle);

    if (theFile->verification!=0xBABAABAB)
        panic("fs_tell: Referenced a file that is not a file",file);
    
    return theFile->fops->tell(theFile->handle);
}

void close(eListType listType, void* entry)
{
/*    dllist_t* foundEntry;

    if (listType == LIST_DIRECTORY)
        foundEntry = listHead(rootFs->dirs);
    else
        foundEntry = listHead(rootFs->files);

    while (((file_t*)foundEntry->payload)->handle!=entry && foundEntry->next!=foundEntry)
        foundEntry=foundEntry->next;
    
    if (((file_t*)foundEntry->payload)->handle!=entry && foundEntry==foundEntry)
        panic("fs_close: handle not found in fs->files/fs->dirs");
*/
    file_t* theFile = entry;
    directory_t *dir = entry;

    if (listType==LIST_FILE)
    {
        printd(DEBUG_FILESYS, "\t\tfs_close: called for file %s (handle=0x%08X)\n", theFile->f_path, theFile->handle);
        if (theFile->verification!=0xBABAABAB)
            panic("close: Referenced a file that is not a file!");
    }
    else
    {
        printd(DEBUG_FILESYS, "\t\tfs_close: called for directory %s (handle=0x%08X)\n", dir->f_path, dir->handle);
    }
    if (listType == LIST_DIRECTORY)
    {
        dir->dops->close(dir->handle);
        printd(DEBUG_FILESYS, "\t\tfs_close: Freeing directory_t resources\n");
        kFree(dir->dops);
        kFree(dir->f_path);
        kFree(dir->handle);
        kFree(dir);
    }
    else
    {
        theFile->fops->close(theFile->handle);
        printd(DEBUG_FILESYS, "\t\tfs_close: freeing file_t resources\n");
        kFree(theFile->fops);
        kFree(theFile->f_path);
        kFree(theFile->copyBuffer);
        printd(DEBUG_FILESYS, "\t\tFreeing handle (type=%u) @ 0x%08x\n",theFile->handle, theFile->filetype);
        kFree(theFile);
    }
   
//    rootFs->files = listRemove(rootFs->files,foundEntry); //NOTE: listRemove will effectively de-init the list if it becomes empty
//    kFree(foundEntry);

/*    if (deInitTheList)
        if (listType == LIST_DIRECTORY)
            rootFs->dirs=NULL;
        else
            rootFs->files=NULL;*/
}

void fs_close(void* file)
{
    close(LIST_FILE, file);
}

void* fs_opendir(char* path)
{
    void *handle;
    dllist_t* list;
    directory_t *dir;
    bool isProcFS;
    
    isProcFS=strncmp(path,"/proc",5)==0?1:0;

    //call the fs's open method
    handle = kMalloc(sizeof(FL_DIR));
    if (isProcFS)
        handle = procFs->dops->open(path, handle);
    else
        handle = rootFs->dops->open(path, handle);
    if (handle)
    {
        list = kMalloc(sizeof(dllist_t));
        dir = kMalloc(sizeof(file_t));
        dir->f_path = kMalloc(1024);
        dir->dops = kMalloc(sizeof(dirops_t));
        //identify the fs that the path is on

        strncpy(dir->f_path, path, 1024);
        if (isProcFS)
            memcpy(dir->dops, procFs->dops, sizeof(dirops_t));
        else
            memcpy(dir->dops, rootFs->dops, sizeof(dirops_t));
        dir->handle = handle;

        if (rootFs->dirs == NULL)
        {
            rootFs->dirs = kMalloc(sizeof(dllist_t));
            listInit(rootFs->dirs,dir);
        }
        else
            listAdd(rootFs->dirs,list,dir);
        return dir;
    }
    return NULL;
}

int fs_readdir(void* file, dirent_t *dirEntry)
{

    directory_t* foundFile = getFileFromList(rootFs, LIST_DIRECTORY, file);
    
    if (foundFile==NULL)
        panic("fs_readdir: file handle not found in fs->files");
    return foundFile->dops->read(foundFile->handle, dirEntry);
}

int parsePath(const char *inPath, char *outPath, char *outFilename, char** outPathTokens, int outPathTokensArrayCount)
{
    char *lpath[512];
    char *token, *lasttoken;
    char tok[2] = "/";
    int tokensCreated=0;
    
    strcpy((char*)lpath,inPath);
    token=strtok(lpath,tok);
    strcpy(outPath,"/");

    while (token!=NULL)
    {
        lasttoken=token;
        if (tokensCreated<outPathTokensArrayCount)
            strcpy(outPathTokens[tokensCreated++],token);
        token=strtok(NULL,tok);
        if (token!=NULL)
        {
            strcat(outPath,lasttoken);
            strcat(outPath,"/");
        }
        else
            strcpy(outFilename,lasttoken);
    }
}

void fs_closedir(void* dir)
{
    close(LIST_DIRECTORY, dir);
}

/*SYSCALL_GETDENTS:*/
int getDirEntries(void *process, char* path, dirent_t *buffer, int buflen)
{
    directory_t* dir;
    dirent_t *dirEntry = kMalloc(sizeof(dirent_t));
    process_t *proc = process;
    int dirCount=0, retVal=-1;
    dirent_t *bufptr=buffer;
    void* dirp = fs_opendir(path);

    if (dirp)
    {
        dir = (directory_t*)dirp;

        if (dir->handle)
        {
            while (fs_readdir(dirp,dirEntry)>=0 && dirCount*sizeof(dirent_t) < buflen)
            {
                if (proc)
                    copyFromKernel(proc, bufptr, dirEntry, sizeof(dirent_t));
                else
                    memcpy(bufptr, dirEntry, sizeof(dirent_t));
                dirCount++;
                int a = sizeof(dirent_t);
                bufptr++;
            }

            retVal=dirCount;
        }
        if (dirp)
            fs_closedir(dirp);
    }
    
    kFree(dirEntry);
    return retVal;
}

int fs_unlink(char *filename)
{
     return rootFs->fops->delete(filename);
}