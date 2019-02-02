//
// time.c
//
// Time routines
//
// Copyright (C) 2002 Michael Ringgaard. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
// 1. Redistributions of source code must retain the above copyright 
//    notice, this list of conditions and the following disclaimer.  
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.  
// 3. Neither the name of the project nor the names of its contributors
//    may be used to endorse or promote products derived from this software
//    without specific prior written permission. 
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
// OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
// OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
// 

#ifndef KERNEL
#include <unistd.h>
#endif

#include "time_os.h"
#include <stdbool.h>
#include <time_os.h>
#include <sys/time.h>
#include <sys/times.h>
#include "chrisos.h"
#include "i386/bits/types.h"
#include "../include/printf.h"

extern volatile uint32_t* kTicksSinceStart;
extern int kTimeZone;
extern volatile uint32_t kTicksPerSecond;
extern bool kDebugStartsNow;
extern int kTicksPerMS;

#define YEAR0                   1900
#define EPOCH_YR                1970
#define SECS_DAY                (24L * 60L * 60L)
#define LEAPYEAR(year)          (!((year) % 4) && (((year) % 100) || !((year) % 400)))
#define YEARSIZE(year)          (LEAPYEAR(year) ? 366 : 365)
#define FIRSTSUNDAY(timp)       (((timp)->tm_yday - (timp)->tm_wday + 420) % 7)
#define FIRSTDAYOF(timp)        (((timp)->tm_wday - (timp)->tm_yday + 420) % 7)

#define TIME_MAX                2147483647L

extern int KERNEL_DATA_SECTION _daylight;                  // Non-zero if daylight savings time is used
extern long KERNEL_DATA_SECTION _dstbias;                  // Offset for Daylight Saving Time
extern char KERNEL_DATA_SECTION *_tzname[2];  // Standard/daylight savings time zone names
extern int KERNEL_DATA_SECTION ticksToWait;

extern const KERNEL_DATA_SECTION char *_days[7];

extern const KERNEL_DATA_SECTION char *_days_abbrev[7];

extern const KERNEL_DATA_SECTION char *_months[12];

extern const KERNEL_DATA_SECTION char *_months_abbrev[12];

const int _ytab[2][12] = {
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
    return kSystemCurrentTime;
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
  dayno = (unsigned long) time / SECS_DAY;

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
  tmbuf->tm_isdst = 0;
  return tmbuf;
}

struct tm *localtime(const time_t *timer) {
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
  return gmtime_r(&t, &tmbuf);
}

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t t;

  t = *timer - kTimeZone;
  return gmtime_r(&t, tmbuf);
}

time_t mktime(struct tm *tmbuf) {
  long day, year;
  int tm_year;
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;

  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
  if (day + yday < 0) overflow|=4;
  day += yday;

  tmbuf->tm_yday = yday;
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
          overflow|=16;
  }
  seconds += kTimeZone;

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}

void getDateTimeString(char *s)
{
    static struct tm theDateTime;
    gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
    strftime(s, 50, "%m/%d/%Y %H:%M:%S", &theDateTime);
}

char *_strdate(char *s) {
  time_t now;

  time(&now);
  strftime(s, 9, "%D", localtime(&now));
  return s;
}

char *_strtime(char *s) {
  time_t now;

  time(&now);
  strftime(s, 9, "%T", localtime(&now));
  return s;
}

#if !defined(KERNEL) && !defined(OS_LIB)
void __attribute__((noinline))waitTicks(int TicksToWait)
{
    //printf("ttw=%u",ttw);
    if (TicksToWait<=0)
        return;
    if (ticksToWait>5000)
        printd(DEBUG_EXCEPTIONS,"waitTicks: Excessive ticks value %u\n",TicksToWait);
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
        TicksToWait--;
    } while (TicksToWait>0);
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
}

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
    {__asm__("sti\n hlt\n");}
    
}

void wait2(unsigned msToWait)
{
    uint64_t startTicks = *kTicksSinceStart;             //25
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;

    if (endTicks < *kTicksSinceStart)
        return;
    
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}

#endif

