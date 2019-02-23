/* Copyright (C) 1991-2016 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */

/* 
 * File:   time.h
 * Author: yogi
 *
 * Created on April 1, 2017, 11:41 PM
 */

#ifndef TIME_H
#define TIME_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>

#define YEAR0                   1900
#define EPOCH_YR                1970
#define SECS_DAY                (24L * 60L * 60L)
#define LEAPYEAR(year)          (!((year) % 4) && (((year) % 100) || !((year) % 400)))
#define YEARSIZE(year)          (LEAPYEAR(year) ? 366 : 365)
#define FIRSTSUNDAY(timp)       (((timp)->tm_yday - (timp)->tm_wday + 420) % 7)
#define FIRSTDAYOF(timp)        (((timp)->tm_wday - (timp)->tm_yday + 420) % 7)
#define TIME_MAX                2147483647L

    typedef long int time_t;
    
    struct tm
    {
      int tm_sec;			/* Seconds.	[0-60] (1 leap second) */
      int tm_min;			/* Minutes.	[0-59] */
      int tm_hour;			/* Hours.	[0-23] */
      int tm_mday;			/* Day.		[1-31] */
      int tm_mon;			/* Month.	[0-11] */
      int tm_year;			/* Year	- 1900.  */
      int tm_wday;			/* Day of week.	[0-6] */
      int tm_yday;			/* Days in year.[0-365]	*/
      int tm_isdst;			/* DST.		[-1/0/1]*/
      long int tm_gmtoff;		/* Seconds east of UTC.  */
      const char *tm_zone;		/* Timezone abbreviation.  */
    };

    time_t getticks(/*time_t* arg*/);
    struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
    struct tm *gmtime_rI(const time_t *timer, struct tm *tmbuf) ;
    struct tm *localtime(const time_t *timer);
    struct tm *localtime_r(const time_t *timer, struct tm *tmbuf);
    time_t mktime(struct tm *tmbuf);
    void getDateTimeString(char *s);
#ifdef __cplusplus
}
#endif

#endif /* TIME_H */

