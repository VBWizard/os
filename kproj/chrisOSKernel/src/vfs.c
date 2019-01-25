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

uint32_t pipeFileHandle = 0xFFFFFFFF;
char* lBuffer;

filesystem_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops)
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
    memcpy(fs->fops, fops, sizeof(fileops_t));
    lBuffer = NULL;
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
        else if (((directory_t*)list->payload)->handle==entryToFind)
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
    
    printd(DEBUG_FILESYS, "fs_open: called with path=%s, mode=%s\n", path, mode);
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
        printd(DEBUG_FILESYS, "\tfs_open: returning handle 0x%08x\n",handle);
        return file;
    }
    printd(DEBUG_FILESYS, "\tfs_open: returning NULL\n",handle);
    return NULL;
}

//NOTE: if less than size+length is available, the call will block until it is available
//     unless the pipe was opened with the "n" flag meaning don't block, in which case
//     we'll return whatever is available, or nothing
int fs_read(process_t* process, void* file, void * buffer, int size, int length)
{
    file_t* theFile = file;
    int retVal = 0;
    
    if (size * length == 0)
        return 0;
    
    if (theFile->verification!=0xBABAABAB)
        panic("fs_read: Referenced a file that is not a file");
    
    if (process == NULL) //process == null means that this is being called by kernel so no need to allocate buffer or copy from kernel
        return theFile->fops->read(buffer, size, length, theFile->handle);
    
    if (lBuffer==NULL)
        lBuffer = allocPagesAndMap(size*length);
    retVal = theFile->fops->read(lBuffer, size, length, theFile->handle);
    if (retVal > 0)
        copyFromKernel(process, buffer, lBuffer, retVal);
    else
        retVal = 0; //Regardless of what our disk driver returns for EOF, we return 0
    return retVal;
}

int fs_write(process_t* process, void* file, void * buffer, int size, int length)
{
    file_t* theFile = file;
    int retVal = 0;
    char* lBuffer;
    
    if (theFile->verification!=0xBABAABAB)
        panic("fs_read: Referenced a file that is not a file");

    if (process == NULL) //process == null means that this is being called by kernel so no need to allocate buffer or copy from kernel
        return theFile->fops->write(buffer, size, length, theFile->handle);
    
    lBuffer = allocPagesAndMap(size*length);
    copyToKernel(process, lBuffer, buffer, size*length);
    retVal = theFile->fops->write(lBuffer, size, length, theFile->handle);
    kFree(lBuffer);
    return retVal;
}

int fs_seek(void* file, long offset, int whence)
{
    file_t* theFile = file;
    
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
    file_t* file = entry;
    directory_t *dir = entry;
    if (file->verification!=0xBABAABAB)
        panic("close: Referenced a file that is not a file!");
    if (listType == LIST_DIRECTORY)
        dir->dops->close(dir->handle);
    else
        file->fops->close(file->handle);
    
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
    void* handle;
    dllist_t* list;
    directory_t *dir;
    
    //call the fs's open method
    handle = rootFs->dops->open(path);
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
        return handle;
    }
    return NULL;
}

int fs_readdir(void* file, dirent_t *dirEntry)
{

    directory_t* foundFile = getFileFromList(rootFs, LIST_DIRECTORY, file);
    
    if (foundFile==NULL)
        panic("fs_read: file handle not found in fs->files");
    return foundFile->dops->read(foundFile->handle, dirEntry);
}

void fs_closedir(void* dir)
{
    close(LIST_DIRECTORY, dir);
}

/*SYSCALL_GETDENTS:*/
int getDirEntries(void *process, char* path, dirent_t *buffer, int bufferCount)
{
    void* dirp = fs_opendir(path);
    dirent_t dirEntry;
    dirent_t* lBuffer;
    process_t *proc = process;
    int dirCount=0;
    
    if (dirp)
    {
        while (fs_readdir(dirp,&dirEntry)!=-1 && dirCount < bufferCount)
        {
            copyFromKernel(proc, lBuffer++, &dirEntry, sizeof(dirent_t));
            dirCount++;
        }
        
        return dirCount;
    }
    return 0;
}