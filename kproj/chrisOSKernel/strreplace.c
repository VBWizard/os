/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"

///NOTE: Output pointer has to be freed!!!
static char *strreplace(const char *in, const char *pattern, const char *by)
{
    size_t outsize = strlen(in) + 1;
    // TODO maybe avoid reallocing by counting the non-overlapping occurences of pattern
    char *res = mallocI(outsize);
    // use this to iterate over the output
    size_t resoffset = 0;

    char *needle;
    while ((needle = strstr(in, pattern))) {
        // copy everything up to the pattern
        memcpy(res + resoffset, in, needle - in);
        resoffset += needle - in;

        // skip the pattern in the input-string
        in = needle + strlen(pattern);

        // adjust space for replacement
        outsize = outsize - strlen(pattern) + strlen(by);
        res = kRealloc(res, outsize);

        // copy the pattern
        memcpy(res + resoffset, by, strlen(by));
        resoffset += strlen(by);
    }

    // copy the remaining input
    strcpy(res + resoffset, in);

    return res;
}
