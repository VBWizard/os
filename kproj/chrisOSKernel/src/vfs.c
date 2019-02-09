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
    bool isPipeFile = false;
    
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
    else
        handle = rootFs->fops->open(path, mode);

    if (handle)
    {
        if (isPipeFile)
        {
            file->handle = handle;
            if (strlen(path)>7)
            {
                file->pipe = (void*)pipedup(path, mode, file);
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
    int retVal = 0, bytesRead;
    
    printd(DEBUG_FILESYS, "\t\tfs_read: called for file %s (handle=0x%08X), %u bytes to 0x%08x\n", theFile->f_path, theFile->handle, size*length, buffer);

    if (size * length == 0)
        return 0;
    
    if (theFile->verification!=0xBABAABAB)
        panic("fs_read: Referenced a file that is not a file");
    
    if (process == NULL) //process == null means that this is being called by kernel so no need to allocate buffer or copy from kernel
    {
        while (__sync_lock_test_and_set(&kFileReadLock, 1));
        bytesRead = theFile->fops->read(buffer, size, length, theFile->handle);
        __sync_lock_release(&kFileReadLock);   
        
        return bytesRead;
    }
    
    if (vfs_readBuffer==NULL)
        vfs_readBuffer = allocPagesAndMap(FS_BUFFERSIZE);
    while (__sync_lock_test_and_set(&kFileReadLock, 1));
    retVal = theFile->fops->read(vfs_readBuffer, size, length, theFile->handle);
    __sync_lock_release(&kFileReadLock);   

    if (retVal > 0)
    {
        printd(DEBUG_FILESYS, "\t\tfs_read: Read %u bytes, copying from kernel address 0x%08x to process address 0x%08x\n", retVal, vfs_readBuffer, buffer);
        copyFromKernel(process, buffer, vfs_readBuffer, retVal);
    }
    else
        retVal = 0; //Regardless of what our disk driver returns for EOF, we return 0
    return retVal;
}

int fs_write(process_t* process, void* file, void * buffer, int size, int length)
{
    file_t* theFile = file;
    int retVal = 0;

    printd(DEBUG_FILESYS, "\t\tfs_write: called for file %s (handle=0x%08X), %u bytes to 0x%08x\n", theFile->f_path, theFile->handle, size*length, buffer);

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
        dir->dops->close(dir->handle);
    else
        theFile->fops->close(theFile->handle);
    
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

    //call the fs's open method
    handle = kMalloc(sizeof(FL_DIR));
    handle = rootFs->dops->open(path, handle);
    if (handle)
    {
        list = kMalloc(sizeof(dllist_t));
        dir = kMalloc(sizeof(file_t));
        dir->f_path = kMalloc(1024);
        dir->dops = kMalloc(sizeof(dirops_t));
        //identify the fs that the path is on

        strncpy(dir->f_path, path, 1024);
        memcpy(dir->dops, rootFs->dops, sizeof(file_operations_t));
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
    int retVal = foundFile->dops->read(foundFile->handle, dirEntry);
    return retVal;
}

int parsePath(const char *inPath, char *outPath, char *outFilename)
{
    char *lpath[512];
    char *token, *lasttoken;
    char tok[2] = "/";
    
    strcpy((char*)lpath,inPath);
    token=strtok(lpath,tok);
    strcpy(outPath,"/");
    
    while (token!=NULL)
    {
        lasttoken=token;
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


int fs_stat(process_t *process, void *path, fstat_t *buffer)
{
    
    char lpath[512], lfile[512];
    dirent_t *dir=kMalloc(16384);
    int dircnt=0;
    int retVal=-1;
    
    parsePath(path, lpath, lfile);
    
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

void fs_closedir(void* dir)
{
    close(LIST_DIRECTORY, dir);
}

/*SYSCALL_GETDENTS:*/
int getDirEntries(void *process, char* path, dirent_t *buffer, int buflen)
{
    void* dirp = fs_opendir(path);
    directory_t* dir;
    dirent_t *dirEntry = kMalloc(sizeof(dirent_t));
    process_t *proc = process;
    int dirCount=0, retVal=0;
    dirent_t *bufptr=buffer;
    
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
    return retVal;
}