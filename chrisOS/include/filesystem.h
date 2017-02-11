/* 
 * File:   filesystem.h
 * Author: yogi
 *
 * Created on May 13, 2016, 11:38 PM
 */

#ifndef FILESYSTEM_H
#define	FILESYSTEM_H

#include <stdint.h>
#include <stdbool.h>
#include "init/ata_disk.h"
#include "init/diskPartition.h"

#define MBR_PART1_OFFSET 0x1BE
#define MBR_PART2_OFFSET 0x1CE
#define MBR_PART3_OFFSET 0x1DE
#define MBR_PART4_OFFSET 0x1EE
#define MBR_MAX_PARTITIONS 0x40
struct mbr_t
{
    partEntry_t parts[MBR_MAX_PARTITIONS];
    int partCount;
    uint8_t diskID[10];
    bool validBootSector;
    uint32_t* prev,next;
} __attribute__((packed));

bool parseMBR(struct ataDeviceInfo_t* devInfo, struct mbr_t* mbr);
void printMBR(struct mbr_t* mbr);
bool parseGPT(HBA_PORT* port, struct mbr_t* mbr);
#endif	/* FILESYSTEM_H */

