/*FROM: https://raw.githubusercontent.com/arunov/adix/master/include/sys/ahci/ahcicommands.h*/
#ifndef _AHCICOMMANDS_H
#define _AHCICOMMANDS_H

#define ATA_CMD_READ_DMA 0xC8
#define ATA_CMD_READ_DMA_EX 0x25
#define ATA_CMD_WRITE_DMA 0xCA
#define ATA_CMD_WRITE_DMA_EX 0x35

#define ATA_DEV_BUSY 0x80
#define ATA_DEV_DRQ 0x08

#define LOBYTE(w) ((uint8_t)(w))
#define HIBYTE(w) ((uint8_t)(((uint16_t)(w) >> 8) & 0xFF))
#define LOWORD(w) ((uint16_)(w))
#define HIWORD(w) ((uint16_t)(((uint32_t)(w) >> 16)&0xFFFF))
#endif
