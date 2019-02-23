/* 
 * strtok.c --
 *
 *	Source code for the "strtok" library routine.
 *
 * Copyright 1988 Regents of the University of California
 * Permission to use, copy, modify, and distribute this
 * software and its documentation for any purpose and without
 * fee is hereby granted, provided that the above copyright
 * notice appear in all copies.  The University of California
 * makes no representations about the suitability of this
 * software for any purpose.  It is provided "as is" without
 * express or implied warranty.
 */

/*
 *----------------------------------------------------------------------
 *
 * strtok --
 *
 *  	Split a string up into tokens
 *
 * Results:
 *      If the first argument is non-NULL then a pointer to the
 *      first token in the string is returned.  Otherwise the
 *      next token of the previous string is returned.  If there
 *      are no more tokens, NULL is returned.
 *
 * Side effects:
 *	Overwrites the delimiting character at the end of each token
 *      with '\0'.
 *
 *----------------------------------------------------------------------
 */

#include "strings.h"
#include "common.h"

int strcspnI(char* string, char* chars);
char *strchrI(const char *s, int c);

char * strtokI(char* s, /*const*/ char* delim)
{
    static char *lasts;
    register int ch;

    if (s == 0)
	s = lasts;
    do {
	if ((ch = *s++) == '\0')
	    return 0;
    } while (strchrI(delim, ch));
    --s;
    lasts = s + strcspnI(s, delim);
    if (*lasts != 0)
	*lasts++ = 0;
    return s;
}

VISIBLE char * strtok(char* s, /*const*/ char* delim)
{
    static char *lasts;
    register int ch;

    if (s == 0)
	s = lasts;
    do {
	if ((ch = *s++) == '\0')
	    return 0;
    } while (strchrI(delim, ch));
    --s;
    lasts = s + strcspnI(s, delim);
    if (*lasts != 0)
	*lasts++ = 0;
    return s;
}