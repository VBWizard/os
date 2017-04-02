/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "syscalls.h"
#include "libChrisOS.h"
#include "time.h"
#include "strings.h"

time_t libcTZ=0;

int _daylight=1;                  // Non-zero if daylight savings time is used
long _dstbias=0;                  // Offset for Daylight Saving Time
char *_tzname[2] = {"GMT", "GMT"};  // Standard/daylight savings time zone names
int ticksToWait;

const char *_days[7] = {
  "Sunday", "Monday", "Tuesday", "Wednesday",
  "Thursday", "Friday", "Saturday"
};

const char *_days_abbrev[7] = {
  "Sun", "Mon", "Tue", "Wed", 
  "Thu", "Fri", "Sat"
};

const char *_months[12] = {
  "January", "February", "March",
  "April", "May", "June",
  "July", "August", "September",
  "October", "November", "December"
};

const char *_months_abbrev[12] = {
  "Jan", "Feb", "Mar",
  "Apr", "May", "Jun",
  "Jul", "Aug", "Sep",
  "Oct", "Nov", "Dec"
};

const int _ytab[2][12] = {
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

VISIBLE time_t time(/*time_t* arg*/)
{
    uint32_t retVal=0;
    __asm__("call sysEnter_Vector\n":"=a" (retVal),"=b" (libcTZ):"a" (SYSCALL_GETTICKS));
    return (time_t)retVal;
}


VISIBLE struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
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

VISIBLE struct tm *localtime(const time_t *timer) {
  time_t t;
  struct tm tmbuf;
  
  t = *timer - libcTZ;
  return gmtime_r(&t, &tmbuf);
}

VISIBLE struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t t;

  t = *timer - libcTZ;
  return gmtime_r(&t, tmbuf);
}

VISIBLE time_t mktime(struct tm *tmbuf) {
  long day, year;
  int tm_year;
  int yday, month;
  long seconds;
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
  if (((libcTZ > 0) && (TIME_MAX - libcTZ < seconds)) || 
      ((libcTZ < 0) && (seconds < -libcTZ))) {
          overflow|=16;
  }
  seconds += libcTZ;

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
