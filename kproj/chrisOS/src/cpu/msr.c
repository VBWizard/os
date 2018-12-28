#include "i386/cpu.h"

uint64_t rdmsr64(unsigned index)
{
    unsigned long long ret;

    __asm__ ("rdmsr" : "=A"(ret) : "c"(index));
    return ret;
}

void rdmsr32(unsigned index,uint32_t* loVal, uint32_t* hiVal)
{
    unsigned long long lTemp = rdmsr64(index);
    *hiVal = lTemp >> 32;
    *loVal = lTemp & 0xFFFFFFFF;
}

void wrmsr64(unsigned index, uint64_t val)
{
    __asm__ volatile ("wrmsr" : : "c"(index), "A"(val));
}

void wrmsr32(unsigned index, uint32_t loVal, uint32_t hiVal)
{
    //NOTE: hiVal=EDX, loVal=EAX
    //asm volatile ("wrmsr" : : "c"(index), "a"(eaxVal), "d" edxVal);
    wrmsr64(index, ((uint64_t)hiVal << 32) | loVal);
    
}
