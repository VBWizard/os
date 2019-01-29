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

.global getDS
.type getDS, @function
getDS:
.code32
    push DS
    pop eax
    ret

.global getES
.type getES, @function
getES:
.code32
    push ES
    pop eax
    ret

.global getFS
.type getFS, @function
getFS:
.code32
    push FS
    pop eax
    ret

.global getGS
.type getGS, @function
getGS:
.code32
    push GS
    pop eax
    ret

.global getSS
.type getSS, @function
getSS:
.code32
    push SS
    pop eax
    ret

.global getESP
.type getESP, @function
getESP:
.code32
    push ESP
    pop eax
    sub eax,4
    ret


.global getEFlags
.type getEFlags, @function
getEFlags:
.code32
    pushfd
    pop eax
    ret


.global enableCR0_WP
.type enableCR0_WP, @function
enableCR0_WP:
    push eax
    mov eax,cr0
    or eax,0x10000
    mov cr0,eax
    pop eax
    ret
