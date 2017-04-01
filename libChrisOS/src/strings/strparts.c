#include "libChrisOS.h"

VISIBLE char* strleft(char* val, int cnt)
{
    val[cnt]='\0';
    return val;
}
