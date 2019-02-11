/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"

void strtrim(char *input)
{
    char *src1 = input;
   char *src = input;
   char *dst = input;
   char *end;

   // Skip whitespace at front...
   //
   while (*src1==' ')
   {
      ++src1;
   }

   // Trim at end...
   //

   end = src1 + strlen(src1) - 1;
   while (end > src1 && *end==' ')
   {
      *end-- = 0;
   }

   // Move if needed.
   //
   if (src1 != dst)
   {
      while ((*dst++ = *src1++));
   }
}