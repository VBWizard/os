/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   vfs_file.h
 * Author: yogi
 *
 * Created on November 29, 2022, 1:17 PM
 */

#ifndef VFS_H
#define VFS_H

#ifdef __cplusplus
extern "C" {
#endif
#include "fs.h"

#define VFS_MAX_OPEN_FILES 512
#define VFS_MAX_OPEN_DIRS 64

void vfs_add_to_open_list(filesystem_t *fs, eListType type, void *item);
bool vfs_remove_from_open_list(filesystem_t* fs, eListType type, void *item);
int vfs_close_files_for_process(process_t *process);

#ifdef __cplusplus
}
#endif

#endif /* VFS_H */

