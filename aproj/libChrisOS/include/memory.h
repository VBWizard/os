/* 
 * File:   memory.h
 * Author: yogi
 *
 * Created on April 27, 2016, 4:41 PM
 */

#ifndef MEMORY_H
#define	MEMORY_H

void *memset(void *d1, int val, size_t len);
void *memsetI(void *d1, int val, size_t len);
void * memcpy(void *dest, const void *src, size_t n);
void *memcpyI(void *dest, const void *src, size_t n);
#endif	/* MEMORY_H */

