#include "strings.h"

void strtrimI(char *input)
{
   char *dst = input, *src = input;
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
   {
      ++src;
   }

   // Trim at end...
   //
   end = src + strlenI(src) - 1;
   while (end > src && *end==' ')
   {
      *end-- = 0;
   }

   // Move if needed.
   //
   if (src != dst)
   {
      while ((*dst++ = *src++));
   }
}

__attribute__((visibility("default"))) void strtrim(char *input)
{
    return strtrimI(input);
}

/*FROM: http://codereview.stackexchange.com/questions/20897/trim-function-in-c*/
/*__attribute__((visibility("default"))) char * strtrim(char * *pointerToString)
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

__attribute__((visibility("default"))) char * strtrim2(char* pointerToString)
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
 */

