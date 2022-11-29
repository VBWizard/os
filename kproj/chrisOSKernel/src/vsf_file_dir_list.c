/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "vfs.h"

extern filesystem_t *rootFs, *pipeFs, *procFs;

file_t *vfs_files;

//TODO: Debug this!
void *getListPtrAndMax(filesystem_t *fs, eListType type, int *maxItems)
{
    void *retVal;

    switch (type)
    {
        case LIST_FILE:
            retVal = fs->files;
            *maxItems = VFS_MAX_OPEN_FILES;
            break;
        case LIST_DIRECTORY:
            retVal = fs->dirs;
            *maxItems = VFS_MAX_OPEN_DIRS;
            break;
        default:
            //do nothing but log that we did nothing
            return;
        break;
    }
    return retVal;
}

void vfs_add_to_open_list(filesystem_t *fs, eListType type, void *item)
{
    uint32_t *listPtr;
    int currItem = 0;
    int maxItems = 0;

    //Populate our listPtr and maxItems variables
    listPtr = getListPtrAndMax(fs, type, &maxItems);

    //Look for the first free index in the array
    while (*listPtr && currItem<maxItems)
    {
        currItem++;
        listPtr++;
    }

    //Panic if we can't find a free entry to place our item in
    if (currItem>=maxItems)
        panic("vfs_add_to_open_list: No free %s, cannot add\n",type==LIST_FILE?"fs->files entries":"fs->dirs entries");
    
    //Add our item to the list
    *listPtr=item;

}

bool vfs_remove_from_open_list(filesystem_t* fs, eListType type, void *item)
{
    uint32_t *listPtr;
    int currItem = 0;
    int maxItems = 0;

    //Populate our listPtr and maxItems variables
    listPtr = getListPtrAndMax(fs, type, &maxItems);

    //While there is a list item, it doesn't match ours, and we haven't gone past the end of the list ... point to the next item in the list
    while (*listPtr != item && currItem < maxItems)
        listPtr++;

    if (!*listPtr || currItem++ >= maxItems)
        return false;

    //Add our item to the list
    *(uint32_t*)listPtr=NULL;
    return true;
}

int vfs_close_files_for_process(process_t *process)
{

    uint32_t *listPtr;
    int currItem = 0;
    int maxItems = 0;
    int closedItems = 0;

    //Process directories first

    //Populate our listPtr and maxItems variables
    listPtr = getListPtrAndMax(rootFs, LIST_DIRECTORY, &maxItems);

    while (*listPtr && currItem < maxItems)
    {
        directory_t *dir = *listPtr;
        if (dir->owner == process)
        {
            //vfs_remove_from_open_list(rootFs, LIST_DIRECTORY, dir);
            fs_close(dir);
            closedItems++;
        }
        currItem++;
        listPtr++;
    }

    //Then process files
    //Populate our listPtr and maxItems variables
    listPtr = getListPtrAndMax(rootFs, LIST_FILE, &maxItems);

    while (*listPtr && currItem < maxItems)
    {
        file_t *file = *listPtr;
        if (file->owner == process)
        {
            //vfs_remove_from_open_list(rootFs, LIST_DIRECTORY, file);
            fs_close(file);
            closedItems++;
        }
        currItem++;
        listPtr++;
    }
    return closedItems;
}
