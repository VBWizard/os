#include "strings.h"

char * VISIBLE strcpy(char *s1, const char *s2)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0)
	;
    return (s1);
}

char * VISIBLE strcpyc(char *s1, const char *s2, unsigned count)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
	;
    return (s1);
}
