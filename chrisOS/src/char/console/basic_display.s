	.file	"basic_display.c"
	.intel_syntax noprefix
	.text
	.align 16
	.globl	make_color
	.type	make_color, @function
make_color:
.LFB0:
	.cfi_startproc
	movzx	eax, BYTE PTR [esp+8]
	sal	eax, 4
	or	al, BYTE PTR [esp+4]
	ret
	.cfi_endproc
.LFE0:
	.size	make_color, .-make_color
	.align 16
	.globl	make_vgaentry
	.type	make_vgaentry, @function
make_vgaentry:
.LFB1:
	.cfi_startproc
	movzx	edx, BYTE PTR [esp+8]
	movsx	ax, BYTE PTR [esp+4]
	sal	edx, 8
	or	eax, edx
	ret
	.cfi_endproc
.LFE1:
	.size	make_vgaentry, .-make_vgaentry
	.align 16
	.globl	terminal_initialize
	.type	terminal_initialize, @function
terminal_initialize:
.LFB2:
	.cfi_startproc
	mov	DWORD PTR terminal_row, 0
	xor	ecx, ecx
	mov	DWORD PTR terminal_column, 0
	mov	BYTE PTR terminal_color, 14
	mov	DWORD PTR terminal_buffer, 753664
	.align 16
.L4:
	xor	eax, eax
	.align 16
.L5:
	lea	edx, [ecx+eax]
	add	eax, 1
	cmp	eax, 80
	mov	WORD PTR [edx+753664+edx], 3616
	jne	.L5
	add	ecx, 80
	cmp	ecx, 2000
	jne	.L4
	rep
	ret
	.cfi_endproc
.LFE2:
	.size	terminal_initialize, .-terminal_initialize
	.align 16
	.globl	terminal_setcolor
	.type	terminal_setcolor, @function
terminal_setcolor:
.LFB3:
	.cfi_startproc
	mov	eax, DWORD PTR [esp+4]
	mov	BYTE PTR terminal_color, al
	ret
	.cfi_endproc
.LFE3:
	.size	terminal_setcolor, .-terminal_setcolor
	.align 16
	.globl	terminal_putentryat
	.type	terminal_putentryat, @function
terminal_putentryat:
.LFB4:
	.cfi_startproc
	movzx	ecx, BYTE PTR [esp+8]
	mov	eax, DWORD PTR [esp+16]
	movsx	dx, BYTE PTR [esp+4]
	sal	ecx, 8
	lea	eax, [eax+eax*4]
	or	edx, ecx
	mov	ecx, DWORD PTR terminal_buffer
	sal	eax, 4
	add	eax, DWORD PTR [esp+12]
	mov	WORD PTR [ecx+eax*2], dx
	ret
	.cfi_endproc
.LFE4:
	.size	terminal_putentryat, .-terminal_putentryat
	.align 16
	.globl	terminal_putchar
	.type	terminal_putchar, @function
terminal_putchar:
.LFB5:
	.cfi_startproc
	sub	esp, 8
	.cfi_def_cfa_offset 12
	movsx	ax, BYTE PTR [esp+12]
	mov	DWORD PTR [esp], ebx
	mov	DWORD PTR [esp+4], esi
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	cmp	al, 10
	je	.L17
	mov	ecx, DWORD PTR terminal_row
	mov	ebx, DWORD PTR terminal_column
	lea	edx, [ecx+ecx*4]
	sal	edx, 4
	lea	esi, [edx+ebx]
	movzx	edx, BYTE PTR terminal_color
	sal	edx, 8
	or	eax, edx
	mov	edx, DWORD PTR terminal_buffer
	mov	WORD PTR [edx+esi*2], ax
	lea	eax, [ebx+1]
	cmp	eax, 80
	mov	DWORD PTR terminal_column, eax
	je	.L18
	mov	ebx, DWORD PTR [esp]
	mov	esi, DWORD PTR [esp+4]
	add	esp, 8
	.cfi_remember_state
	.cfi_restore 6
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L18:
	.cfi_restore_state
	add	ecx, 1
	xor	al, al
	mov	ebx, DWORD PTR [esp]
	cmp	ecx, 25
	mov	esi, DWORD PTR [esp+4]
	cmovne	eax, ecx
	mov	DWORD PTR terminal_column, 0
	mov	DWORD PTR terminal_row, eax
	add	esp, 8
	.cfi_remember_state
	.cfi_restore 3
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L17:
	.cfi_restore_state
	add	DWORD PTR terminal_row, 1
	mov	ebx, DWORD PTR [esp]
	mov	DWORD PTR terminal_column, 0
	mov	esi, DWORD PTR [esp+4]
	add	esp, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE5:
	.size	terminal_putchar, .-terminal_putchar
	.align 16
	.globl	terminal_writestring
	.type	terminal_writestring, @function
terminal_writestring:
.LFB6:
	.cfi_startproc
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	sub	esp, 20
	.cfi_def_cfa_offset 32
	mov	ebx, DWORD PTR [esp+32]
	mov	DWORD PTR [esp], ebx
	call	strlen
	test	eax, eax
	lea	esi, [ebx+eax]
	je	.L19
	.align 16
.L23:
	movsx	eax, BYTE PTR [ebx]
	add	ebx, 1
	mov	DWORD PTR [esp], eax
	call	terminal_putchar
	cmp	ebx, esi
	jne	.L23
.L19:
	add	esp, 20
	.cfi_def_cfa_offset 12
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE6:
	.size	terminal_writestring, .-terminal_writestring
	.align 16
	.globl	terminal_writestringf
	.type	terminal_writestringf, @function
terminal_writestringf:
.LFB7:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	xor	edi, edi
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 60
	.cfi_def_cfa_offset 80
	mov	ebx, DWORD PTR [esp+80]
	mov	DWORD PTR [esp], ebx
	call	strlen
	mov	esi, eax
	mov	eax, DWORD PTR [esp+84]
	mov	DWORD PTR [esp], eax
	call	strlen
	mov	DWORD PTR [esp+28], eax
	mov	eax, DWORD PTR [esp+88]
	mov	DWORD PTR [esp], eax
	call	strlen
	mov	BYTE PTR [esp+32], 0
	mov	BYTE PTR [esp+24], 0
	mov	DWORD PTR [esp+36], eax
	add	eax, DWORD PTR [esp+88]
	mov	DWORD PTR [esp+44], eax
	mov	eax, DWORD PTR [esp+28]
	add	eax, DWORD PTR [esp+84]
	test	esi, esi
	mov	DWORD PTR [esp+40], eax
	jne	.L40
	jmp	.L26
	.align 16
.L52:
	cmp	BYTE PTR [ebx+1+edi], 115
	lea	ecx, [edi+1]
	je	.L51
	mov	edi, ecx
.L29:
	mov	DWORD PTR [esp], edx
	call	terminal_putchar
.L32:
	cmp	esi, edi
	jbe	.L26
.L40:
	movsx	edx, BYTE PTR [ebx+edi]
	cmp	dl, 37
	je	.L52
	add	edi, 1
	jmp	.L29
	.align 16
.L51:
	cmp	BYTE PTR [esp+24], 0
	jne	.L30
	mov	edx, DWORD PTR [esp+28]
	mov	ebp, DWORD PTR [esp+84]
	test	edx, edx
	je	.L49
	mov	DWORD PTR [esp+24], ebx
	mov	ebx, ebp
	mov	ebp, DWORD PTR [esp+40]
	.align 16
.L41:
	movsx	edx, BYTE PTR [ebx]
	add	ebx, 1
	mov	DWORD PTR [esp], edx
	call	terminal_putchar
	cmp	ebx, ebp
	jne	.L41
	mov	ebx, DWORD PTR [esp+24]
.L49:
	add	edi, 2
	cmp	esi, edi
	mov	BYTE PTR [esp+24], 1
	ja	.L40
	.align 16
.L26:
	add	esp, 60
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.align 16
.L30:
	.cfi_restore_state
	cmp	BYTE PTR [esp+32], 0
	jne	.L53
	mov	eax, DWORD PTR [esp+36]
	mov	ebp, DWORD PTR [esp+88]
	test	eax, eax
	je	.L50
	mov	DWORD PTR [esp+32], ebx
	mov	ebx, ebp
	mov	ebp, DWORD PTR [esp+44]
	.align 16
.L42:
	movsx	edx, BYTE PTR [ebx]
	add	ebx, 1
	mov	DWORD PTR [esp], edx
	call	terminal_putchar
	cmp	ebx, ebp
	jne	.L42
	mov	ebx, DWORD PTR [esp+32]
.L50:
	add	edi, 2
	mov	BYTE PTR [esp+32], 1
	jmp	.L32
	.align 16
.L53:
	add	edi, 2
	jmp	.L32
	.cfi_endproc
.LFE7:
	.size	terminal_writestringf, .-terminal_writestringf
	.align 16
	.globl	sprintf
	.type	sprintf, @function
sprintf:
.LFB8:
	.cfi_startproc
	mov	eax, 1237
	ret
	.cfi_endproc
.LFE8:
	.size	sprintf, .-sprintf
	.comm	terminal_buffer,4,4
	.comm	terminal_color,1,1
	.comm	terminal_column,4,4
	.comm	terminal_row,4,4
	.ident	"GCC: (GNU) 4.7.2"
