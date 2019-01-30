/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"
#include "libChrisOS.h"

///NOTE: Output pointer has to be freed!!!
static char *strreplaceI(const char *in, const char *pattern, const char *by)
{
    size_t outsize = strlenI(in) + 1;
    // TODO maybe avoid reallocing by counting the non-overlapping occurences of pattern
    char *res = mallocI(outsize);
    // use this to iterate over the output
    size_t resoffset = 0;

    char *needle;
    while ((needle = strstrI(in, pattern))) {
        // copy everything up to the pattern
        memcpyI(res + resoffset, in, needle - in);
        resoffset += needle - in;

        // skip the pattern in the input-string
        in = needle + strlenI(pattern);

        // adjust space for replacement
        outsize = outsize - strlenI(pattern) + strlenI(by);
        res = reallocI(res, outsize);

        // copy the pattern
        memcpyI(res + resoffset, by, strlenI(by));
        resoffset += strlenI(by);
    }

    // copy the remaining input
    strcpyI(res + resoffset, in);

    return res;
}

VISIBLE char *strreplace(const char *in, const char *pattern, const char *by)
{
    return strreplaceI(in, pattern, by);
}
