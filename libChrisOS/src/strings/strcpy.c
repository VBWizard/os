#include "strings.h"
#include "libChrisOS.h"

VISIBLE char * strcpy(char *s1, const char *s2)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0)
	;
    return (s1);
}

VISIBLE char * strcpyc(char *s1, const char *s2, unsigned count)
{
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
	;
    return (s1);
}
