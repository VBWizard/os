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

file_system_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops)
{
    file_system_t *fs;
    vfs_mount_t *vfs;
    
    fs = kMalloc(sizeof(file_system_t));
    
    fs->mount = kMalloc(sizeof(vfs_mount_t));
    
    fs->mount->mnt_root = kMalloc(sizeof(dentry_t));
    fs->mount->mnt_root->d_name = kMalloc(strlen(mountPoint));
    strcpy(fs->mount->mnt_root->d_name,mountPoint);
    
    //See if the filesystem being mounted is the root of the filesystem
    if (strncmp(mountPoint,"/",1024)==0)
        fs->mount->mnt_root->d_parent = (dentry_t*)DENTRY_ROOT;
    else
        panic("Mounting filesystem as non-root ... this is not yet supported");
    
    fs->fops = kMalloc(sizeof(fileops_t));
    memcpy(fs->fops, fops, sizeof(fileops_t));
   
    return fs;
}

void* fs_openFile(char* path, const char* mode)
{
    void* handle;
    dllist_t* list;
    file_t *file;
    
    list = kMalloc(sizeof(dllist_t));
    file = kMalloc(sizeof(file_t));
    file->f_path = kMalloc(1024);
    file->fops = kMalloc(sizeof(file_operations_t));
    //identify the fs that the path is on
    
    //call the fs's open method
    handle = rootFs->fops->open(path, mode);

    strncpy(file->f_path, path, 1024);
    memcpy(file->fops, rootFs->fops, sizeof(file_operations_t));
    file->handle = handle;
    
    if (rootFs->files == NULL)
    {
        rootFs->files = kMalloc(sizeof(dllist_t));
        listInit(rootFs->files,file);
    }
    else
        listAdd(rootFs->files,list,file);
    return handle;
}

void * fs_readFile(void* file, void * buffer, int size, int length)
{
    dllist_t* list = listHead(rootFs->files);
    file_t* foundFile = NULL;
    
    while (foundFile==NULL)
    {
        if (((file_t*)list->payload)->handle==file)
            foundFile = (file_t*)list->payload;
        else
        {
            if (list->next==list)
                break;
            list=listNext(list);
        }
    }
    
    if (foundFile==NULL)
        panic("fs_readFile: file handle not found in fs->files");
    
    return foundFile->fops->read(buffer, size, length, foundFile->handle);
    
}