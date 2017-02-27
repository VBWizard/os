.intel_syntax noprefix
.section .asm
.extern bootGdt
.extern tos
.extern kAPICRegisterRemapAddress

.globl isE820Available
.type isE820Available, @function
isE820Available:
.code32
mov eax,0x10
mov ds,eax
mov saveESP, esp
mov sp, 0xfffc
call leaveProtMode
.code16
mov ax, 0x8000
mov ss, ax
pusha
mov eax,0x0000E820
mov edx, 0x534D4150
mov ebx, 0
mov ecx, 100
lea di, e820data
int 0x15
mov savedValue, eax
popa
.code32
call reenterProtMode
ret


.globl getInt12Memory
.type getInt12Memory, @function
getInt12Memory:
.code32
mov eax,0x10
mov ds,eax
mov saveESP, esp
mov sp, 0xfffc
call leaveProtMode
.code16
mov ax, 0x8000
mov ss, ax
int 0x12
movzx edx,ax
mov savedValue, edx
mov ax, 0x1112    
xor bl, bl    
int 0x10 
.code32
call reenterProtMode
ret
jmp hang
//background, do on team, etc.
.globl leaveProtMode
.type leaveProtMode, @function
leaveProtMode:
.code32
lgdt [rmGdtp]
jmp 0x8:Into16BitProt
Into16BitProt:
.code16
mov ax,0x10
mov ds, ax
mov gs, ax
mov fs, ax
mov es, ax
.code32
mov eax, cr0
and al, 0xFe
mov cr0, eax
.code32
jmp 0:LeaveProtModeJmp
LeaveProtModeJmp:
.code16
mov ax, 0
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax
sidt [saved_idt]
lidt [idt_real]
sgdt [saved_gdt16_lo]
.code16
mov ax,0
mov ss,ax
mov ds, ax
.code32
ret

.globl reenterProtMode
.type reenterProtMode, @function
reenterProtMode:
.code16
lgdt [saved_gdt16_lo]
lidt [saved_idt]
.code32
mov eax, cr0
or  al, 0x1
.code16
or  eax,0x10000   #clr 05/12/2016 - added wp bit
.code32
mov cr0, eax
.code16
ljmp 0x18:reenterProtModeJmp
reenterProtModeJmp:
.code32
mov ax,0x10
mov ds,ax
mov es,ax
mov gs,ax
lgdt [kernelGDT]
ljmp 0x8:reenterProtMode32Jmp
reenterProtMode32Jmp:
.code16
mov ax,0x10
mov ds,ax
mov ss,ax
mov es,ax
mov fs,ax
mov gs,ax
.code32
mov eax,savedValue
mov esp,saveESP
ret

.globl set_gdt
.type set_gdt, @function
set_gdt:
.code32
push eax
    mov eax,[esp+8]
    lgdt [eax]
    jmp 0x08:.reload_CS
.reload_CS:
    mov eax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    pop eax
    ret
hang:
    hlt
    jmp hang

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
    pop ebx
    pop eax
    pop ebp
    ret
 #Input
 # ebx   Desired PIT frequency in Hz
 .globl init_PIT
.type init_PIT, @function
init_PIT:
    push ebp
    mov ebp, esp
    # Do some checking
    mov ebx,[ebp+8]
    pushad
    mov eax,0x10000                   #eax = reload value for slowest possible frequency (65536)
    cmp ebx,18                        #Is the requested frequency too low?
    jbe .gotReloadValue               # yes, use slowest possible frequency
 
    mov eax,1                         #ax = reload value for fastest possible frequency (1)
    cmp ebx,1193181                   #Is the requested frequency too high?
    jae .gotReloadValue               # yes, use fastest possible frequency
 
    # Calculate the reload value
 
    mov eax,3579545
    mov edx,0                         #edx:eax = 3579545
    div ebx                           #eax = 3579545 / frequency, edx = remainder
    cmp edx,3579545 / 2               #Is the remainder more than half?
    jb .l1                            # no, round down
    inc eax                           # yes, round up
 .l1:
    mov ebx,3
    mov edx,0                         #edx:eax = 3579545 * 256 / frequency
    div ebx                           #eax = (3579545 * 256 / 3 * 256) / frequency
    cmp edx,3 / 2                     #Is the remainder more than half?
    jb .l2                            # no, round down
    inc eax                           # yes, round up
 .l2:
 
 
 # Store the reload value and calculate the actual frequency
 
 .gotReloadValue:
    push eax                          #Store reload_value for later
    mov [PIT_reload_value],ax         #Store the reload value for later
    mov ebx,eax                       #ebx = reload value
 
    mov eax,3579545
    mov edx,0                         #edx:eax = 3579545
    div ebx                           #eax = 3579545 / reload_value, edx = remainder
    cmp edx,3579545 / 2               #Is the remainder more than half?
    jb .l3                            # no, round down
    inc eax                           # yes, round up
 .l3:
    mov ebx,3
    mov edx,0                         #edx:eax = 3579545 / reload_value
    div ebx                           #eax = (3579545 / 3) / frequency
    cmp edx,3 / 2                     #Is the remainder more than half?
    jb .l4                            # no, round down
    inc eax                           # yes, round up
 .l4:
    mov [IRQ0_frequency],eax          #Store the actual frequency for displaying later
 
 
 # Calculate the amount of time between IRQs in 32.32 fixed point
 #
 # Note: The basic formula is:
 #           time in ms = reload_value / (3579545 / 3) * 1000
 #       This can be rearranged in the follow way:
 #           time in ms = reload_value * 3000 / 3579545
 #           time in ms = reload_value * 3000 / 3579545 * (2^42)/(2^42)
 #           time in ms = reload_value * 3000 * (2^42) / 3579545 / (2^42)
 #           time in ms * 2^32 = reload_value * 3000 * (2^42) / 3579545 / (2^42) * (2^32)
 #           time in ms * 2^32 = reload_value * 3000 * (2^42) / 3579545 / (2^10)
 
    pop ebx                           #ebx = reload_value
    mov eax,0xDBB3A062                #eax = 3000 * (2^42) / 3579545
    mul ebx                           #edx:eax = reload_value * 3000 * (2^42) / 3579545
    shrd eax,edx,10
    shr edx,10                        #edx:eax = reload_value * 3000 * (2^42) / 3579545 / (2^10)
 
    mov [IRQ0_ms],edx                 #Set whole ms between IRQs
    mov [IRQ0_fractions],eax          #Set fractions of 1 ms between IRQs
 
 
 # Program the PIT channel
 
    pushfd
    cli                               #Disabled interrupts (just in case)
 
    mov al,0b00110100                  #channel 0, lobyte/hibyte, rate generator
    out 0x43, al
 
    mov ax,[PIT_reload_value]         #ax = 16 bit reload value
    out 0x40,al                       #Set low byte of PIT reload value
    mov al,ah                         #ax = high 8 bits of reload value
    out 0x40,al                       #Set high byte of PIT reload value
 
    popfd
 
    popad
    pop ebp
    ret

 .globl getE820Memory_asm
.type getE820Memory_asm, @function
getE820Memory_asm:
.code32
mov eax,0x10
mov ds,eax
mov saveESP, esp
mov sp, 0xfff7
call leaveProtMode
pusha
.code16
lea eax, word ptr lowSmapTbl
.code32
movzx eax,ax
mov lowSmapTablePtr,eax
mov ax, 0
mov es, ax
mov ebx, 0
.code16
lea edi, word ptr [lowSmapTbl]
.code32:
getE820Memory_asm_getNext:
mov eax, 0xe820
mov edx, 0x534D4150
mov ecx, 0x24
int 0x15
add edi,24
cmp eax, 0x534D4150
jne getE820Memory_asm_exit
cmp ecx,20
jl getE820Memory_asm_exit
push eax
mov eax,recCnt
inc eax
mov recCnt, eax
pop eax
cmp ebx,0
je  getE820Memory_asm_exit
jmp getE820Memory_asm_getNext
getE820Memory_asm_exit:
mov eax,recCnt
mov savedValue, eax


popa
mov eax, savedValue
.code32
call reenterProtMode
ret

    saved_gdt16_lo: .word 0x0
    saved_gdt16_hi: .word 0
    saved_gdt16_hi2: .word 0
    saveESP: .word 0,0
    savedValue: .word 0, 0, 0, 0
    recCnt: .word 0
idt_real:
	.word 0x3ff, 0, 0
    retVal: .word 0
saved_idt:
        .word 0
        .word 0
        .word 0
e820data:
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
system_timer_fractions:  .word 0         # Fractions of 1 ms since timer initialized
                         .word 0
                         .word 0
                         .word 0
system_timer_ms:         .word 0          # Number of whole ms since timer initialized
                         .word 0
                         .word 0
                         .word 0
IRQ0_fractions:          .word 0          # Fractions of 1 ms between IRQs
                         .word 0
                         .word 0
                         .word 0
IRQ0_ms:                 .word 0          # Number of whole ms between IRQs
                         .word 0
                         .word 0
                         .word 0
IRQ0_frequency:          .word 0          # Actual frequency of PIT
                         .word 0
                         .word 0
                         .word 0
PIT_reload_value:        .word 0x12          # Current PIT reload value
                         .word 0
                         .word 0
                         .word 0
 .globl doPagingJump
.type doPagingJump, @function
doPagingJump:
.code32
cli #turn off interrupts until we get the IDT fixed up
ljmp 0x20:pagingEnableJmp
pagingEnableJmp:
push eax
mov ax, 0x10
mov ds, ax
mov es, ax
mov gs, ax
mov fs, ax
pop eax
ret
 .globl doNonPagingJump
.type doNonPagingJump, @function
doNonPagingJump:
ljmp 0x28:pagingDisableJmp1
pagingDisableJmp1:
push eax
mov eax,cr0
and eax,0x7FFFFFFF
mov cr0,eax
ljmp 0x28:pagingDisableJmp2
pagingDisableJmp2:
mov ax, 0x18
mov ds, ax
mov es, ax
mov gs, ax
mov fs, ax
pop eax
ret

    .globl lowSmapTablePtr
    .type lowSmapTablePtr, @common
    lowSmapTablePtr: .word 0,0, 0, 0
    lowSmapTbl: .zero 480
    .globl idtPtrToLoad
    .type idtPtrToLoad, @common
    idtPtrToLoad: .word 0,0,0,0


#Following code originates at: http://www.cs.usfca.edu/~cruse/cs630f06/smphello.s
#note: Each CPU must start at 0x1000 (4096) the way it is configured, so 
.section .asm
.att_syntax noprefix
.code16
#-----------------------------------------------------------------
msg:	.ascii	"Hello from processor"	# message from processor
pid:	.ascii	"   "			# buffer for CPU LocalID
	.ascii	"CR0="			# legend for CR0 display
msw:	.ascii	"xxxxxxxx \n\r"		# buffer for CR0 content
len:	.int	. - msg			# length of message text
att:	.byte	0x0B			# display attribute byte
msg2:   .ascii  "Waking up AP processors\n\r"
len2:   .int    . - msg2
att2:   .byte   0x0C
#-----------------------------------------------------------------
mutex:	.word	1			# mutual exclusion flag
.globl smpBootCPUCount
.type smpBootCPUCount, @common
smpBootCPUCount:	.word	0			# count of awakened APs
.globl smpBootCPUsStarted
.type smpBootCPUsStarted, @common
smpBootCPUsStarted:	.word	0			# count of finished APs
newSS:	.word	0x2000			# stack segment-address
#-----------------------------------------------------------------
.align	8	# quadword alignment (for optimal access)
theGDT:	.word	0x0000, 0x0000, 0x0000, 0x0000	# null descriptor	
	.equ	sel_FS, (.-theGDT)+0	# flat-segment's selector
	.word	0xFFFF, 0x0000, 0x9200, 0x008F	# flat descriptor
	.equ	limGDT, (.-theGDT)-1	# our GDT-segment's limit
#-----------------------------------------------------------------
regGDT:	.word	limGDT, theGDT, 0x0000	# image for GDTR register
.code32
#-----------------------------------------------------------------
#-----------------------------------------------------------------#-----------------------------------------------------------------

.global AP_startup
AP_startup:
movl     %esp, saveESP
//lea	tos, %esp		# and set up new stack
call    setup_timer_channel2
//call	display_APIC_LocalID
call	broadcast_AP_startup
call	delay_until_APs_halt
mov     $0x10, %eax
mov     %eax, %ds
mov     saveESP, %esp
ret
#-----------------------------------------------------------------
.global broadcast_AP_startup
broadcast_AP_startup:
#
# This procedure is called by the main CPU to awaken other CPUs.
#
	push	%ebx
	push	%ds

	# address the Local-APIC registers' page
	mov	$0x10, %ax
	mov	%ax, %ds
    	mov     kAPICRegisterRemapAddress, %ebx

	# issue an 'INIT' Inter-Processor Interrupt command
	mov	$0x000C4500, %eax	# broadcase INIT-IPI
	mov	%eax, 0x300(%ebx)	# to all-except-self
.B0:	bt	$12, 0x300(%ebx)	# command in progress?
	jc	.B0			# yes, spin till done

	# do ten-millisecond delay, allow time for APs to awaken
	mov	$10000, %eax		# number of microseconds
	call	delay_EAX_micro_secs	# for a programmed delay
	
	# finish the Intel 'MP Initialization Protocol'
	mov	$5, %ecx		# issue 'Startup' twice
#nxIPI:	mov	$0x000C4601, %eax	# broadcast Startup-IPI #startup IPI for base address of 4096
nxIPI:	mov	$0x000C4601, %eax	# broadcast Startup-IPI 
	mov	%eax, 0x300(%ebx)	# to all-except-self
.B1:	bt	$12, 0x300(%ebx)	# command in progress?
	jc	.B1			# yes, spin till done

	# delay for 200 microseconds	
	mov	$200, %eax		# number of microseconds
	call	delay_EAX_micro_secs	# for a programmed delay
	loop	nxIPI	
		
	pop	%ds
	pop	%ebx
	ret
#-----------------------------------------------------------------
delay_until_APs_halt:
#
# This procedure is called by the main CPU so that it will not
# terminate our program until the other CPUs have been halted.
#
.W0:	mov	smpBootCPUCount, %ax		# number of APs awoken
	sub	smpBootCPUsStarted, %ax		# less number finished
	jnz	.W0			# spin unless all done
	ret
#-----------------------------------------------------------------

setup_timer_channel2:
#
# This procedure initializes the 8254 Programmable Timer/Counter
# so Timer Channel 2 can be used in 'one-shot' timing durations.
#
	# enable the 8254 Channel-2 counter
	in	$0x61, %al		# get PORT_B settings
	and	$0xFD, %al		# turn PC speaker off
	or	$0x01, %al		# turn on Gate2 input
	out	%al, $0x61		# output new settings

	# program channel-2 for one-shot countdown
	mov	$0xB0, %al		# chn2, r/w LSB/MSB
	out	%al, $0x43		# issue PIT command
	ret

.code16
#-----------------------------------------------------------------
display_APIC_LocalID:
#
# This procedure is called by each processor in turn in order to
# allow it to read its processor-identification number (from its 
# private Local-APIC) and display that number using the ROM-BIOS 
# video services.  Because ROM-BIOS routines are not 'reentrant'
# it is necessary to employ a 'spinlock' to insure that only one
# processor at a time will be executing these ROM-BIOS services. 
#
	# read the Local-APIC ID-register
	push	%ds
	xor	%ax, %ax
	mov	%ax, %ds
	mov	$0xFEE00020, %ebx
	mov	(%ebx), %eax
	pop	%ds

	# acquire the spinlock -- allow only one CPU at a time
spin:	bt	$0, mutex
	jnc	spin
	lock	
	btr	$0, mutex
	jnc	spin

	# write CPU Local-APIC ID-number into shared buffer
	rol	$8, %eax		# get ID-number in AL
	and	$0xF, %al		# isolate lowest nybble

#unremark to have the first CPu clear the screen
        pusha
        cmp $0x1,%al
        ja overClearScreen
        call clearScreen
#jmp overClearScreen
	mov	$0x0F, %ah		# get display-page
	int	$0x10			# call video bios

	mov	$0x02, %ah		# set cursor position
        mov     $0,%bh
        mov     $0x2000,%dx
	int	$0x10			# call video bios
        mov     $0x3,ah
        int     $0x10
	mov	$0x1301, %ax		# write_string
	lea	msg2, %bp		# point ES:BP to string
	mov	len2, %cx		# number of characters
	mov	att2, %bl		# display attributes
	mov	$0x1301, %ax		# write_string
	int	$0x10			# call video bios 

overClearScreen:
        popa
        or	$'0', %al		# convert to numeral	
	movb	%al, pid		# write to shared buffer	
#jmp overPrinting
	# format the contents of register CR0 for display
	lea	msw, %di
	mov	%cr0, %eax
	call	eax2hex
	# display the information using ROM-BIOS routines
	mov	$0x0F, %ah		# get display-page
	int	$0x10			# call video bios

	mov	$0x03, %ah		# get cursor position
	int	$0x10			# call video bios

	mov	$0x1301, %ax		# write_string
	lea	msg, %bp		# point ES:BP to string
	mov	len, %cx		# number of characters
	mov	att, %bl		# display attributes
	mov	$0x1301, %ax		# write_string
	int	$0x10			# call video bios 
overPrinting:
	# release spinlock -- finished with 'non-reentrant' code
	lock 	
	bts 	$0, mutex

	ret
#-----------------------------------------------------------------
#=================================================================
#==  HERE IS THE CODE THAT EACH APPLICATION PROCESSOR EXECUTES  ==
#=================================================================
#-----------------------------------------------------------------
.code16
.globl initAP
.type initAP, @function
initAP:	cli
	mov	%cs, %ax		# address program's data
	mov	%ax, %ds		#    with DS register
	mov	%ax, %es		#    also ES register
	lock				# insure 'atomic' update
	incw	smpBootCPUCount			# increment count of APs

	# setup an exclusive stack-area for this processor
	mov	$0x1000, %ax		# paragraphs in segment
	xadd	%ax, newSS		# 'atomic' xchg-and-add
	mov	%ax, %ss		# segment-address in SS
	xor	%esp, %esp		# top-of-stack into ESP
        mov     $0,%esp
	call	allow_4GB_addressing	# adjust DS's seg-limit
#	call	display_APIC_LocalID	# display this CPU's ID

	# put this processor to sleep
	lock				# insure 'atomic' update
	incw	smpBootCPUsStarted			# increment count of APs

freeze:	cli				# do not awaken this CPU
	hlt				# 'fetch-execute' ceases	
	jmp	freeze			# just-in-case of an NMI

#-----------------------------------------------------------------
delay_EAX_micro_secs:
#
# This procedure creates a programmed delay for EAX microseconds.
#
	pushal

	mov	%eax, %ecx		# number of microseconds
	mov	$100000, %eax		# microseconds-per-second
	xor	%edx, %edx		# is extended to quadword
	div	%ecx			# division by double-word
	
	mov	%eax, %ecx		# input-frequency divisor
	mov	$1193182, %eax		# timer's input-frequency
	xor	%edx, %edx		# is extended to quadword
	div	%ecx			# division by double-word

	out	%al, $0x42		# transfer to Latch LSB
	xchg	%al, %ah		# LSB swapped with MSB
	out	%al, $0x42		# transfer to Latch MSB

.T0:	in	$0x61, %al		# check PORT_B settings
	test	$0x20, %al		# has counter2 expired?
	jz	.T0			# no, continue polling
	
	popal
	ret

#-----------------------------------------------------------------
allow_4GB_addressing:
#
# This procedure will be called by each processor in order to 
# raise the 'hidden' segment-limit in its DS segment-register
# which permits Local-APIC registers to be addressed with DS.   
#
	pushf				# preserve FLAGS settings
	push	%ds			# preserve DS contents

	cli				# no device interrupts

	mov	%cr0, %eax		# get machine status
	bts	$0, %eax		# set PE-bit to 1
	mov	%eax, %cr0		# enter protected mode
	lgdt	regGDT			# load GDTR register-image
	mov	$sel_FS, %ax		# address 4GB data-segment
	mov	%ax, %ds		#   with the DS register

	mov	%cr0, %eax		# get machine status
	btr	$0, %eax		# reset PE-bit to 0
	mov	%eax, %cr0		# leave protected mode
.code16		
	pop	%ds			# restore register DS
	popf				# restore FLAGS value
	ret				
#-----------------------------------------------------------------
eax2hex:  # converts value in EAX to hexadecimal string at DS:DI
	pusha	

	mov	$8, %cx
nxnyb:
	rol	$4, %eax
	mov	%al, %bl
	and	$0xF, %bx
	mov	hex(%bx), %dl
	mov	%dl, (%di)
	inc	%di
	loop	nxnyb	

	popa
	ret
#-----------------------------------------------------------------
hex:	.ascii	"0123456789ABCDEF"	# array of hex numerals

.intel_syntax noprefix
clearScreen:
    pusha

    mov ax, 0x0700  # function 07, AL=0 means scroll whole window
    mov bh, 0x07    # character attribute = white on black
    mov cx, 0x0000  # row = 0, col = 0
    mov dx, 0x184f  # row = 24 (0x18), col = 79 (0x4f)
    int 0x10        # call BIOS video interrupt
    mov ah,02
    mov bh,0
    mov dx,0
    int 0x10
    popa
    ret

.ORG 0xEE9D
stk: .rept 0xff 
.byte 0xFA 
.endr     #save an area for the real mode stack!