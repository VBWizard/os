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
#include "dllist.h"
#include <stdint.h>
    
#define STDIN_FILE 0
#define STDOUT_FILE 1
#define STDERR_FILE 2

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

#define DENTRY_ROOT 0xFFFFFFFF    
    
    typedef struct file file_t;
    typedef struct file_operations fileops_t;
    typedef struct inode inode_t;
    typedef struct dentry dentry_t;
    typedef struct file_operations file_operations_t;
    typedef struct vfsmount vfs_mount_t;
    typedef struct inode_operations inode_operations_t;
    typedef struct file_system file_system_t;
    
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

    typedef struct inode inode_t;
    
    struct dentry
    {
        char* d_name;
        struct inode* d_inode;
        dentry_t* d_parent;
    };
    
    struct inode_operations
    {
        int (*create) (inode_t *,dentry_t *);
        int (*mkdir) (inode_t *,dentry_t *);
        int (*rmdir) (inode_t *,dentry_t *);
        int (*mknod) (inode_t *,dentry_t);
        int (*rename) (inode_t *, dentry_t *,inode_t *, dentry_t *, unsigned int);
    };
    
    struct file_operations
    {
        
        //file_t* (*open) (char *filename, const char *mode);
        void* (*open) (char *filename, const char *mode); //using this temporarily for fat fs
        //int (*close) (file_t *);
        void (*close) (void *); //using this temporarily for fat fs
        //int (*seek) (file_t *, long offset, int whence);
        int (*seek) (void *f, long offset, int origin);
        //size_t (*read) (file_t *, char *, size_t, uint64_t *);
        size_t (*read) (void * buffer, int size, int length, void *f);
        //size_t (*write) (file_t *, const char *, size_t, uint64_t *);
        size_t (*write) (const void * data, int size, int count, void *f);
    };

    
    
    struct file
    {
        char* f_path;
        inode_t* f_inode;
        fileops_t* fops;
        void* handle;
    };


    struct file_system
    {
        vfs_mount_t *mount; 
        inode_operations_t* iops;
        file_operations_t* fops;
        dllist_t inode_list;
        dllist_t* files;
    };
    
    
    file_system_t* kRegisterFileSystem(char *mountPoint, const fileops_t *fops);
    void* fs_openFile(char* path, const char* mode);
    
#ifdef __cplusplus
}
#endif

#endif /* FS_H */

