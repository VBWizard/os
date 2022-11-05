//#include <stddef.h>
#include "libChrisOS.h"

size_t strlenI(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
                ret++;
        return ret;
}

__attribute__((visibility("default"))) size_t strlen(const char* str) 
{
    return strlenI(str);
}

size_t strnlenI(const char* str, size_t maxlen)
{
  size_t ret = 0;
  while ( str[ret] != 0 && ret<maxlen)
          ret++;
  return ret;
}

VISIBLE size_t strnlen(const char* str, int maxlen)
{
    return strnlenI(str, maxlen);
}