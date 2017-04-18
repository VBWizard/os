/* 
 * File:   bits.h
 * Author: yogi
 *
 * Created on June 1, 2016, 10:47 AM
 */

#ifndef BITS_H
#define	BITS_H
bool bitsSet(volatile uint32_t* array, uint32_t bit);
bool bitsReset(volatile uint32_t* array, uint32_t bit);
bool bitsTest(volatile uint32_t* array, uint32_t bit);
int bitsScanF(volatile uint32_t* array);
#endif	/* BITS_H */

