/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "device.h"
#include "kmalloc.h"

void deviceRegister(device_t* dev)
{
    if (kDevList==NULL)
    {
        kDevList=kMalloc(sizeof(dllist_t));
        listInit(kDevList,dev);
        kDevList->payload=dev;
    }
    else
        listAdd(kDevList,&dev->listItem,dev);
}

//NOTE: Have to fix list functionality .... its broken!
//NOTE: Caller should free the dev when they are done with it
/*void deviceUnregister(device_t* dev)
{
    while (kDevList->next!=kDevList)
    {
        device_t* lDev=(device_t*)kDevList->payload;
        if (lDev->node_id==dev->node_id)
            listRemove(kDevList);
        else
            panic("deviceUnregister: Could not find device to unregister (0x%16X) node_id=",dev,dev->node_id);
        
    }
}
*/