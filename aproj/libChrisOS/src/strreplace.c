/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"
#include "libChrisOS.h"
#include "config.h"



///NOTE: outString has to be big enough to hold the modified string
char *strreplaceI(const char *in, const char *pattern, const char *by, char *outString)
{
    size_t outsize = strlenI(in) + 1;
    // TODO maybe avoid reallocing by counting the non-overlapping occurences of pattern
    // use this to iterate over the output
    size_t resoffset = 0;
    char *needle;
    while ((needle = strstrI(in, pattern))) {
        // copy everything up to the pattern
        memcpyI(outString + resoffset, in, needle - in);
        resoffset += needle - in;

        // skip the pattern in the input-string
        in = needle + strlenI(pattern);

        // adjust space for replacement
        outsize = outsize - strlenI(pattern) + strlenI(by);

        // copy the pattern
        memcpyI(outString + resoffset, by, strlenI(by));
        resoffset += strlenI(by);
    }

    // copy the remaining input
    strcpyI(outString + resoffset, in);

    return outString;
}

VISIBLE char *strreplace(const char *in, const char *pattern, const char *by, char *outString)
{
    return strreplaceI(in, pattern, by, outString);
}
