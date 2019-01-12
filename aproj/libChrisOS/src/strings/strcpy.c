#include "strings.h"

__attribute__((visibility("default"))) char *
strcpy(char *s1, const char *s2)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0)
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
    return (s1);
}

char *
strcpyI(char *s1, const char *s2)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0)
	;
    *s=0;       //CLR 04/20/2017: Added terminating null character to returned string
    return (s1);
}

__attribute__((visibility("default"))) char *
strcpyc(char *s1, const char *s2, unsigned count)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
	;
    return (s1);
}
