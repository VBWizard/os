.intel_syntax noprefix
.section .text
#.globl   _isr_wrapper
.align   4
.code32

.extern activateDebugger, kStopDebugging
.extern irq0_handler
.extern	kbd_handler
.extern call_gate_proc
.extern kTicksSinceStart
.extern kRTCTicksSinceStart
.extern kISRsSinceStart
.extern defaultISRHandler
.extern kInitDone
.extern doubleFaultHandler
.extern pagingExceptionHandler
.extern puts
.extern kKbdHandlerActivateDebugger
.extern exceptionCS, exceptionEIP, exceptionErrorCode, exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR1, exceptionCR4, exceptionDS, exceptionES, exceptionFS, exceptionGS, exceptionSS, exceptionNumber, exceptionCR2, exceptionSavedESP, exceptionFlags, exceptionSavedStack
.extern debugCS, debugEIP, debugErrorCode, debugAX, debugBX, debugCX, debugDX, debugSI, debugDI, debugBP, debugCR0, debugCR1, debugCR4, debugDS, debugES, debugFS, debugGS, debugSS, debugCR2, debugSavedESP, debugFlags, debugSavedStack, exceptionTR

irq13ESP: .WORD 0x00, 0x10, 0x10, 0x00
irq13SavedESP: .WORD 0,0,0,0
irq14ESP: .WORD 0x00, 0x10, 0x10, 0x00
irq14SavedESP: .WORD 0,0,0,0
espForFatalExceptions: .WORD 0x00, 0x10, 0x10, 0x00
savedESP: .WORD 0,0,0,0
bufr: .WORD 0,0,0,0,0,0,0,0
savedESP_irq0: .WORD 0,0,0,0,0,0,0,0
.global debugReturnFlags
debugReturnFlags: .WORD 0,0,0,0
debugESP: .WORD 0,0


.global _isr_00_wrapper        
_isr_00_wrapper:                #remapped to 0x0a
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x0                  # save exception number
        jmp isr_My_Common
.global _isr_02_wrapper        
_isr_02_wrapper:                #remapped to 0x0a
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x2                  # save exception number
        jmp isr_My_Common
.global _isr_03_wrapper        
_isr_03_wrapper:                #remapped to 0x0b
/*        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x3                  # save exception number
*/
        #NOTE: This just sets the trap flag, next IRQ 1 gets called (IRQ 31 for us
        orw [esp+8],0x100
        pusha
        call activateDebugger
 /*       jmp isr_My_Common
*/
        popa
        sti
        iretd
.global _isr_04_wrapper        
_isr_04_wrapper:                #remapped to 0x0c
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x4                  # save exception number
        jmp isr_My_Common
.global _isr_05_wrapper        
_isr_05_wrapper:                #remapped to 0x0d
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x5                  # save exception number
        jmp isr_My_Common
.global _isr_06_wrapper
_isr_06_wrapper:                #remapped to 0x0e
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x6                  # save exception number
        jmp isr_My_Common
.global _isr_07_wrapper        
_isr_07_wrapper:                #remapped to 0x0f
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x7                  # save exception number
        jmp isr_My_Common
.global _isr_08_wrapper                 #remapped to 0x10
_isr_08_wrapper:                
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x8                  # save exception number
        jmp isr_My_Common

#        mov exceptionSavedESP, esp
#        mov     savedESP, esp
#        mov     esp, espForFatalExceptions
        //push    ax                    #clr 05/20/2016- We're not going to recover from a double fault so don't try pushing things on the stack to save them because the stack may be corrupted
        //mov     ax, 8                  # save exception number
#cli;hlt;
#cli;hlt
#        push    ebp
#        mov     ebp, esp
#        push    ebx
#        mov ebx, [ebp+12]
#        mov exceptionFlags, ebx
#        mov bx, [ebp+8]
#        mov exceptionCS, bx
#        mov ebx, [ebp+4]
#        mov exceptionEIP, ebx
#        mov ebx, cr2
#        mov exceptionCR2, ebx
#        pop ebx
#        pop ebp
        //push bx                         #clr 05/20/2016- We're not going to recover from a double fault so don't try pushing things on the stack to save them because the stack may be corrupted
        mov bx,10
        mov ds,bx
        mov es,bx
        mov fs,bx
        mov gs,bx
        //pop bx                        #clr 05/20/2016- We're not going to recover from a double fault so don't try pushing things on the stack to save them because the stack may be corrupted
        call    doubleFaultHandler     # jump to the common code
.global _isr_09_wrapper                 #remapped to 0x11
_isr_09_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x9                  # save exception number
        jmp isr_My_Common
.global _isr_10_wrapper                 #remapped to 0x12
_isr_10_wrapper:                        
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xa                  # save exception number
        jmp isr_My_Common
.global _isr_11_wrapper                 #remapped to 0x13
_isr_11_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xb                  # save exception number
        jmp isr_My_Common
.global _isr_12_wrapper        
_isr_12_wrapper:                        #remapped to 0x14
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xc                  # save exception number
        jmp isr_My_Common
.global _isr_13_wrapper                 #remapped to 0x15
_isr_13_wrapper:
        mov ebp,0x10
        mov ds,ebp
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xd                  # save exception number
        jmp isr_My_Common
.global _isr_14_wrapper                 #remapped to 0x16
_isr_14_wrapper:
cli
mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xe                  # save exception number
isr_My_Common:
cli
        mov exceptionNumber,ax
        pushad                          # other regs because its an ISR
        mov eax,ds
        mov exceptionDS,eax
        mov exceptionBX, ebx
        mov exceptionCX, ecx
        mov exceptionDX, edx
        mov exceptionSI, esi
        mov exceptionDI, edi
        str exceptionTR
        mov eax, cr0
        mov exceptionCR0, eax
        mov eax, cr3
        mov exceptionCR3, eax
        mov eax, cr4
        mov exceptionCR4, eax
        mov eax,es
        mov exceptionES,eax
        mov eax,fs
        mov exceptionFS,eax
        mov eax,gs
        mov exceptionGS,eax
        mov eax,ss
        mov exceptionSS,eax
        mov eax, exceptionAX
        mov     bx, 0x10
        mov     ds, bx
        mov     es, bx                  # load ds and es with valid selector
	mov     gs, bx
    
    mov ebx,exceptionNumber
    mov bl,[_isr_has_errorCode+ebx]
    cmp bl,1
    je  getExceptionDetailsWithError
    mov ebx, [ebp+8]
    mov exceptionFlags, ebx
    mov bx, [ebp+4]
    mov exceptionCS, bx
    mov ebx, [ebp+0]
    mov exceptionEIP, ebx
    jmp saveTheStack

getExceptionDetailsWithError:
     mov ebx, [ebp+12]
     mov exceptionFlags, ebx
     mov bx, [ebp+8]
     mov exceptionCS, bx
     mov ebx, [ebp+4]
     mov exceptionEIP, ebx
     mov ebx, cr2
     mov exceptionCR2, ebx
     mov ebx, [ebp]
     movzx ebx,bx
     mov exceptionErrorCode, bx

saveTheStack:
#jmp overSaveTheStack
        mov esi, exceptionSavedESP
//        add esi, 16 #drop the 4 dwords that are passed to the proc
        mov edi, exceptionSavedStack
        mov ecx, 40
        cld
        rep movsd

        #Figure out which exception handler to call
overSaveTheStack:
        mov ax,exceptionNumber
        cmp ax,0xe
        jne notPagingHandler
        call pagingExceptionHandler
        jmp onTheWayOut

notPagingHandler:
toDefaultHandler:
        call defaultISRHandler
onTheWayOut:
        popad                           # restoring the regs
        mov esp, exceptionSavedESP
#        add esp, 4 #get rid of error code per prolog http://geezer.osdevbrasil.net/osd/intr/index.htm 9. If the exception pushed an error code, the handler must pop it now and discard it. 
        mov ebx,exceptionNumber
        mov bl,[_isr_has_errorCode+ebx]
        cmp bl,1
        jnz overCorrection
        add esp, 4 #get rid of error code per prolog http://geezer.osdevbrasil.net/osd/intr/index.htm 9. If the exception pushed an error code, the handler must pop it now and discard it. 
overCorrection:
        mov     bx, exceptionDS
        mov     ds, bx
        mov     bx, exceptionES
        mov     es, bx                  # load ds and es with valid selector
        mov     bx, exceptionFS
        mov     fs,bx
        mov     bx, exceptionGS
	mov     gs, bx
        mov ebp,exceptionBP
        mov ebx,exceptionBX
        mov eax, exceptionAX
        sti
        iretd

.global _isr_15_wrapper        
_isr_15_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0xf                  # save exception number
        jmp isr_My_Common
.global _isr_16_wrapper        
_isr_16_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x10                  # save exception number
        jmp isr_My_Common
.global _isr_17_wrapper        
_isr_17_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x11                  # save exception number
        jmp isr_My_Common
.global _isr_18_wrapper        
_isr_18_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x12                  # save exception number
        jmp isr_My_Common
.global _isr_19_wrapper        
_isr_19_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x13                  # save exception number
        jmp isr_My_Common
.global _isr_20_wrapper        
_isr_20_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x14                  # save exception number
        jmp isr_My_Common
.global _isr_21_wrapper        
_isr_21_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x15                  # save exception number
        jmp isr_My_Common
.global _isr_22_wrapper        
_isr_22_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x16                  # save exception number
        jmp isr_My_Common
.global _isr_23_wrapper        
_isr_23_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x17                  # save exception number
        jmp isr_My_Common
.global _isr_24_wrapper        
_isr_24_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x18                  # save exception number
        jmp isr_My_Common
.global _isr_25_wrapper        
_isr_25_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x19                  # save exception number
        jmp isr_My_Common
.global _isr_26_wrapper        
_isr_26_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x1a                  # save exception number
        jmp isr_My_Common
.global _isr_27_wrapper        
_isr_27_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x1b                  # save exception number
        jmp isr_My_Common
.global _isr_28_wrapper        
_isr_28_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x1c                  # save exception number
        jmp isr_My_Common
.global _isr_29_wrapper        
_isr_29_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x1d                  # save exception number
        jmp isr_My_Common
.global _isr_30_wrapper        
_isr_30_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x1e                  # save exception number
        jmp isr_My_Common
.global _isr_31_wrapper        
_isr_31_wrapper:                            #DEBUG EXCEPTION
cli
    mov debugBP,ebp
    mov debugSavedESP, esp
    mov debugESP,esp
    pushad
    mov ebp, debugESP
    
    mov debugBX, ebx
    mov ebx,debugSavedESP
    add ebx,12
    mov debugSavedESP,ebx
    mov ebx, [ebp+8]
    mov debugFlags, ebx
    mov debugReturnFlags,ebx
    movw bx, [ebp+4]
    movw debugCS, bx
    mov ebx, [ebp+0]
    mov debugEIP, ebx

    mov debugCX, ecx
    mov debugDX, edx
    mov debugSI, esi
    mov debugDI, edi
    mov debugAX,eax

    mov ax,ds
    mov debugDS,eax
    mov eax, cr0
    mov debugCR0, eax
    mov eax, cr3
    mov debugCR3, eax
    mov eax, cr4
    mov debugCR4, eax
    mov eax,es
    mov debugES,eax
    mov eax,fs
    mov debugFS,eax
    mov eax,gs
    mov debugGS,eax
    mov eax,ss
    mov debugSS,eax

    mov esi, debugSavedESP
    mov edi, debugSavedStack
    mov ecx, 30
    cld
    rep movsd
    call debugStep
    mov al,kStopDebugging
    cmp al,1
    jnz overStopDebugging
    call activateDebugger
    #reset the trap flag in the flags register.  20 bytes forward for the POPA and then 8 bytes for the CS/EIP
    andw [esp+0x28],0xFEFF
    mov eax,0
    mov kStopDebugging,eax

overStopDebugging:
    popa
    sti
    iretd
.global _isr_32_wrapper        
_isr_32_wrapper:
        mov exceptionSavedESP, esp
        mov exceptionAX,eax
        mov exceptionBP, ebp
        mov     ebp, esp
        mov     ax, 0x20                  # save exception number
        jmp isr_My_Common


.global _irq0_handler
_irq0_handler:                #remapped to 0x08
cli
#cli;hlt;
        push    ebp
        pushf
        mov     ebp, esp
        add ebp,4
        push eax
        mov ax,0xFFFF
cld
#cld #C code following the sysV ABI requires DF to be clear on function entry
        push    ebx
        mov ebx, [ebp+12]
        mov exceptionFlags, ebx
        mov bx, [ebp+8]
        mov exceptionCS, bx
        mov ebx, [ebp+4]
        mov exceptionEIP, ebx
        pop ebx
        pushad                          # other regs because its an ISR
         mov     bx, 0x10
        mov     ds, bx
        mov     es, bx                  # load ds and es with valid selector
	mov     gs, bx
        call    irq0_handler          # call actual ISR code
        popad  
mov al,0x20
out 0x20,al
//mov eax,0
//mov [0xa000B0],eax
        pop eax
        popf
        pop ebp                         # restoring the regs
        sti
        iretd
.global _isr_01_wrapper        
_isr_01_wrapper:                #KEYBOARD HANDLER
cli
#cli;hlt;
        //clear the trap flag if it is set
        //we'll re-set it later if need be
        //andw [esp+8],0xFEFF
        mov exceptionAX, eax
        mov exceptionBX, ebx
        mov exceptionCX, ecx
        mov exceptionDX, edx
        mov exceptionSI, esi
        mov exceptionDI, edi
        str exceptionTR
        mov exceptionBP, ebp
        mov eax, cr0
        mov exceptionCR0, eax
        mov eax, cr3
        mov exceptionCR3, eax
        mov eax, cr4
        mov exceptionCR4, eax
        mov eax, exceptionAX
        pushad
        pushf
        mov     ebp, esp
        add ebp,36
        mov ax,0x0001
cld
#cld #C code following the sysV ABI requires DF to be clear on function entry
        mov ebx, [ebp+8]
        mov exceptionFlags, ebx
        mov bx, [ebp+4]
        mov exceptionCS, bx
        mov ebx, [ebp+0]
        mov exceptionEIP, ebx
        mov ebx,ds
        mov exceptionDS,ebx
        mov     bx, 0x10
        mov     ds, bx
        call    kbd_handler          # call actual ISR code
        mov ebx,exceptionDS
        mov ds,bx
        popf
        popad  
mov al,0x20
out 0x20,al
        mov     al,kKbdHandlerActivateDebugger
        cmp     al,1
        jne done
        orw [esp+8],0x100
        mov al,0
        mov kKbdHandlerActivateDebugger,al
        mov eax,exceptionAX
done:
        sti
        iretd


.global _call_gate_wrapper
_call_gate_wrapper:
        push    ds
        push    es                      # saving segment registers and
        pushad                          # other regs because its an ISR
 #       call    call_gate_proc
        popad                           # restoring the regs
        pop     es
        pop     ds
        retf

        _isr_has_errorCode:  .byte      0,0,0,0,0,0,0,0, 1,0,1,1,1,1,1,0
                             .byte      0,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
.global _ltr
_ltr:
		push ax
		mov ax, 0x58
        ltr     ax
        pop ax
        ret
