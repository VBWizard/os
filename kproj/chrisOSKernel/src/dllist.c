/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "dllist.h"
#include "../../chrisOS/include/config.h"
#include "fs.h"
#include "alloc.h"

//Initialize a new list
dllist_t* listInit(dllist_t* firstItem, void* payload)
{
    firstItem->next=firstItem;
    firstItem->prev=firstItem;
    firstItem->payload=payload;
    return firstItem;
}

void* listAdd(dllist_t* list, dllist_t* item, void* payload)
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
    return list;
}

void printList(dllist_t* listHead, char* whence, dllist_t* item)
{
    dllist_t *itemT = listHead;
    
    printd(DEBUG_PROCESS, "%s: Start removing 0x%08x (%s)!\n", whence, item, ((file_t*)item->payload)->f_path);
    if (listHead==NULL)
    {
        printd(DEBUG_PROCESS, "%s: Listhead is NULL, list is empty\n", whence);
        return;
    }
        
    printd(DEBUG_PROCESS, "\t%s: item->prev=0x%08x, item=0x%08x, item->next=0x%08x\n", whence, itemT->prev, itemT, itemT->next);
    while (itemT->next != itemT) 
    {
        itemT=itemT->next;
        printd(DEBUG_PROCESS, "\t%s: item->prev=0x%08x, item=0x%08x, item->next=0x%08x\n", whence, itemT->prev, itemT, itemT->next);
    } 
    printd(DEBUG_PROCESS, "%s: DONE!\n", whence);
    
    
}

//Returns new listHead
dllist_t* listRemove(dllist_t* listHead, dllist_t* item)
{
    printList(listHead, "Before", item);
    dllist_t *listPrev = item->prev;
    dllist_t *listNext = item->next;
    
    if (listPrev == item && listNext == item)
    {
        listHead = NULL;
        goto listRemoveReturn;
    }
    
    if (listPrev != item)               //If there is a previous item
    {
        if (listNext != item)               //If there is a next item
        {                                       //Link the two!
            listNext->prev = listPrev;
            listPrev->next = listNext;
            goto listRemoveReturn;
        }
        else                                //If there is not a next item
        {
            listPrev->next = listPrev;          //Make the previous item the last
            goto listRemoveReturn;
        }
    }
    
    if (listNext != item)                   //If we've gotten here there is no previous item, so just fixup the next item to make it the first
    {
        listNext->prev = listNext;
        listHead = listNext;
    }
    
    listRemoveReturn:
    printList(listHead, "After", item);
    return listHead;
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

//TODO: UNTESTED
void listFree(dllist_t* theList)
{
    dllist_t *list=listHead(theList);
    
    do
    {
        freeI(list->payload);
        if (list->next!=list)
            list = list->next;
        else
            list=NULL;
    } while (list);
}