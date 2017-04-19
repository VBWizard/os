/* 
 * File:   printf.h
 * Author: yogi
 *
 * Created on May 3, 2016, 9:34 AM
 */

#ifndef PRINTF_H
#define	PRINTF_H
#include <stdarg.h>
#include <stdint.h>
int printk(const char *format, ...);
int sprintf(char *out, const char *format, ...);
int printk_valist(const char *format, va_list args);
void __attribute__((noinline))panic(const char *format, ...);
#ifdef DEBUG_NONE
int printd();
#else
int printd(uint32_t DebugLevel, const char *format, ...);
void printu(const char *format, va_list args);
#endif

#endif	/* PRINTF_H */

