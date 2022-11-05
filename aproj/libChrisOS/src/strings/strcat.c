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
   
#include "strings.h"
#include "common.h"

    #undef strcat
   
   #ifndef STRCAT
   # define STRCAT strcat
   #endif
   
   /* Append SRC on the end of DEST.  */
   __attribute__((visibility("default"))) char *
   STRCAT (char *dest, const char *src)
   {
     strcpyI (dest + strlenI (dest), src);
     return dest;
   }

   char* strcatI (char *dest, const char *src)
   {
     strcpyI (dest + strlenI (dest), src);
     return dest;
   }
   
char *strncatI(char *dest, const char *src, size_t n)
{
    size_t bytesToCopy=0;
    size_t srcStringLen=strlenI(src);;
    
    if (n<=srcStringLen)
        bytesToCopy=n;
    else
        bytesToCopy=srcStringLen;
    
     strncpyI (dest + strlenI (dest),src,bytesToCopy);
     return dest;
}

VISIBLE char *strncat(char *dest, const char *src, size_t n)
{
    return strncatI(dest, src, n);
}