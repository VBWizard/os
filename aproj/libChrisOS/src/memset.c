/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "common.h"

void *memsetI(void *d1, int val, size_t len)
{
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = val;
    }
    return d1;
}

VISIBLE void *memset(void *d1, int val, size_t len)
{
    return memsetI(d1, val, len);
}
