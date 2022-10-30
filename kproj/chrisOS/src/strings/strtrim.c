#include "strings.h"

/*FROM: http://codereview.stackexchange.com/questions/20897/trim-function-in-c*/
char * strtrim(char * *pointerToString)
{
    uint8_t start=0, length=0;

        // Trim.Start:
        length = strlen(*pointerToString);
        while ((*pointerToString)[start]==' ') start++;
        (*pointerToString) += start;

        if (start < length) // Required for empty (ex. "    ") input
        {
            // Trim.End:
            uint8_t end = strlen(*pointerToString)-1; // Get string length again (after Trim.Start)
            while ((*pointerToString)[end]==' ') end--;
            (*pointerToString)[end+1] = 0;
        }

    return *pointerToString;
}

char * strtrim2(char* pointerToString)
{
    uint8_t start=0, length=0;

        // Trim.Start:
        length = strlen(pointerToString);
        while ((pointerToString)[start]==' ') start++;
        (pointerToString) += start;

        if (start < length) // Required for empty (ex. "    ") input
        {
            // Trim.End:
            uint8_t end = strlen(pointerToString)-1; // Get string length again (after Trim.Start)
            while ((pointerToString)[end]==' ') end--;
            (pointerToString)[end+1] = 0;
        }

    return pointerToString;
}
