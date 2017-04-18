#include "i386/cpu.h"
#include <cpuid.h>

extern cpuid_features_t kCPUFeatures;


void identifyCPUFeatures(cpuid_features_t* cpuFeatures)
{
    uint32_t eax, ebx, ecx, edx;

    __cpuid(1, eax, ebx, cpuFeatures->cpuid_feature_bits_2.cpuid_feature_bits_ecx_reg, cpuFeatures->cpuid_feature_bits.cpuid_features_edx_reg);
    __cpuid(7, eax, cpuFeatures->cpuid_extended_feature_bits_3.cpuid_extended_feature_bits_ebx_reg , ecx, edx);
}
