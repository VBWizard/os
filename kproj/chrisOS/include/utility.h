/* 
 * File:   utility.h
 * Author: yogi
 *
 * Created on April 27, 2016, 2:48 PM
 */


#ifndef UTILITY_H
#define	UTILITY_H
#include "i386/bits/types.h"
#include <stddef.h>
#include <stdbool.h>
#include "config.h"

#define KBRD_INTRFC 0x64
/* keyboard interface bits */
#define KBRD_BIT_KDATA 0 /* keyboard data is in buffer (output buffer is empty) (bit 0) */
#define KBRD_BIT_UDATA 1 /* user data is in buffer (command buffer is empty) (bit 1) */
#define KBRD_IO 0x60 /* keyboard IO port */
#define KBRD_RESET 0xFE /* reset CPU command */
#define bit(n) (1<<(n)) /* Set bit n to 1 */
/* Check if bit n in flags is set */
#define check_flag(flags, n) ((flags) & bit(n))


struct cpuinfo_t
{
    int family, model, stepping, type, brand, extended_family;
    char vendor[50], model_name[50], detected_processor_name[50], type_name[50], family_name[50], brand_name[50];
    
};
typedef struct sizeof_type
{
    uint16_t shortSize, intSize, longSize, longLongSize, longLongIntSize;
} sizeof_t;

void reverse(char s[]);
int atoi(char *str);
void itoa(int n, char s[]);
void itox(unsigned int i, char *s);
void itoha(unsigned int n, char *buf);
void* mallocTemp(int size); //Only used during boot
int convert(int s);
void identify_data_sizes(sizeof_t* sizes);
void *memset(void *d1, int val, size_t len);
uint8_t bcdToDec(uint8_t val);
uint8_t decToBcd(uint8_t val);
void initSystemDate();
char * strtoupper(char* pointerToString);
void printDumpedRegs();
void printDebugRegs();
void logDumpedRegs();
void reboot(bool waitFirst);
void dumpKernelAddresses();
bool pauseDisplay(bool offerToQuit);
void dumpGDTTable();
void dumpIDTTable();
void displayTSS(int tssAddress);
void dumpP(char* cmdline);
int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size);


#if defined(__i386__)

static __inline__ unsigned long long rdtsc(void)
{
    unsigned long long int x;
    __asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));
    return x;
}

#elif defined(__x86_64__)

static __inline__ unsigned long long rdtsc(void)
{
    unsigned hi, lo;
    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));
    return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
}

#endif
#endif	/* UTILITY_H */

