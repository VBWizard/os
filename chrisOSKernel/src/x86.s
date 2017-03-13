.intel_syntax noprefix

.section .systemData, "xa"
.globl sysEnter_Vector
.type sysEnter_Vector, @function
sysEnter_Vector:
    push ecx
    push edx
    push ebp
    mov ebp,esp
    call sysEnterReturn
    add esp,4
    pop ebp
    pop edx
    pop ecx
    ret
sysEnterReturn:
    mov ebp,esp
    sysenter
.globl sysEnter_Vector

.org 0x100
.section .systemData
.globl _sysEnter
.type _sysEnter, @function
_sysEnter:
#    sti
    push ebp
    pusha
    pushfd
    push edx
    push ecx
    push ebx
    push eax
    call _sysCall
    pop eax
    pop eax
    pop eax
    pop eax
    popfd
    popa
    pop ebp
    mov edx,[ebp]
    mov ecx,ebp
    sysexit
.globl _sysEnter

.section .text
.globl set_gdt
.type set_gdt, @function
idtPtrToLoad: .word 0,0

set_gdt:
.code32
push eax
    mov eax, [esp + 0x8]
    lgdt [eax]
    pop eax
    jmp 0x20:.reload_CS
.reload_CS:
.code16
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
.code32
    ret

// Loads the IDT defined in '_idtp' into the processor.
// This is declared in C as 'extern void idt_load();'
.globl idt_load
.type idt_load, @function
idt_load:
    push ebp
    mov ebp, esp
    push eax
    push ebx
    cli
    mov eax,[ebp+12]    #size + bottom of offset
    mov ebx,[ebp+8]     #top of offset
    ror eax,16          #mov the size out of the way
    mov ax,bx           #move the top of the address
    ror eax,16
    shr ebx,16
    mov idtPtrToLoad,eax
    mov idtPtrToLoad+4,ebx
    //we always put our IDT in idtPtrToLoad before calling idt_load
//    mov eax, word ptr idtPtrToLoad
    lidt [idtPtrToLoad]
    sti
    pop ebx
    pop eax
    pop ebp
    ret
.globl idt_load
