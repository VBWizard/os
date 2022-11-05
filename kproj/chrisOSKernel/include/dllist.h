/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   list.h
 * Author: yogi
 *
 * Created on March 25, 2017, 12:00 PM
 */

#ifndef LIST_H
#define LIST_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>
#include <stdbool.h>
    
    typedef struct slisthead
    {
        struct slisthead *next, *prev;          //4+4+4
        void *payload;
    } dllist_t;

    dllist_t* listInit(dllist_t* firstItem, void* payload);
    void* listAdd(dllist_t* list, dllist_t* item, void* payload);
    dllist_t* listRemove(dllist_t* listHead, dllist_t* item);
    void* listPrev(dllist_t* list);
    void* listNext(dllist_t* list);
    void* listHead(dllist_t* list);
    void* listTail(dllist_t* list);

#ifdef __cplusplus
}
#endif

#endif /* LIST_H */

