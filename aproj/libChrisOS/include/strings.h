/* 
 * File:   strings.h
 * Author: yogi
 *
 * Created on April 27, 2016, 3:39 PM
 */

#ifndef STRINGS_H
#define	STRINGS_H

#include "libChrisOS.h"
#include <stddef.h>

#define ISDIGIT(c) ((c) - '0' + 0U <= 9U)
#define ISALPHA(c) (((c) | 32) - 'a' + 0U <= 'z' - 'a' + 0U)
#define ISCAPITALHEX(c) ((((((c) - 48U) & 255) * 23 / 22 + 4) / 7 ^ 1) <= 2U)
#define ISXDIGIT(c) (((((((((c) - 48U) & 255) * 18 / 17 * 52 / 51 * 58 / 114 \
     * 13 / 11 * 14 / 13 * 35 + 35) / 36 * 35 / 33 * 34 / 33 * 35 / 170 ^ 4) \
     - 3) & 255) ^ 1) <= 2U)
#define ISUPPER(c)  ((c) >= 'A' && (c) <= 'Z')

size_t strlen(const char* str);
/* This routine should be optimized. */

/* ANSI sez:
 *   The `strncmp' function compares not more than `n' characters (characters
 *   that follow a null character are not compared) from the array pointed to
 *   by `s1' to the array pointed to by `s2'.
 *   The `strncmp' function returns an integer greater than, equal to, or less
 *   than zero, according as the possibly null-terminated array pointed to by
 *   `s1' is greater than, equal to, or less than the possibly null-terminated
 *   array pointed to by `s2'.  [4.11.4.4]
 */
//int strcmp (const char *p1, const char *p2);
//int strncmp(const char *s1, const char *s2, size_t n);
    char* strcat (char *dest, const char *src);
    char* strcatI (char *dest, const char *src);
    int strcmp (const char *p1, const char *p2);
    char * strcpy(char *s1, const char *s2);
    char * strcpyI(char *s1, const char *s2);
    char * strcpyc(char *s1, const char *s2, unsigned count);
    char* strleft(char* val, int cnt);
    size_t strlen(const char* str);
    int strncmp(const char *s1, const char *s2, size_t n);
    char * strncpy(char *s1, const char *s2, size_t n);
    long strtol(const char *nptr, char **endptr, register int base);
    unsigned long strtoul(const char *nptr, char **endptr, register int base);
    //char * strtrim(char * *pointerToString);
    void strtrim(char *input);
    char * strtok(char* s, /*const*/ char* delim);
    char *strchr(const char *s, int c);
    int strcspn(char* string, char* chars);
    char* strstr(char* string, char* substring);
#endif	/* STRINGS_H */

