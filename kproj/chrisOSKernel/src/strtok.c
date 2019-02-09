/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

char *strchr(const char *s, int c)
{
    while (*s != (char)c)
        if (!*s++)
            return 0;
    return (char *)s;
}

int strcspn(char* string, char* chars)
{
    register char c, *p, *s;

    for (s = string, c = *s; c != 0; s++, c = *s) {
	for (p = chars; *p != 0; p++) {
	    if (c == *p) {
		return s-string;
	    }
	}
    }
    return s-string;
}

char * strtok(char* s, /*const*/ char* delim)
{
    static char *lasts;
    register int ch;

    if (s == 0)
	s = lasts;
    do {
	if ((ch = *s++) == '\0')
	    return 0;
    } while (strchr(delim, ch));
    --s;
    lasts = s + strcspn(s, delim);
    if (*lasts != 0)
	*lasts++ = 0;
    return s;
}