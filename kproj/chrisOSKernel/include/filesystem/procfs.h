/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   procfs.h
 * Author: yogi
 *
 * Created on February 10, 2019, 8:52 PM
 */

#ifndef PROCFS_H
#define PROCFS_H
#include "fs.h"

#define PROCFS_DIR_MAXFILES 50
#define PROCFS_DIR_MAXDIRS 100

    typedef struct sprocdir procdir_t;
    typedef struct sprocfile procfile_t;
    typedef struct spfile pfile_t;
    typedef struct spdir pdir_t;
    
     struct sprocfile
    {
        char filename[128];
        procdir_t *parentDir;
        size_t (*size) (procfile_t *file);
    } ;
    
    struct sprocdir
    {
        char dirname[128];
        int size;
        procdir_t *parentDir;
        procfile_t files[PROCFS_DIR_MAXFILES];
        struct sprocdir *dirs;
    } ;

    struct spfile
    {
        procfile_t *procfile;
        fileops_t* fops;
        char *content;
        void* handle;
        void *owner;
        int offset;
    };

    struct spdir
    {
        procdir_t *procdir;
        dirops_t* dops;
        void *handle;
        int offset;
        bool returningFileSet;
    };
    
    filesystem_t *initprocfs();
    void buildProcfs();
    void *procOpenFile(void *file, const char *mode);
    void procCloseFile(void *file);
    size_t procReadFile(void *buffer, int size, int length, void *file);
    size_t procWriteFile(const void *buffer, int size, int count, void *file);
    int procSeekFile(void *f, long offset, int origin);
    void *procDirOpen(const char* path, void* dir);
    int procDirClose(void *dir);
    int procDirRead(void *dir, dirent_t *entry);
    size_t procFileSize(procfile_t *file);
    void getMemInfo(char *buffer, int buffersize);
    procdir_t procRootDir;
    int procRootDirFilePtr, procRootDirDirPtr;
    procfile_t *procFileMemInfo;
    dirops_t procDirOps;
    file_operations_t procFOps;
    dirops_t procDOps;
    char **pathTokens;

    
#ifdef __cplusplus
extern "C" {
#endif




#ifdef __cplusplus
}
#endif

#endif /* PROCFS_H */

