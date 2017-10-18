#include <stddef.h>

__attribute__((visibility("default"))) size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
                ret++;
        return ret;
}

size_t strlenI(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
