/* 
 * File:   diskPartition.h
 * Author: yogi
 *
 * Created on May 14, 2016, 11:02 PM
 */

#ifndef DISKPARTITION_H
#define	DISKPARTITION_H

#ifdef	__cplusplus
extern "C" {
#endif
typedef struct partEntry
{
    uint32_t partStartSector; //LBA address of partition
    uint32_t partEndSector;
    uint32_t partTotalSectors;
    bool bootable;
    uint8_t systemID;
} partEntry_t;

#ifdef	__cplusplus
}
#endif

#endif	/* DISKPARTITION_H */

