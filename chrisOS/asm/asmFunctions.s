.extern kKernelPagedBaseAddress
.extern exceptionAX
.extern exceptionBX
.extern exceptionCX
.extern exceptionDX
.extern exceptionSI
.extern exceptionDI
.extern exceptionBP
.extern exceptionSavedESP
.extern exceptionCR0
.extern exceptionCR1
.extern exceptionCR2
.extern exceptionCR4

.intel_syntax noprefix
.section .text

.globl dumpregs
.type dumpregs, @function
dumpregs:
.code32
        mov exceptionAX, eax
        mov exceptionBX, ebx
        mov exceptionCX, ecx
        mov exceptionDX, edx
        mov exceptionSI, esi
        mov exceptionDI, edi
        mov exceptionBP, eax
        mov eax, cr0
        mov exceptionCR0, eax
        mov eax, cr3
        mov exceptionCR3, eax
        mov eax, cr4
        mov exceptionCR4, eax
        mov eax, exceptionAX
        ret 

.global storeGDT
.type storeGDT, @function
storeGDT:
.code32
    mov eax,[esp+4]
    sgdt [eax]
    ret
.global getCS
.type getCS, @function
getCS:
.code32
    push cs
    pop eax
    ret