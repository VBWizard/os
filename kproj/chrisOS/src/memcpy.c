#include <sys/types.h>
#include <stdbool.h>
#include "chrisos.h"

/*
 * This is designed to be small, not fast.
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
    bool dw,dd;
    
    //CLR 02/01/2019: Bail immediately if the size passed is zero!  No reason to hang around.
    if (n==0)
        return;
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
    {
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
    {
        n /=2;
        const uint16_t *f = src;    //clr 04/17/2017: Changed 2 lines from uint32_t* to uint16_t*
        uint16_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
        return dest;
    }
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
        return dest;
    }
}
