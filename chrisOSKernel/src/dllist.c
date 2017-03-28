/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "dllist.h"

//Initialize a new list
dllist_t* listInit(dllist_t* firstItem, void* payload)
{
    firstItem->next=firstItem;
    firstItem->prev=firstItem;
    return firstItem;
    firstItem->payload=payload;
}

void listAdd(dllist_t* list, dllist_t* item, void* payload)
{
    
    while (list->next!=list)
        list=list->next;
    if (list==NULL)
        panic("dllist_t-listAdd: Error, list is null\n");
    if (list==NULL)
        panic("dllist_t-listAdd: Error, item is null\n");
    item->prev=list;
    item->next=item;
    list->next=item;
    item->payload=payload;
}
void listRemove(dllist_t* item)
{
    dllist_t *prevItem=item->prev,
               *nextItem=item->next;
    
    if (prevItem->next!=prevItem && item->next!=item)
        prevItem->next=item->next;
    else
        prevItem->next=prevItem;
    if (nextItem->prev!=nextItem && item->prev!=item)
        nextItem->prev=item->prev;
    else
        nextItem->prev=nextItem;
    item->next=item->prev=item;

}

void* listNext(dllist_t* list)
{
    if(list->next==list)
        return list;
    else
        return list->next;
}

void* listPrev(dllist_t* list)
{
    if(list->prev==list)
        return list;
    else
        return list->prev;
}

void* listHead(dllist_t* list)
{
    while (list->prev!=list)
        list=list->prev;
    return list;
}

void* listTail(dllist_t* list)
{
    while (list->prev!=list)
        list=list->prev;
    return list;
}