/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   fs.h
 * Author: yogi
 *
 * Created on April 8, 2017, 3:06 AM
 */

#ifndef FS_H
#define FS_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "dllist.h"
#include "process.h"
    
#define STDIN_FILE 0
#define STDOUT_FILE 1
#define STDERR_FILE 2

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2
#define EOF (-1)
    
#define FS_BUFFERSIZE 1048576
#define FS_FILE_COPYBUFFER_SIZE 65535
#define DENTRY_ROOT 0xFFFFFFFF    

    typedef enum
    {
        LIST_DIRECTORY,
        LIST_FILE
    } eListType;
    
    typedef enum
    {
        FILETYPE_FILE,
        FILETYPE_PIPE,
        FILETYPE_PROCFILE
    } eFileType;
    
    typedef struct file file_t;
    typedef struct directory directory_t;
    typedef struct direntry dirent_t;
    typedef struct dir_operations dirops_t;
    typedef struct file_operations fileops_t;
    typedef struct inode inode_t;
    typedef struct dentry dentry_t;
    typedef struct file_operations file_operations_t;
    typedef struct vfsmount vfs_mount_t;
    typedef struct inode_operations inode_operations_t;
    typedef struct file_system filesystem_t;
    typedef struct inode inode_t;
    
    struct super_block
    {
        dllist_t            s_list;
        unsigned int        s_dev;  //12 bits major, 20 bits minor
        dentry_t*      s_root;
    };
    
    struct vfsmount 
    {
        dentry_t *mnt_root;        /* root of the mounted tree */
        struct super_block *mnt_sb;     /* pointer to superblock */
        int mnt_flags;
    };

    struct inode
    {
        unsigned int            i_dev;          //12 bits major, 20 bits minor
        unsigned short          i_mode;
        unsigned short          i_opflags;
        unsigned int            i_uid;
        unsigned int            i_gid;
        unsigned int            i_flags;
        const inode_operations_t   *i_op;
        struct vfsmount         *i_vfsmount;
    };

    struct inode_operations
    {
        int (*create) (inode_t *,dentry_t *);
        int (*mkdir) (inode_t *,dentry_t *);
        int (*rmdir) (inode_t *,dentry_t *);
        int (*mknod) (inode_t *,dentry_t);
        int (*rename) (inode_t *, dentry_t *,inode_t *, dentry_t *, unsigned int);
    };
    
    struct dentry
    {
        char* d_name;
        struct inode* d_inode;
        dentry_t* d_parent;
    };
    
    struct file
    {
        eFileType filetype;
        char* f_path;
        inode_t* f_inode;
        fileops_t* fops;
        void* handle;
        void *pipe, *pipeContent, **pipeContentPtr;
        void *copyBuffer;
        uint32_t verification;
        void *owner;
    };

    struct file_operations
    {
        
        //file_t* (*open) (char *filename, const char *mode);
        void* (*open) (void *file, const char *mode); //using this temporarily for fat fs
        //int (*close) (file_t *);
        void (*close) (void *); //using this temporarily for fat fs
        //int (*seek) (file_t *, long offset, int whence);
        int (*seek) (void *f, long offset, int origin);
        //size_t (*read) (file_t *, char *, size_t, uint64_t *);
        size_t (*read) (void * buffer, int size, int length, void *f);
        //size_t (*write) (file_t *, const char *, size_t, uint64_t *);
        long (*tell) (void *f);
        size_t (*write) (const void * data, int size, int count, void *f);
        int (*flush) (void *f);
        int (*delete) (const char *filename);
    };

    struct dir_operations
    {
        void* (*open) (const char* path, void* dir);
        int (*read) (void *dir, dirent_t *entry);
        int (*close) (void *dir);
    };
    
    struct directory
    {
        char* f_path;
        inode_t* f_inode;
        dirops_t* dops;
        void* handle;
        dllist_t listEntry;
    };
    
    struct direntry
    {
        char                      filename[260];
        uint8_t                   is_dir;
        uint32_t                  cluster;
        uint32_t                  size;
        uint16_t                  access_date;
        uint16_t                  write_time;
        uint16_t                  write_date;
        uint16_t                  create_date;
        uint16_t                  create_time;
    } __attribute((packed));

    struct file_system
    {
        vfs_mount_t *mount; 
        inode_operations_t* iops;
        file_operations_t* fops;
        dirops_t* dops;
        dllist_t inode_list;
        dllist_t* files;
        dllist_t* dirs;
    };
    
    struct sfstat
    {
        uint32_t     st_size;        /* Total size, in bytes */
        uint32_t  st_lastmod;
    };
    
    typedef struct sfstat fstat_t;

    
    filesystem_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops, const dirops_t * dops);
    void* fs_open(char* path, const char* mode);
    int fs_read(process_t* process, void* file, void * buffer, int size, int length);
    int fs_write(process_t* process, void* file, void * buffer, int size, int length);
    int fs_seek(void* file, long offset, int whence);
    long fs_tell(void* file);
    void fs_close(void* file);
    int fs_unlink(char *filename);
    int fs_stat(process_t *process, void *path, fstat_t *buffer);
    int getDirEntries(void *process, char* path, dirent_t *buffer, int bufferCount);
    int parsePath(const char *inPath, char *outPath, char *outFilename, char** outPathTokens, int outPathTokensArrayCount);
#ifdef __cplusplus
}
#endif

#endif /* FS_H */

