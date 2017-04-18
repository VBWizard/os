#include "strings.h"
/* Copyright (C) 1991-2016 Free Software Foundation, Inc.
    2    This file is part of the GNU C Library.
    3 
    4    The GNU C Library is free software; you can redistribute it and/or
    5    modify it under the terms of the GNU Lesser General Public
    6    License as published by the Free Software Foundation; either
    7    version 2.1 of the License, or (at your option) any later version.
    8 
    9    The GNU C Library is distributed in the hope that it will be useful,
   10    but WITHOUT ANY WARRANTY; without even the implied warranty of
   11    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   12    Lesser General Public License for more details.
   13 
   14    You should have received a copy of the GNU Lesser General Public
   15    License along with the GNU C Library; if not, see
   16    <http://www.gnu.org/licenses/>.  */
   
   #include <strings.h>
   
   #undef strcat
   
   #ifndef STRCAT
   # define STRCAT strcat
   #endif
   
   /* Append SRC on the end of DEST.  */
   char *
   STRCAT (char *dest, const char *src)
   {
     strcpy (dest + strlen (dest), src);
     return dest;
   }

   void concatenate(char p[], char q[]) {
   int c, d;
 
   c = 0;
 
   while (p[c] != '\0') {
      c++;  	
   }
 
   d = 0;
 
   while (q[d] != '\0') {
      p[c] = q[d];
      d++;
      c++;	
   }
 
   p[c] = '\0';
}