/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   stdio.h
 * Author: yogi
 *
 * Created on April 9, 2017, 3:05 AM
 */

#ifndef STDIO_H
#define STDIO_H

#ifdef __cplusplus
extern "C" {
#endif
#include "dllist.h"
#include <stdint.h>    

#define STDIN_FILE 0
#define STDOUT_FILE 1
#define STDERR_FILE 2
    
    struct super_block
    {
        dllist_t            s_list;
        unsigned int        s_dev;  //12 bits major, 20 bits minor
        struct dentry*      s_root;
    };
    
    struct vfsmount 
    {
        struct dentry *mnt_root;        /* root of the mounted tree */
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
        const struct inode_operations   *i_op;
        struct vfsmount         i_vfsmount;
    };

    typedef struct inode inode_t;
    
    struct dentry
    {
        char* d_name;
        struct inode* d_inode;
        struct dentry* d_parent;
    };
    
    struct inode_operations
    {
        int (*create) (struct inode *,struct dentry *);
        int (*mkdir) (struct inode *,struct dentry *);
        int (*rmdir) (struct inode *,struct dentry *);
        int (*mknod) (struct inode *,struct dentry);
        int (*rename) (struct inode *, struct dentry *,struct inode *, struct dentry *, unsigned int);
    };
    
    typedef struct file file_t;

    typedef struct file_operations
    {
        size_t (*read) (struct file *, char *, size_t, uint64_t *);
        size_t (*write) (struct file *, const char *, size_t, uint64_t *);
    }file_operations_t;

        struct file
    {
        char* f_path;
        struct inode* f_inode;
        struct file_operations fops;
    };





#ifdef __cplusplus
}
#endif

#endif /* STDIO_H */

