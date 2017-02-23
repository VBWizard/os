.intel_syntax noprefix
.globl set_gdt
.type set_gdt, @function
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



