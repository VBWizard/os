/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"

VISIBLE char *strchr(const char *s, int c)
{
    while (*s != (char)c)
        if (!*s++)
            return 0;
    return (char *)s;
}

char *strchrI(const char *s, int c)
{
    while (*s != (char)c)
        if (!*s++)
            return 0;
    return (char *)s;
}
