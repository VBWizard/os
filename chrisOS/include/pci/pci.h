/* 
 * File:   pci.h
 * Author: yogi
 *
 * Created on May 7, 2016, 11:01 PM
 */

#ifndef PCI_H
#define	PCI_H
#include <stdbool.h> /* C doesn't have booleans by default. */
#include <stdint.h>
#include <stddef.h>

#define PCI_CONFIG_ADDRESS 0x0CF8           //access mechanism 2, 8 bit port
#define PCI_FORWARDING_REGISTER 0x0CFA      //8-bit port (bus number))
#define PCI_CONFIG_DATA 0x0CFC
#define PCI_IO_PORT_BASE 0xC000
#define PCI_IO_PORT_COUNT 0xFFF
/*
 * The PCI interface treats multi-function devices as independent
 * devices.  The slot/function address of each device is encoded
 * in a single byte as follows:
 *
 *	7:3 = slot
 *	2:0 = function
 */
#define PCI_DEVFN(slot, func)	((((slot) & 0x1f) << 3) | ((func) & 0x07))
#define PCI_SLOT(devfn)		(((devfn) >> 3) & 0x1f)
#define PCI_FUNC(devfn)		((devfn) & 0x07)

/* Ioctls for /proc/bus/pci/X/Y nodes. */
#define PCIIOC_BASE		('P' << 24 | 'C' << 16 | 'I' << 8)
#define PCIIOC_CONTROLLER	(PCIIOC_BASE | 0x00)	/* Get controller for PCI device. */
#define PCIIOC_MMAP_IS_IO	(PCIIOC_BASE | 0x01)	/* Set mmap state to I/O space. */
#define PCIIOC_MMAP_IS_MEM	(PCIIOC_BASE | 0x02)	/* Set mmap state to MEM space. */
#define PCIIOC_WRITE_COMBINE	(PCIIOC_BASE | 0x03)	/* Enable/disable write-combining. */

struct pci_device_t 
{
    uint8_t busNo, deviceNo, funcNo;
    uint8_t headerType;
    bool multiFunction;
    uint16_t vendor, device;       /* Vendor and device ID or PCI_ANY_ID*/
    uint16_t subvendor, subdevice; /* Subsystem ID's or PCI_ANY_ID */
    uint32_t class, subClass;    /* (class,subclass,prog-if) triplet */
    uint8_t prog;
    unsigned long driver_data; /* Data private to the driver */
    uint32_t baseAdd[6];
    uint32_t expROMAddress;
    uint8_t caps, interrupt_line, interrupt_pin,BIST, latencyTimer,cacheSize,progIF,revisionID;
    uint16_t bridgeControl, memoryBase,memoryLimit,status,command,secStatus;
};

struct pci_bridge_t
{
    uint8_t busNo, deviceNo, funcNo;
    uint8_t headerType;
    bool multiFunction;
    uint16_t vendor, device;       /* Vendor and device ID or PCI_ANY_ID*/
    uint32_t class, subClass;    /* (class,subclass,prog-if) triplet */
    uint8_t prog;
    uint32_t baseAdd[2],expROMAddress,ioLimit, ioBase;
    uint8_t secondaryBusNum, primaryBusNum, subordinateBusNum;
    uint8_t caps, interrupt_line, interrupt_pin,BIST, latencyTimer,cacheSize,progIF,revisionID,secLatencyTimer;
    uint16_t bridgeControl, memoryBase,memoryLimit,status,command,secStatus;
    uint64_t prefMemLimit, prefMemBase;
} __attribute__((packed));;
 uint16_t pciConfigReadWord (uint8_t bus, uint8_t slot,
                             uint8_t func, uint8_t offset);
void checkBus(struct pci_device_t* node, uint8_t bus);
void getDeviceName(uint32_t vendorID, uint32_t deviceID, char* deviceName);
char* getDeviceNameP(struct pci_device_t* node, char* buffer);
bool getDeviceHeader(struct pci_device_t* node, uint8_t bus, uint8_t slot, uint8_t func);
bool getBridgeHeader(struct pci_bridge_t* node, uint8_t bus, uint8_t slot, uint8_t func);
void printPCIBridgeHeader(struct pci_bridge_t* node);
 void pciQueryBDF(uint8_t bus, uint8_t device, uint8_t function);
void printPCIHeader(struct pci_device_t* node);
void pciInitialize();
#endif	/* PCI_H */

