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

extern filesystem_t* rootFs;
extern filesystem_t* pipeFs;

uint32_t pipeFileHandle = 0xFFFFFFFF;

filesystem_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops)
{
    filesystem_t *fs;
    vfs_mount_t *vfs;
    
    fs = kMalloc(sizeof(filesystem_t));
    
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
    //call the fs's open method
    if (strncmp(path,"/pipe/",6)==0)
    {
        handle = (uintptr_t)pipeFileHandle--;
        isPipeFile = true;
    }
    else
        handle = rootFs->fops->open(path, mode);

    file = kMalloc(sizeof(file_t));
    if (handle)
    {
        if (isPipeFile)
        {
            if (mode=='r')
                file->pipe = pipeFs->fops->open(file,"r");
            else
                file->pipe = pipeFs->fops->open(file,"w");
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

        list = kMalloc(sizeof(dllist_t));

        if (rootFs->files == NULL)
        {
            rootFs->files = kMalloc(sizeof(dllist_t));
            listInit(rootFs->files,file);
        }
        else
            listAdd(rootFs->files,list,file);
        printd(DEBUG_FILESYS, "\tfs_open: returning handle 0x%08X\n",handle);
        return handle;
    }
    printd(DEBUG_FILESYS, "\tfs_open: returning NULL\n",handle);
    return NULL;
}

int fs_read(process_t* process, void* file, void * buffer, int size, int length)
{
    
    file_t* foundFile = getFileFromList(rootFs, LIST_FILE, file);
    int retVal = 0;
    char* lBuffer;
    
    if (foundFile==NULL)
        panic("fs_read: file handle not found in fs->files");
    
    if (process == NULL) //process == null means that this is being called by kernel so no need to allocate buffer or copy from kernel
        return foundFile->fops->read(buffer, size, length, foundFile->handle);
    
    lBuffer = allocPagesAndMap(size*length);
    retVal = foundFile->fops->read(lBuffer, size, length, foundFile->handle);
    copyFromKernel(process, buffer, lBuffer, size*length);
    kFree(lBuffer);

    return retVal;
}

int fs_seek(void* file, long offset, int whence)
{
    file_t* foundFile = getFileFromList(rootFs, LIST_FILE, file);
    
    if (foundFile==NULL)
        panic("fs_seek: file handle not found in fs->files");
    
    return foundFile->fops->seek(foundFile->handle, offset, whence);
}

void close(eListType listType, void* entry)
{
    bool deInitTheList=false;
    dllist_t* foundEntry;

    if (listType == LIST_DIRECTORY)
        foundEntry = listHead(rootFs->dirs);
    else
        foundEntry = listHead(rootFs->files);

    if (foundEntry==NULL)
        panic("fs_close: handle not found in fs->files/fs->dirs");
    
    if (listType == LIST_DIRECTORY)
        ((directory_t*)(foundEntry->payload))->dops->close(((directory_t*)foundEntry->payload)->handle);
    else
        ((file_t*)(foundEntry->payload))->fops->close(((file_t*)foundEntry->payload)->handle);
    
    if (foundEntry->next==foundEntry && foundEntry->prev==foundEntry)
        deInitTheList=true;
    listRemove(foundEntry);
    kFree(foundEntry);

    if (deInitTheList)
        if (listType == LIST_DIRECTORY)
            rootFs->dirs=NULL;
        else
            rootFs->files=NULL;
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