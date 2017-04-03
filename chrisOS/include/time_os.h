/* 
 * File:   time.h
 * Author: yogi
 *
 * Created on May 14, 2016, 9:11 AM
 */

#ifndef TIME_H
#define	TIME_H
#include <time.h>
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

    void initSystemDate();
    void __attribute__((noinline))waitTicks();
    void wait(int msToWait);
    struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
    struct tm *localtime_r(const time_t *timer, struct tm *tmbuf);
    struct tm *localtime(const time_t *timer);
#ifdef	__cplusplus
}
#endif

#endif	/* TIME_H */

