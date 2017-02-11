#include "i386/cpu.h"
#include "i386/bits/types.h"
#include <cpuid.h>
#include "i386/apic.h"
#include "utility.h"
/** returns a 'true' value if the CPU supports APIC
 *  and if the local APIC hasn't been disabled in MSRs
 *  note that this requires CPUID to be supported.
 */

extern cpu_t kCPU[];
bool apicCheckFor() {
   uint32_t eax=0, edx=0, notused=0;
   __get_cpuid(1, &eax, &notused, &notused, &edx);
   return edx & CPUID_FLAG_APIC;
}

uint8_t acpiGetAPICVersion()
{
    return apicReadRegister(APIC_REGISTER_VERSION);
}

uint8_t apciGetAPICID(unsigned whichAPIC)
{
    return apicReadRegister(APIC_REGISTER_APIC_ID_OFFSET);
}

uint32_t apicGetAPICBase(void)
{
   uint32_t eax, edx;
   rdmsr32(IA32_APIC_BASE_MSR, &eax, &edx);

   return (eax & 0xfffff000);
}

uint32_t apicReadRegister(uint32_t reg) 
{
    return *((volatile uint32_t *) (kCPU[0].registerBase + reg));
}

void apicWriteRegister(uint32_t reg, uint32_t value) {
    *((volatile uint32_t *) (kCPU[0].registerBase + reg)) = value;
}

/* Set the physical address for local APIC registers */
void apicSetAPICBase(uintptr_t apic) {
   uint32_t edx = 0;
   uint32_t eax = (apic & 0xfffff100) | IA32_APIC_BASE_MSR_ENABLE;
 
#ifdef __PHYSICAL_MEMORY_EXTENSION__
   edx = (apic >> 32) & 0x0f;
#endif
 
   wrmsr32(IA32_APIC_BASE_MSR, eax, edx);
   kCPU[0].registerBase=apic;
}
 
/**
 * Get the physical address of the APIC registers page
 * make sure you map it to virtual memory ;)
 */
uintptr_t cpu_get_apic_base() {
   uint32_t eax, edx;
   rdmsr32(IA32_APIC_BASE_MSR, &eax, &edx);
 
#ifdef __PHYSICAL_MEMORY_EXTENSION__
   return (eax & 0xfffff000) | ((edx & 0x0f) << 32);
#else
   return (eax & 0xfffff000);
#endif
}

bool apicIsEnabled() {
   uint32_t eax, edx;
   rdmsr32(IA32_APIC_BASE_MSR, &eax, &edx);
   return (eax & (1<<11)) == (1<11);
} 

void apicEnable() {
   uint32_t eax, edx;
   rdmsr32(IA32_APIC_BASE_MSR, &eax, &edx);
   eax |=IA32_APIC_BASE_MSR_ENABLE;
   wrmsr32(IA32_APIC_BASE_MSR, eax, edx);
} 

void apicDisable() {
   uint32_t eax, edx;
   rdmsr32(IA32_APIC_BASE_MSR, &eax, &edx);
   eax&=!IA32_APIC_BASE_MSR_ENABLE;
   wrmsr32(IA32_APIC_BASE_MSR, eax, edx);
} 
uint32_t apicGetHZ() {

    int timerTimeout=500;
/*    apicWriteRegister(APIC_REGISTER_LVT_LINT0, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_LINT1, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_CMDI, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_ERROR, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_PERF, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_THERM, APIC_TIMER_INT_DISABLE);
    apicWriteRegister(APIC_REGISTER_LVT_TIMER, APIC_TIMER_INT_DISABLE);
*/

    // Prepare the PIT to sleep for 10ms (10000µs)

    apicEnable();
    apicWriteRegister(APIC_REGISTER_SPURIOUS, 39+APIC_SW_ENABLE);
    // Set APIC init counter to -1
    apicWriteRegister(APIC_REGISTER_LVT_TIMER, 32 | APIC_TIMER_MODE_ONESHOT );
    // Tell APIC timer to use divider 16
    apicWriteRegister(APIC_REGISTER_TIMER_DIV, 0x11);
    apicWriteRegister(APIC_REGISTER_TIMER_INITIAL, 0xFFFFFFFF);

    // Perform PIT-supported sleep
    wait(timerTimeout);

    apicWriteRegister(APIC_REGISTER_LVT_TIMER, APIC_TIMER_INT_DISABLE);
    // Now we know how often the APIC timer has ticked in 10ms
    uint64_t ticksPer10ms = 0xFFFFFFFF - apicReadRegister(APIC_REGISTER_TIMER_CURRENT);
    ticksPer10ms=ticksPer10ms/(timerTimeout/10);
    
    // Start timer as periodic on IRQ 0, divider 16, with the number of ticks we counted
//    apicWriteRegister(APIC_REGISTER_LVT_TIMER, 32  | APIC_TIMER_MODE_PERIODIC ); //clears the INT DISABLE pin
    apicWriteRegister(APIC_REGISTER_TIMER_DIV, 0x3);
    apicWriteRegister(APIC_REGISTER_TIMER_INITIAL, ticksPer10ms);
    return ticksPer10ms;
}

int tscGetTicksPerSecond()
{
    uint64_t ticksBefore=rdtsc();
    wait(1000);
    return rdtsc()-ticksBefore;
}