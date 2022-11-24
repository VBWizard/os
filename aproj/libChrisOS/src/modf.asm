.intel_syntax noprefix
#-----------------------------------------------------------------------------
# modf.asm - get floating point fractional and integer parts
# Ported from Al Maromaty's free C Runtime Library
#-----------------------------------------------------------------------------

.section .TEXT
.globl  modfasm
.type modfasm, @function
.globl  _modfasm
.type _modfasm, @function

modfasm:
_modfasm:
                push    ebp
                mov     ebp,esp
                push    edi                     # Save register edi
                fldd    [ebp+8]           # Load real from stack
                mov     edi,dword [ebp+16]      # Put integer address in edi
                fld    st(0)                     # Duplicate st
                frndint                         # Round to integer
                fcom    st(1)                     # Compare with orignal value
                fstsw   ax                      # Get the FPU status word
                testd    byte [ebp+15],0x80      # Test if number is negative
                jz      __fmodf1                # Re-direct if positive
                sahf                            # Store AH to flags
                jnb     __fmodf2                # Re-direct if greater or equal
                fld1                            # Load the constant 1
                fadd                            # Increment integer part
                jmp     __fmodf2                # End of case
__fmodf1:       sahf                            # Store AH to flags
                jna     __fmodf2                # Re-direct if less or equal
                fld1                            # Load constant 1
                fsub                            # Decrement integer part
__fmodf2:       fstd     [edi]             # Store integer part
                fsub                            # Subtract to get fraction
                pop     edi                     # Restore register edi
                mov     esp,ebp                 # Restore stack pointer
                pop     ebp
                ret