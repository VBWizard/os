#include <stdbool.h>
#include "chrisos.h"
#include "io.h"
#include "kbd.h"
#include "printf.h"
#include "pci/pci.h"
#include "pci/pci_reg.h"
#include "pci_c_header.h"
#include "strings.h"
#include "utility.h"
#include "memory.h"

int currBus=0;
int currSlot=0;
int currFunc=0;
extern uint8_t kPCIDeviceCount;
extern uint8_t kPCIBridgeCount;
extern uint8_t kPCIFunctionCount;
extern uint8_t kPCIBusCount;
extern struct pci_device_t* kPCIDeviceHeaders;
extern struct pci_bridge_t* kPCIBridgeHeaders;
extern struct pci_device_t* kPCIDeviceFunctions;
extern uint32_t kDebugLevel;

void printPCIConfig()
{
    char buffer[150];
    int totalCnt=0;
    
    printk("PCI Configuration table: (%u objects)\n", kPCIDeviceCount+kPCIBridgeCount);
    puts("Devices:\n");
    printk("Bu:Sl:Fu\tIRQ/Pin VEND/DEVC CLS/SUB SUBN PBN/SBN\tDeviceName\n");
    for (int cnt=0;cnt<kPCIDeviceCount;cnt++)
    {          //BU:Sl:Fu        IRQ / Pin  VEND/DEVC   CLS/SUB    SUBN   PBN   SBN
        printk("%02X:%02X:%02X\t%02X / %02X %04X/%04X  %02X/%02X \t\t\t",kPCIDeviceHeaders[cnt].busNo, kPCIDeviceHeaders[cnt].deviceNo, kPCIDeviceHeaders[cnt].funcNo, 
                kPCIDeviceHeaders[cnt].interrupt_line, kPCIDeviceHeaders[cnt].interrupt_pin, kPCIDeviceHeaders[cnt].vendor, kPCIDeviceHeaders[cnt].device, kPCIDeviceHeaders[cnt].class, 
                kPCIDeviceHeaders[cnt].subClass);
        //getVendorLongName(kPCIDeviceHeaders[cnt].vendor, buffer);
        //printk("%s",buffer);
        getDeviceName(kPCIDeviceHeaders[cnt].vendor, kPCIDeviceHeaders[cnt].device, buffer);
        strleft(buffer,28);
        printk("%s\n",buffer);
        totalCnt++;
        if (totalCnt>0 && ((totalCnt+4)%cursorGetMaxY())==0)
            pauseDisplay(false);
    }
    puts("Bridges:\n");
    for (int cnt=0;cnt<kPCIBridgeCount;cnt++)
    {          //BU:Sl:Fu        IRQ / Pin  VEND/DEVC   CLS/SUB    SUBN    PBN/  SBN
        printk("%02X:%02X:%02X\t%02X / %02X %04X/%04X  %02X/%02X   %02X\t  %02X/%02X\t",
                kPCIBridgeHeaders[cnt].busNo, kPCIBridgeHeaders[cnt].deviceNo, kPCIBridgeHeaders[cnt].funcNo, 
                kPCIBridgeHeaders[cnt].interrupt_line, kPCIBridgeHeaders[cnt].interrupt_pin, 
                kPCIBridgeHeaders[cnt].vendor, kPCIBridgeHeaders[cnt].device, 
                kPCIBridgeHeaders[cnt].class, kPCIBridgeHeaders[cnt].subClass,
                kPCIBridgeHeaders[cnt].subordinateBusNum, kPCIBridgeHeaders[cnt].primaryBusNum, kPCIBridgeHeaders->secondaryBusNum);
        //getVendorLongName(kPCIDeviceHeaders[cnt].vendor, buffer);
        //strleft(buffer,10);
        //printk("%s",buffer);
//        strleft(buffer,20);
        getDeviceName(kPCIBridgeHeaders[cnt].vendor, kPCIBridgeHeaders[cnt].device, buffer);
        strleft(buffer,28);
        printk("%s\n",buffer);
        totalCnt++;
        if (totalCnt>0 && ((totalCnt+4)%cursorGetMaxY())==0)
            pauseDisplay(false);
    }   
    puts("Functions:\n");
    for (int cnt=0;cnt<kPCIFunctionCount;cnt++)
    {          //BU:Sl:Fu        IRQ / Pin  VEND/DEVC   CLS/SUB    SUBN   PBN   SBN
//        if (kPCIDeviceFunctions[cnt].funcNo==0)
        {
            printk("%02X:%02X:%02X\t%02X / %02X %04X/%04X  %02X/%02X \t\t\t",kPCIDeviceFunctions[cnt].busNo, kPCIDeviceFunctions[cnt].deviceNo, kPCIDeviceFunctions[cnt].funcNo, 
                    kPCIDeviceFunctions[cnt].interrupt_line, kPCIDeviceFunctions[cnt].interrupt_pin, kPCIDeviceFunctions[cnt].vendor, kPCIDeviceFunctions[cnt].device, kPCIDeviceFunctions[cnt].class, 
                    kPCIDeviceFunctions[cnt].subClass);
            //getVendorLongName(kPCIDeviceFunctions[cnt].vendor, buffer);
            //printk("%s",buffer);
            getDeviceName(kPCIDeviceFunctions[cnt].vendor, kPCIDeviceFunctions[cnt].device, buffer);
            strleft(buffer,28);
            printk("%s\n",buffer);
            totalCnt++;
        if (totalCnt>0 && ((totalCnt+4)%cursorGetMaxY())==0)
            pauseDisplay(false);
        }
    }
}

//struct pci_device_id* pci_deviceList = (struct pci_device_id*)PCI_DEVICE_LIST_ADDRESS;
  uint16_t pciConfigReadWord (uint8_t bus, uint8_t slot,
                             uint8_t func, uint8_t offset)
 {
    uint32_t address;
    uint32_t lbus  = (uint32_t)bus;
    uint32_t lslot = (uint32_t)slot;
    uint32_t lfunc = (uint32_t)func;
    uint16_t tmp = 0;
    /* create configuration address as per Figure 1 */
    address = (uint32_t)((lbus << 16) | (lslot << 11) |
              (lfunc << 8) | (offset & 0xfc) | ((uint32_t)0x80000000));
 
    /* write out the address */
    outl (0xCF8, address);
    /* read in the data */
    /* (offset & 2) * 8) = 0 will choose the first word of the 32 bits register */
    tmp = (uint16_t)((inl (0xCFC) >> ((offset & 2) * 8)) & 0xffff);
    return (tmp);
 }

 uint32_t pciConfigReadDWord (uint8_t bus, uint8_t slot,
                             uint8_t func, uint8_t offset)
 {
    uint32_t address;
    uint32_t lbus  = (uint32_t)bus;
    uint32_t lslot = (uint32_t)slot;
    uint32_t lfunc = (uint32_t)func;
    uint32_t num;
    
    /* create configuration address as per Figure 1 */
    address = (uint32_t)((lbus << 16) | (lslot << 11) |
              (lfunc << 8) | (offset & 0xfc) | ((uint32_t)0x80000000));
 
    /* write out the address */
    outl (0xCF8, address);
    /* read in the data */
    /* (offset & 2) * 8) = 0 will choose the first word of the 32 bits register */
    num = inl (0xCFC);
    //return ((num >> 24)) | ((num & 0x0000FF000) << 8) | ((num & 0x00FF0000)>>8) | ((num << 24));
    return num;
 }

 void pciQueryBDF(uint8_t bus, uint8_t device, uint8_t function)
 {
     struct pci_device_t header;
     struct pci_bridge_t bridge;

     printk("Retrieving info for PCI address %02X:%02X:%02X\n",bus,device,function);
    if (!getDeviceHeader(&header, bus, device, function))
    {
        printk("No device at that address\n");
        return;
    }
    if (header.vendor==0xFFFF)
    {
        printk("Nothing found at %02X:%02X:%02X\n",bus,device,function);
        return;
    }
     if (header.class==0x06)
     {
         getBridgeHeader(&bridge,bus,device,function);
         printPCIBridgeHeader(&bridge);
     }
     else
         printPCIHeader(&header);
 }
 
 /*
      uint32_t vendor, device;      // Vendor and device ID or PCI_ANY_ID
    uint32_t subvendor, subdevice;  // Subsystem ID's or PCI_ANY_ID 
    uint32_t class, class_mask;     // (class,subclass,prog-if) triplet 
    unsigned long driver_data;      // Data private to the driver 
*/
void getVendorLongName(uint32_t vendorID, char* vendorLongName)
{
    for (unsigned cnt=0; cnt<PCI_VENTABLE_LEN;cnt++)
        if (PciVenTable[cnt].VenId == (uint16_t)vendorID)
        {
            strcpy(vendorLongName, PciVenTable[cnt].VenFull);
            return;
        }
    strcpy(vendorLongName,"Not Found");
}

void getDeviceName(uint32_t vendorID, uint32_t deviceID, char* deviceName)
{
    for (int cnt=0; cnt<7000;cnt++)
        if (PciDevTable[cnt].VenId == vendorID && PciDevTable[cnt].DevId==deviceID)
        {
            strcpy(deviceName, PciDevTable[cnt].ChipDesc);
            return;
        }
    strcpy(deviceName,"Not Found");
}

char* getDeviceNameP(struct pci_device_t* node, char* buffer)
{
    getDeviceName(node->vendor, node->device, buffer);
    return buffer;
}

void getClass(uint8_t class, uint8_t subClass, char BaseDesc[], char SubDesc[] , char ProgDesc[])
{
    static char notFound[50] = "Not found\0";
    for (unsigned cnt=0;cnt<PCI_DEVTABLE_LEN;cnt++)
    {
        if (PciClassCodeTable[cnt].BaseClass==class && PciClassCodeTable[cnt].SubClass==subClass /*&& PciClassCodeTable[cnt].ProgIf==prog*/ )
        {
            strcpy(BaseDesc,PciClassCodeTable[cnt].BaseDesc);
            strcpy(SubDesc,PciClassCodeTable[cnt].SubDesc);
            strcpy(ProgDesc,PciClassCodeTable[cnt].ProgDesc);
            return;
        }
    }
    strcpy(BaseDesc,notFound);
    strcpy(SubDesc,notFound);
    strcpy(ProgDesc,notFound);
    return;
}

bool getDeviceHeader(struct pci_device_t* node, uint8_t bus, uint8_t slot, uint8_t func)
{
    uint32_t value;

    printd(DEBUG_PCI_DISCOVERY,"Building device header for %u:%u:%u\n",bus,slot,func);
    //Get the entire header
    for (int cnt=0;cnt<16;cnt++)
    {
        value=pciConfigReadDWord(bus, slot, func, cnt*4);
        if (value==0xFFFFFFFF)
            return false;
        switch(cnt)
        {
            case 0:
                node->vendor=value;
                node->device=value >> 16;
                break;
            case 1:
                node->command=value&0xFFFF;
                node->status=value>>16&0xFFFF;
                break;
            case 2:
                node->class=value >> 24;
                node->subClass=(value & 0x00FF0000) >> 16;
                node->prog=(value & 0x0000FF00) >> 8;
                break;
            case 3:
                node->headerType=(value >> 16) & 0x7f;
                node->multiFunction=(value & 0x00800000)==0x00800000;
                node->cacheSize=value&0xFF;
                node->latencyTimer=value>>8;
                break;
            case 4: case 5: case 6: case 7: case 8: case 9:
                node->baseAdd[cnt+1-5]=value;
                break;
            case 11:
                node->subdevice=value >> 16;
                node->subvendor=value & 0xFFFF;
                break;
            case 12:
                node->expROMAddress=value;
                break;
            case 13:
                node->caps = value & 0xFF;
                break;
            case 15:
                node->interrupt_line=value&0xFF;
                node->interrupt_pin=(value >> 8)&0xFF;
                break;
        }
    }
    node->busNo=bus;
    node->deviceNo=slot;
    node->funcNo=func;
    return true;
}

bool getBridgeHeader(struct pci_bridge_t* node, uint8_t bus, uint8_t slot, uint8_t func)
{
    uint32_t value;

    printd(DEBUG_PCI_DISCOVERY,"Building bridge header for %u:%u:%u\n",bus,slot,func);
    //Get the entire header
    for (int cnt=0;cnt<14;cnt++)
    {
        value=pciConfigReadDWord(bus, slot, func, cnt*4);
        if (value==0xFFFFFFFF)
            return false;
        switch(cnt)
        {
            case 0:
                node->vendor=value;
                node->device=value >> 16;
                break;
            case 1:
                node->command=value&0xFFFF;
                node->status=value>>16&0xFFFF;
                break;
            case 2:
                node->class=value >> 24;
                node->subClass=(value & 0x00FF0000) >> 16;
                node->prog=(value & 0x0000FF00) >> 8;
                break;
            case 3:
                node->headerType=(value >> 16) & 0x7f;
                node->multiFunction=(value & 0x00800000)==0x00800000;
                node->cacheSize=value&0xFF;
                node->latencyTimer=value>>8;
                break;
            case 4: 
                node->baseAdd[0]=value;
                break;
            case 5:
                node->baseAdd[1]=value;
                break;
            case 6:
                node->secLatencyTimer=(value>>24);
                node->subordinateBusNum=(value>>16) & 0xFF;
                node->secondaryBusNum=(value >> 8) & 0xFF;
                node->primaryBusNum=value & 0xFF;
                //printk("pr:se:su %02X:%02X:%02X\n", node->primaryBusNum, node->secondaryBusNum, node->subordinateBusNum);
                break;
            case 7:
                node->secStatus=(value>>16);
                node->ioLimit=(value>>8)&0xFF;
                node->ioBase=value&0xFF;
                break;
            case 8:
                node->memoryLimit=value>>16;
                node->memoryBase=value;
                break;
            case 9:
                node->prefMemLimit=value>>16;
                node->prefMemBase=value&0xFFFF;
                break;
            case 10:
                node->prefMemLimit|=value<<16;
                break;
            case 11:
                node->prefMemBase|=value<<16;
                break;
            case 12:
                node->ioLimit|=(value&0xFFFF0000)>>8;
                node->ioBase|=value&0xFFFF<<8;
                break;
            case 13:
                node->caps = value & 0xFF;
                break;
            case 14:
                node->expROMAddress=value;
                break;
            case 15:
                node->interrupt_line=value&0xFF;
                node->interrupt_pin=(value >> 8)&0xFF;
                node->bridgeControl=(value>>16)&0xFFFF;
                break;

        }
    }
    node->busNo=bus;
    node->deviceNo=slot;
    node->funcNo=func;
    return true;
}
void printPCIBridgeHeader(struct pci_bridge_t* node)
{          //BU:Sl:Fu        IRQ / Pin  VEND/DEVC   CLS/SUB    SUBN    PBN/  SBN
    char baseClassDesc[500], subClassDesc[500], progDesc[500];
    char tempString[150];
    getClass(node->class, node->subClass, baseClassDesc, subClassDesc, progDesc);
    printk("Bridge:\n");
    printk("Bu:Sl:Fu\tIRQ/Pin VEND/DEVC CLS/SUB SUBN PBN/SBN\tDeviceName\n");
    printk("%02X:%02X:%02X\t%02X / %02X %04X/%04X  %02X/%02X   %02X\t  %02X/%02X\n",
            node->busNo, node->deviceNo, node->funcNo, 
            node->interrupt_line, node->interrupt_pin, 
            node->vendor, node->device, 
            node->class, node->subClass,
            node->subordinateBusNum, node->primaryBusNum, kPCIBridgeHeaders->secondaryBusNum);

    getVendorLongName(node->vendor, tempString);
    printk("Vendor: %s\t",tempString);
    getDeviceName(node->vendor, node->device, tempString);
    printk("Device: %s\n",tempString);
    printk("Class: %s\tSubClass: %s\nProg: %s\n",baseClassDesc,subClassDesc,progDesc);
    printk("Base addresses:\n");
    for (int cnt=0;cnt<2;cnt++)
        printk("\tBAR%u: 0x%08X\n", cnt, node->baseAdd[cnt]);
    printk("IO Base: 0x%04X\tIO Limit: 0x%04X\n",node->ioBase,node->ioLimit);
    printk("Command: 0x%04X, Status: 0x%04X\n",node->command,node->status);
}   

void printPCIHeader(struct pci_device_t* node)
{
    char baseClassDesc[500], subClassDesc[500], progDesc[500];
    char tempString[150];
    getClass(node->class, node->subClass, baseClassDesc, subClassDesc, progDesc);
//    printk("%04X:%04X:%04X\t0x%08X %s\t%02X:%02X:%02X\t%s\n", 
//        currBus, currSlot, currFunc, node->headerType, node->multiFunction?"yes":"no ", 
//        node->class, node->subClass, node->prog, subClassDesc );
    printk("Device:\n");
    printk("Bu:Sl:Fu\tIRQ/Pin VEND/DEVC CLS/SUB SUBN PBN/SBN\tDeviceName\n");
    printk("%02X:%02X:%02X\t%02X / %02X %04X/%04X  %02X/%02X \t\t\t\n",node->busNo, node->deviceNo, node->funcNo, 
                node->interrupt_line, node->interrupt_pin, node->vendor, node->device, node->class, 
                node->subClass);
    getVendorLongName(node->vendor, tempString);
    printk("Vendor: %s\t",tempString);
    getDeviceName(node->vendor, node->device, tempString);
    printk("Device: %s\n",tempString);
    printk("Class: %s\tSubClass: %s\nProg: %s\n",baseClassDesc,subClassDesc,progDesc);
    printk("Base addresses:\n");
    for (int cnt=0;cnt<6;cnt++)
        printk("\tBAR%u: 0x%08X\n", cnt, node->baseAdd[cnt]);
    printk("Subsystem: %04X\tSubsys Vendor: %04X\n",node->subdevice,node->subvendor);
    printk("Command: 0x%04X, Status: 0x%04X\n",node->command,node->status);
    printk("Interrupt Pin/Line: 0x%04X/0x%04X\n",node->interrupt_pin,node->interrupt_line);
}
void addFunction(struct pci_device_t* node)
{
    printd(DEBUG_PCI_DISCOVERY,"\t\t\t\tFound function: deviceID: %04X, vendorID: %04X, class: %04X, subclass %04X:%04X\n", node->device, node->vendor, node->class, node->subClass);
    memcpy(&kPCIDeviceFunctions[kPCIFunctionCount++],node,sizeof(struct pci_bridge_t));
    printd(DEBUG_PCI_DISCOVERY,"\t\t\t\tFunction entry created\n");
}
void addBridge(struct pci_device_t* node, uint8_t bus, uint8_t device, uint8_t function)
{
    struct pci_device_t newNode;
    struct pci_bridge_t bridge;
    //int lastSubBridgeNum=0;
    getBridgeHeader(&bridge, bus, device, function);
    if (bridge.vendor==0xFFFF)
        return;
    //         bridge.busNo=bus;bridge.deviceNo=device;bridge.funcNo=function;
    printd(DEBUG_PCI_DISCOVERY,"\t\t\tFound bridge on %02X:%02X:%02X,Cls#%02XpBus#%02X,sBus#%02X,suBus# %02X,MF=%u\n",bus, device, function, bridge.class, bridge.primaryBusNum, bridge.secondaryBusNum, bridge.subordinateBusNum, bridge.multiFunction);
    printd(DEBUG_PCI_DISCOVERY,"\t\t\tdeviceID: %04X, vendorID: %04X, class: %04X, subclass %04X:%04X\n", bridge.device, bridge.vendor, bridge.class, bridge.subClass);
    memcpy(&kPCIBridgeHeaders[kPCIBridgeCount++],&bridge,sizeof(struct pci_bridge_t));
    memcpy(&newNode,node,sizeof(struct pci_device_t));
    printd(DEBUG_PCI_DISCOVERY,"\t\t\tbridge entry created\n");
#ifndef DEBUG_NONE
#endif
//    if ( (bridge.secondaryBusNum>0 && bridge.secondaryBusNum != lastSubBridgeNum) ||
//            (bridge.subordinateBusNum>0))
    {
//        lastSubBridgeNum=bridge.secondaryBusNum;
//    #ifndef DEBUG_NONE
//        printd(DEBUG_PCI_DISCOVERY,"secBusNum=%02X\n", bridge.secondaryBusNum);
//    #endif
//       kPCIBusCount++;
//       checkBus(&newNode, bridge.secondaryBusNum);
//#ifndef DEBUG_NONE
//       printd(DEBUG_PCI_DISCOVERY,"Done checking bus %02X\n",bridge.secondaryBusNum);
//#endif
    }
}

void checkFunctions(uint8_t bus, uint8_t device) {
    struct pci_device_t funcDevice;

    for (int function=0;function<8;function++)
    {
        getDeviceHeader(&funcDevice, bus, device, function);
        if (funcDevice.vendor!=0xFFFF)
        {
            funcDevice.busNo=bus;
            funcDevice.deviceNo=device;
            funcDevice.funcNo=function;
            addFunction(&funcDevice);
        }
    }

 }

void addDevice(struct pci_device_t* node)
{
#ifndef DEBUG_NONE
    printd(DEBUG_PCI_DISCOVERY,"\tFound device #%u on %02X:%02X:0, Ven# %04X Dev# %04X Cls# %02X MF=%u\n",kPCIDeviceCount, node->busNo, node->deviceNo, node->vendor, node->device, node->class, node->multiFunction);
#endif
    memcpy(&kPCIDeviceHeaders[kPCIDeviceCount++],node,sizeof(struct pci_device_t));
    printd(DEBUG_PCI_DISCOVERY,"\tdevice entry created\n");
}

bool checkDevice(struct pci_device_t* node, uint8_t bus, uint8_t device)
{
    int func=0;
    struct pci_device_t newNode;

    memcpy(&newNode,node,sizeof(struct pci_device_t));
    if (getDeviceHeader(&newNode, bus, device, 0))
    {
        if (newNode.class!=6)
        {
            addDevice(&newNode);
        }
        else
        {
            addBridge(&newNode, bus, device,func);
        }
#ifndef DEBUG_NONE
        printd(DEBUG_PCI_DISCOVERY,"\tChecking functions\n",device);
#endif
        checkFunctions(bus, device);
        return true;
    }
    return false;
}

void checkBus(struct pci_device_t* node, uint8_t bus) {
 uint8_t device;

#ifndef DEBUG_NONE
    printd(DEBUG_PCI_DISCOVERY,"\n");
    printd(DEBUG_PCI_DISCOVERY,"Checking bus %02X\n", bus);
#endif
//    printk("\n");
//    printk("Checking bus %02X\n", bus);
    for(device = 0; device < 32; device++) {
     {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PCI_DISCOVERY) == DEBUG_PCI_DISCOVERY)
        {
            //waitForKeyboardKey();
        }
#endif
        checkDevice(node, bus, device);
     }
 }
}
    
 void pciInitialize()
 {
    //Iterate Busses/Slots
     struct pci_device_t device, funcDevice;
     uint16_t prevDev=0,prevBus=0;

     kPCIDeviceCount=kPCIBridgeCount=kPCIFunctionCount=kPCIBusCount=0;
     printd(DEBUG_PCI_DISCOVERY,"Iterating the PCI busses ...\n");
     for (currBus=0;currBus<50;currBus++)
     {
         for (currSlot=0;currSlot<32;currSlot++)
         {
            //if device found print it
            currFunc=0;
            prevDev=0;
            printd(DEBUG_PCI_DISCOVERY,"Current bus=%u, slot=%u\n",currBus,currSlot);
            if (getDeviceHeader(&device, currBus, currSlot, currFunc)==true)
            {
                if (prevBus!=currBus)
                {
                    prevBus=currBus;
                    kPCIBusCount++;
                }
                //printPCIHeader(&device);
                if (device.class==0x06)
                {
                    addBridge(&device, currBus, currSlot, currFunc);
                }
                else
                    addDevice(&device);
  //if found device is multi-function, iterate all of the functions
                for (currFunc=0;currFunc<8;currFunc++)
                {
                    //printd(DEBUG_PCI_DISCOVERY,"Current function=%u\n",currFunc);
                    getDeviceHeader(&funcDevice, currBus, currSlot, currFunc);
                    if (funcDevice.vendor!=0xFFFF)
                        if (funcDevice.device != device.device && funcDevice.device != prevDev)
                        {
                            //printk("funcDevice=%X, device=%X, prevDev=%X\n",funcDevice.device, device.device, prevDev);
                            prevDev=funcDevice.device;
                            if (funcDevice.class == 0x06)
                                addBridge(&funcDevice, currBus, currSlot, currFunc);
                            else
                                addFunction(&funcDevice);
                        }
                    }
            }
 
        }
     }
 }