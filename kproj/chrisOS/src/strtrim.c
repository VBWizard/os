/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "strings.h"

void strtrim(char *input)
{
   char *src = input;
   char *dst = input;
   char *end;

   // Skip whitespace at front...
   //
   while (*src==' ')
   {
      ++src;
   }

   // Trim at end...
   //

   end = src + strlen(src) - 1;
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