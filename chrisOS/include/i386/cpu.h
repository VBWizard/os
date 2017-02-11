/* 
 * File:   cpu.h
 * Author: yogi
 *
 * Created on May 1, 2016, 2:50 PM
 */

#ifndef CPU_H
#define	CPU_H
#include "bits/types.h"
#include <stdbool.h>
#include <stdint.h>

/* Access BYTE's flags */
#define ACS_PRESENT     0x80            /* present segment */
#define ACS_CSEG        0x18            /* code segment */
#define ACS_DSEG        0x10            /* data segment */
#define ACS_CONFORM     0x04            /* conforming segment */
#define ACS_READ        0x02            /* readable segment */
#define ACS_WRITE       0x02            /* writable segment */
#define ACS_IDT         ACS_DSEG        /* segment type is the same type */
#define ACS_INT_GATE    0x0E            /* int gate for 386 */
#define ACS_INT         (ACS_PRESENT | ACS_INT_GATE) /* present int gate */
#define ACS_TSS_GATE    0x09
#define ACS_TSS         (ACS_PRESENT | ACS_TSS_GATE) /* present tss gate */
#define ACS_DPL_0       0x00            /* descriptor privilege level #0 */
#define ACS_DPL_1       0x20            /* descriptor privilege level #1 */
#define ACS_DPL_2       0x40            /* descriptor privilege level #2 */
#define ACS_DPL_3       0x60            /* descriptor privilege level #3 */
#define ACS_LDT         0x02            /* ldt descriptor */
#define ACS_TASK_GATE   0x05
#define ACS_TASK        (ACS_PRESENT | ACS_TASK_GATE) /* present task gate */
#define ACS_CALL_GATE16 0x04
#define ACS_CALL16      (ACS_PRESENT | ACS_CALL_GATE16) /* present 16-bit call gate */
#define ACS_CALL_GATE32 0x0C
#define ACS_CALL32      (ACS_PRESENT | ACS_CALL_GATE32) /* present 32-bit call gate */

/* Ready-made values */
#define ACS_CODE        (ACS_PRESENT | ACS_CSEG | ACS_READ)
#define ACS_DATA        (ACS_PRESENT | ACS_DSEG | ACS_WRITE)
#define ACS_STACK       (ACS_PRESENT | ACS_DSEG | ACS_WRITE)

/* Attributes (in turms of size) */
#define ATTR_GRANULARITY 0x80           /* segment limit is given in 4KB pages rather than in BYTEs */
#define ATTR_BIG         0x40           /* ESP is used rather than SP */
#define ATTR_DEFAULT     0x40           /* 32-bit code segment rather than 16-bit */

/* Heavly inspired from Clicker's x86/cpu.h code (Public Domain) */
/* CPUID Flags. */
#define CPUID_FLAG_FPU          0x1             /* Floating Point Unit. */
#define CPUID_FLAG_VME          0x2             /* Virtual Mode Extensions. */
#define CPUID_FLAG_DE           0x4             /* Debugging Extensions. */
#define CPUID_FLAG_PSE          0x8             /* Page Size Extensions. */
#define CPUID_FLAG_TSC          0x10            /* Time Stamp Counter. */
#define CPUID_FLAG_MSR          0x20            /* Model-specific registers. */
#define CPUID_FLAG_PAE          0x40            /* Physical Address Extensions. */
#define CPUID_FLAG_MCE          0x80            /* Machine Check Exceptions. */
#define CPUID_FLAG_CXCHG8       0x100           /* Compare and exchange 8-byte. */
#define CPUID_FLAG_APIC         0x200           /* On-chip APIC. */
#define CPUID_FLAG_SEP          0x800           /* Fast System Calls. */
#define CPUID_FLAG_MTRR         0x1000          /* Memory Type Range Registers. */
#define CPUID_FLAG_PGE          0x2000          /* Page Global Enable.  */
#define CPUID_FLAG_MCA          0x4000          /* Machine Check Architecture. */
#define CPUID_FLAG_CMOV         0x8000          /* Conditional move-instruction. */
#define CPUID_FLAG_PAT          0x10000         /* Page Attribute Table. */
#define CPUID_FLAG_PSE36        0x20000         /* 36-bit Page Size Extensions. */
#define CPUID_FLAG_PSN          0x40000         /* Processor Serial Number. */
#define CPUID_FLAG_CLFL         0x80000         /* CLFLUSH - fixme? */
#define CPUID_FLAG_DTES         0x200000        /* Debug Trace and EMON Store MSRs. */
#define CPUID_FLAG_ACPI         0x400000        /* Thermal Cotrol MSR. */
#define CPUID_FLAG_MMX          0x800000        /* MMX instruction set. */
#define CPUID_FLAG_FXSR         0x1000000       /* Fast floating point save/restore. */
#define CPUID_FLAG_SSE          0x2000000       /* SSE (Streaming SIMD Extensions) */
#define CPUID_FLAG_SSE2         0x4000000       /* SSE2 (Streaming SIMD Extensions - #2) */
#define CPUID_FLAG_SS           0x8000000       /* Selfsnoop. */
#define CPUID_FLAG_HTT          0x10000000      /* Hyper-Threading Technology. */
#define CPUID_FLAG_TM1          0x20000000      /* Thermal Interrupts, Status MSRs. */
#define CPUID_FLAG_IA64         0x40000000      /* IA-64 (64-bit Intel CPU) */
#define CPUID_FLAG_PBE          0x80000000      /* Pending Break Event. */

    union 
    {
      struct {
        uint8_t step: 4;
        uint8_t model: 4;
        uint8_t family: 4;
        uint8_t type: 2;
        uint8_t pad1: 2;
        uint8_t emodel: 4;
        uint8_t efamily: 8;
        uint8_t pad2: 4;
      };
      uint32_t reg;
    } cpuid_procinfo;

typedef struct
    {
        union {
          struct {
            uint8_t fpu: 1;
            uint8_t vme: 1;
            uint8_t de: 1;
            uint8_t pse: 1;
            uint8_t tsc: 1;
            uint8_t msr: 1;
            uint8_t pae: 1;
            uint8_t mce: 1;
            uint8_t cx8: 1;
            uint8_t apic: 1;
            uint8_t reserved1: 1;
            uint8_t sep: 1;
            uint8_t mtrr: 1;
            uint8_t pge: 1;
            uint8_t mca: 1;
            uint8_t cmov: 1;
            uint8_t pat: 1;
            uint8_t pse36: 1;
            uint8_t psn: 1;
            uint8_t clfsh: 1;
            uint8_t reserved2: 1;
            uint8_t ds: 1;
            uint8_t acpi: 1;
            uint8_t mmx: 1;
            uint8_t fxsr: 1;
            uint8_t sse: 1;
            uint8_t sse2: 1;
            uint8_t ss: 1;
            uint8_t htt: 1;
            uint8_t tm: 1;
            uint8_t ia64: 1;
            uint8_t pbe: 1;
          };
          uint32_t cpuid_features_edx_reg;
        } cpuid_feature_bits;

        union {
          struct {
            uint32_t sse3: 1;
            uint32_t pclmulqdq: 1;
            uint32_t dtes64: 1;
            uint32_t monitor: 1;
            uint32_t dscpl: 1;
            uint32_t vmx: 1;
            uint32_t smx: 1;
            uint32_t est: 1;
            uint32_t tm2: 1;
            uint32_t ssse3: 1;
            uint32_t cntxid: 1;
            uint32_t sdbg: 1;
            uint32_t fma: 1;
            uint32_t cx16: 1;
            uint32_t xtpr: 1;
            uint32_t pdcm: 1;
            uint32_t reserved1: 1;
            uint32_t pcid: 1;
            uint32_t dca: 1;
            uint32_t sse41: 1;
            uint32_t sse42: 1;
            uint32_t x2apic: 1;
            uint32_t movbe: 1;
            uint32_t popcnt: 1;
            uint32_t tscdadline: 1;
            uint32_t aes: 1;
            uint32_t xsave: 1;
            uint32_t osxsave: 1;
            uint32_t avx: 1;
            uint32_t f16c: 1;
            uint32_t rdrnd: 1;
            uint32_t hypervisor: 1;      
          };
          uint32_t cpuid_feature_bits_ecx_reg;
        } cpuid_feature_bits_2;

        union {
          struct {
            uint8_t fsgsbase: 1;
            uint8_t ia32tscadjust: 1;
            uint8_t sgx: 1;
            uint8_t bmi1: 1;
            uint8_t hle: 1;
            uint8_t avx2: 1;
            uint8_t reserved1: 1;
            uint8_t smep: 1;
            uint8_t bmi2: 1;
            uint8_t erms: 1;
            uint8_t invpcid: 1;
            uint8_t rtm: 1;
            uint8_t pqm: 1;
            uint8_t fpucsdsdeprecated: 1;
            uint8_t mpx: 1;
            uint8_t pqe: 1;
            uint8_t avx512f: 1;
            uint8_t avx512dq: 1;
            uint8_t rdseed: 1;
            uint8_t adx: 1;
            uint8_t smap: 1;
            uint8_t avx512ifma: 1;
            uint8_t pcommit: 1;
            uint8_t clflushopt: 1;
            uint8_t clwb: 1;
            uint8_t intelproctrace: 1;
            uint8_t avx512pf: 1;
            uint8_t avx512er: 1;
            uint8_t avx512cd: 1;
            uint8_t sha: 1;
            uint8_t avx512bw: 1;
            uint8_t avx512vl: 1;
          };
          uint32_t cpuid_extended_feature_bits_ebx_reg;
        } cpuid_extended_feature_bits_3;
    } cpuid_features_t;
    
    union {
      struct {
        uint8_t prefetchwt1: 1;
        uint8_t avx512vbmi: 1;
        uint32_t reserved: 30;
      };
      uint32_t reg;
    } cpuid_extended_feature_bits;
  
  enum cpuid_requests {
  CPUID_GETVENDORSTRING,
  CPUID_GETFEATURES,
  CPUID_GETTLB,
  CPUID_GETSERIAL,
  
  CPUID_INTELEXTENDED=0x80000000,
  CPUID_INTELFEATURES,
  CPUID_INTELBRANDSTRING,
  CPUID_INTELBRANDSTRINGMORE,
  CPUID_INTELBRANDSTRINGEND,
};

/*Portions from http://www.osdever.net/bkerndev/Docs/idt.htm*/
/* Defines an IDT entry */
struct idt_entry
{
    unsigned short base_lo;
    unsigned short sel;        /* Our kernel segment goes here! */
    unsigned char always0;     /* This will ALWAYS be set to 0! */
    unsigned char flags;       /* Set using the above table! */
    unsigned short base_hi;
} __attribute__((packed));

struct idt_ptr
{
    uint16_t limit;
    uint32_t base;
} __attribute__((packed));

typedef struct cpu_s
{
    int apicID;
    uint32_t registerBase;
    uint64_t ticksPerSecond;
} cpu_t;

/* Declare an IDT of 256 entries. Although we will only use the
*  first 32 entries in this tutorial, the rest exists as a bit
*  of a trap. If any undefined IDT entry is hit, it normally
*  will cause an "Unhandled Interrupt" exception. Any descriptor
*  for which the 'presence' bit is cleared (0) will generate an
*  "Unhandled Interrupt" exception */
void idt_load(uint64_t value);
void init_PIT();

bool apicCheckFor();
uint32_t apicGetAPICBase(void);
void apicSetAPICBase(uint32_t apic);
uint32_t apicReadRegister(uint32_t reg);
uintptr_t cpu_get_apic_base();
void apicSetAPICBase(uintptr_t apic);
void apicEnable();
unsigned apic_enabled();
uint64_t rdmsr64(unsigned index);
/*NOTE: loVal=EAX, hiVAL=EDX*/
void rdmsr32(unsigned index,uint32_t* loVal, uint32_t* hiVal);
void wrmsr64(unsigned index, uint64_t val);
void wrmsr32(unsigned index, uint32_t loVal, uint32_t hiVal);
uintptr_t idt_get_gate_address(int vector);

void _irq0_handler();
void _isr_00_wrapper();                                 //used to be void prefix keyword
void _isr_01_wrapper();
void _isr_02_wrapper();
void _isr_03_wrapper();
void _isr_04_wrapper();
void _isr_05_wrapper();
void _isr_06_wrapper();
void _isr_07_wrapper();
void _isr_08_wrapper();
void _isr_09_wrapper();
void _isr_10_wrapper();
void _isr_11_wrapper();
void _isr_12_wrapper();
void _isr_13_wrapper();
void _isr_14_wrapper();
void _isr_15_wrapper();
void _isr_16_wrapper();
void _isr_17_wrapper();
void _isr_18_wrapper();
void _isr_19_wrapper();
void _isr_20_wrapper();
void _isr_21_wrapper();
void _isr_22_wrapper();
void _isr_23_wrapper();
void _isr_24_wrapper();
void _isr_25_wrapper();
void _isr_26_wrapper();
void _isr_27_wrapper();
void _isr_28_wrapper();
void _isr_29_wrapper();
void _isr_30_wrapper();
void _isr_31_wrapper();
void _isr_32_wrapper();
void _call_gate_wrapper();
void idt_init(struct idt_ptr* idtp, int remap_offset);
void idt_get_gate(struct idt_entry *idt, uint8_t idtIndex, unsigned short *sel, uint32_t *base, unsigned char *flags);
void idt_set_gate(struct idt_entry *idt, unsigned short sel, uint32_t base, unsigned char flags);
#endif	/* CPU_H */

