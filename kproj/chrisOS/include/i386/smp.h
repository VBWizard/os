/* 
 * File:   mp.h
 * Author: yogi
 *
 * Created on May 20, 2016, 9:59 AM
 */

#ifndef MP_H
#define	MP_H

typedef enum mpRecType
{
    CPU=0,
    BUS,
    IOAPIC,
    IOINTASS,
    LOCALINTASS
} eMPRecType;

#include "../mpspec_def.h"
typedef struct mpConfig
{
    union 
    {unsigned char rec[20];
    struct mpc_cpu cpu;
    struct mpc_bus bus;
    struct mpc_ioapic apic;
    struct mpc_intsrc irqSrc;
    struct mpc_lintsrc lintSrc;
    };
    eMPRecType recType;
    uint32_t prevRecAddress;
    uint32_t nextRecAddress;
    
} __attribute__((packed))mpConfig_t;

#endif	/* MP_H */

