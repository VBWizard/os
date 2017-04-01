.intel_syntax noprefix
.section .text
.align   4
.code32

.extern isrSavedCS, isrSavedEIP, isrSavedErrorCode, isrSavedEAX, isrSavedEBX, isrSavedECX, isrSavedEDX, isrSavedESI, isrSavedEDI, isrSavedEBP, isrSavedCR0, isrSavedCR1, isrSavedCR4, isrSavedDS, isrSavedES, isrSavedFS, isrSavedGS, isrSavedSS, isrSavedNumber, isrSavedCR2, isrSavedESP, isrSavedFlags, isrSavedStack
.extern debugCS, debugEIP, debugErrorCode, debugAX, debugBX, debugCX, debugDX, debugSI, debugDI, debugBP, debugCR0, debugCR1, debugCR4, debugDS, debugES, debugFS, debugGS, debugSS, debugCR2, debugSavedESP, debugFlags, debugSavedStack, isrSavedTR
.extern kIRQ0_handler
.extern _sysCall
.extern schedulerTaskSwitched
.extern kTaskSwitchCount
.extern kDebugLevel
.extern kTicksSinceStart
.extern nextScheduleTicks
.extern kKernelCR3
.extern keyboardHandlerRoutine
.extern call defaultISRHandler


isrNumber: .word 0,0
tempEAX: .word 0,0
.globl alltraps
.type alltraps, @function
alltraps:
    #NOTE: CLI not necessary, Interrupt Gate
    push eax
    push ebx
    mov eax,0x10
    mov ebx,ds
    mov ds,eax
    mov isrSavedDS,ebx
    pop ebx
    pop eax
    mov isrSavedEAX,eax
    mov eax,[esp]
    mov isrNumber,eax         #second vector push was ISR #
    mov eax,esp
    add eax,8                 #Get rid of the vector parameters in the saved esp
    mov isrSavedESP,eax
    mov eax,cr3
    mov isrSavedCR3,eax
    mov isrSavedEBP, ebp
    mov ebp,esp
    add ebp,8
    mov eax,ss
    mov isrSavedSS,eax
    mov eax,isrSavedEAX
    pushad                          # other regs because its an ISR
    mov isrSavedEBX,ebx
    mov isrSavedECX,ecx

    mov isrSavedEDX,edx
    mov isrSavedESI,esi
    mov isrSavedEDI,edi
    mov eax,es
    mov isrSavedES,eax
    mov eax,fs
    mov isrSavedFS,eax
    mov eax,gs
    mov isrSavedGS,eax
    #Save the task register
    str isrSavedTR
    mov eax,0x10
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov eax,0x18
    mov ss,eax
    #Save control registers
    #No need to do this as they won't change
    #Save general registers
    #no need to do this, they are already on the stack! (pushad)
    mov ebx, [ebp+8]
    mov isrSavedFlags, ebx
    mov ebx, [ebp+4]
    mov isrSavedCS, ebx
    mov ebx, [ebp]
    mov isrSavedEIP, ebx
    mov ebx, cr2
    mov isrSavedCR2, ebx
    mov ebx,isrNumber
    mov bl,[_isr_has_errorCode+ebx]
    cmp bl,1
    jne  saveTheStack
getExceptionDetailsWithError:
     mov ebx, [ebp-4]
     movzx ebx,bx
     mov isrSavedErrorCode, bx
saveTheStack:
jmp overSaveTheStack
    mov eax,isrNumber
    cmp eax,0x20                
    jge overSaveTheStack        #CLR 03/26/2017: Changed (je to jge) to skip stack capture for 0x20 (IRQ0) & 0x21 (KBD) (not sure what else)
    mov esi, isrSavedESP
    add esi,12                  #drop the eip/cs/flags from the call to this proc
    mov edi, isrSavedStack
    mov ecx, 40       #NOTE: This can cause an exception if the target's esp is within 40 bytes of non-mapped memory
    cld
    rep movsd
overSaveTheStack:
    mov eax,isrNumber
    cmp eax,0x20
    jne notIRQ0Handler
    call kIRQ0_handler
    jmp ckeckForIRQResponse
notIRQ0Handler:
    cmp eax,0xd
    jne notGPF
    call defaultISRHandler
    cli
    hlt
notGPF:
    cmp eax,0xe
    jne notPagingHandler

pagingHandler:
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
    mov ebx,isrSavedCS
    mov exceptionCS,ebx
    mov ebx,isrSavedEIP
    mov exceptionEIP,ebx
    mov ebx,isrSavedESP
    mov exceptionSavedESP,ebx
    mov ebx,isrSavedEBP
    mov exceptionBP,ebx
    mov ebx,isrSavedCR2
    mov exceptionCR2,ebx
    mov ebx,isrSavedErrorCode
    mov exceptionErrorCode,ebx
    mov ebx,isrSavedEAX
    mov exceptionAX,ebx
    mov ebx,isrSavedEBX
    mov exceptionBX,ebx
    call kPagingExceptionHandler
    jmp ckeckForIRQResponse
notPagingHandler:
    cmp eax,0x80
    jne notSysCallHandler

sysCallHandler:
    mov eax,cr3
    push eax
    mov eax,kKernelCR3
    pushd isrSavedEDX
    pushd isrSavedECX
    pushd isrSavedEBX
    pushd isrSavedEAX
    call _sysCall
    add esp,16                      #get rid of the registers we pushed on the stack before calling sysCall
    pop eax                         #pop cr3
    mov cr3,eax
    jmp noIRQResponseRequired
notSysCallHandler:
    cmp ax,21
    jne notKbdHandler
    mov eax,keyboardHandlerRoutine
    cmp eax,0
    je  kbdError
    call eax
    mov al,0x20
    out 0x20,al
    jmp noIRQResponseRequired
kbdError:
    jmp kbdError
notKbdHandler:
    call defaultISRHandler
ckeckForIRQResponse:
    mov eax,isrNumber
    cmp eax,0x20                    #If this is the IRQ0 exception, respond to the PIC
    jne noIRQResponseRequired
    mov al,0x20
    out 0x20,al
noIRQResponseRequired:
    popad                           # restoring the regs - only EBX and ESP modified after this point
    #dont' need to release vector parameters because we did when we saved the ESP
    #add esp,8                   #release the vector parameters from the stack
    mov bx, isrSavedDS
    mov ds, bx
    mov bx, isrSavedES
    mov es, bx                  # load ds and es with valid selector
    mov bx, isrSavedFS
    mov fs,bx
    mov bx, isrSavedGS
    mov gs, bx
    mov ebp,isrSavedEBP
    #Adjust the stack if the exception had an error code (get rid of error code per prolog http://geezer.osdevbrasil.net/osd/intr/index.htm 9. If the exception pushed an error code, the handler must pop it now and discard it. )
    mov esp, isrSavedESP
    mov ebx,isrNumber
    mov bl,[_isr_has_errorCode+ebx]
    cmp bl,1
    jnz overCorrection
    add esp, 4 #get rid of error code per prolog http://geezer.osdevbrasil.net/osd/intr/index.htm 9. If the exception pushed an error code, the handler must pop it now and discard it. 
overCorrection:
    mov al,schedulerTaskSwitched
    cmp al,0
    mov eax, isrSavedEAX
    mov ebx,isrSavedEBX
    jnz newTaskLoaded
    iretd

newTaskLoaded:
    #Stack is already where it was when we started the ISR
    #reset the task switched indicator
    mov eax,0
    mov schedulerTaskSwitched,eax
    mov eax,kTaskSwitchCount
    inc eax
    mov kTaskSwitchCount,eax
    #Restore the CR3 if it differs from the current one
restoreCR3:
    mov eax,isrSavedCR3
    mov ebx,cr3
    cmp eax,ebx
    jz  overSetCR3
    mov CR3, eax

overSetCR3:
    mov eax, isrSavedEAX
    iretd

.globl vector0
vector0:
  pushd 0
  pushd 0
  jmp alltraps
.globl vector1
vector1:
  pushd 0
  pushd 1
  jmp alltraps
.globl vector2
vector2:
  pushd 0
  pushd 2
  jmp alltraps
.globl vector3
vector3:
  pushd 0
  pushd 3
  jmp alltraps
.globl vector4
vector4:
  pushd 0
  pushd 4
  jmp alltraps
.globl vector5
vector5:
  pushd 0
  pushd 5
  jmp alltraps
.globl vector6
vector6:
  pushd 0
  pushd 6
  jmp alltraps
.globl vector7
vector7:
  pushd 0
  pushd 7
  jmp alltraps
.globl vector8
vector8:
  pushd 8
  jmp alltraps
.globl vector9
vector9:
  pushd 0
  pushd 9
  jmp alltraps
.globl vector10
vector10:
  pushd 10
  jmp alltraps
.globl vector11
vector11:
  pushd 11
  jmp alltraps
.globl vector12
vector12:
  pushd 12
  jmp alltraps
.globl vector13
vector13:
  pushd 13
  jmp alltraps
.globl vector14
vector14:
  pushd 14
  jmp alltraps
.globl vector15
vector15:
  pushd 0
  pushd 15
  jmp alltraps
.globl vector16
vector16:
  pushd 0
  pushd 16
  jmp alltraps
.globl vector17
vector17:
  pushd 17
  jmp alltraps
.globl vector18
vector18:
  pushd 0
  pushd 18
  jmp alltraps
.globl vector19
vector19:
  pushd 0
  pushd 19
  jmp alltraps
.globl vector20
vector20:
  pushd 0
  pushd 20
  jmp alltraps
.globl vector21
vector21:
  pushd 0
  pushd 21
  jmp alltraps
.globl vector22
vector22:
  pushd 0
  pushd 22
  jmp alltraps
.globl vector23
vector23:
  pushd 0
  pushd 23
  jmp alltraps
.globl vector24
vector24:
  pushd 0
  pushd 24
  jmp alltraps
.globl vector25
vector25:
  pushd 0
  pushd 25
  jmp alltraps
.globl vector26
vector26:
  pushd 0
  pushd 26
  jmp alltraps
.globl vector27
vector27:
  pushd 0
  pushd 27
  jmp alltraps
.globl vector28
vector28:
  pushd 0
  pushd 28
  jmp alltraps
.globl vector29
vector29:
  pushd 0
  pushd 29
  jmp alltraps
.globl vector30
vector30:
  pushd 0
  pushd 30
  jmp alltraps
.globl vector31
vector31:
  pushd 0
  pushd 31
  jmp alltraps
.globl vector32
vector32:
  pushd 0
  pushd 32
  jmp alltraps
.globl vector33
vector33:
  pushd 0
  pushd 33
  jmp alltraps
.globl vector34
vector34:
  pushd 0
  pushd 34
  jmp alltraps
.globl vector35
vector35:
  pushd 0
  pushd 35
  jmp alltraps
.globl vector36
vector36:
  pushd 0
  pushd 36
  jmp alltraps
.globl vector37
vector37:
  pushd 0
  pushd 37
  jmp alltraps
.globl vector38
vector38:
  pushd 0
  pushd 38
  jmp alltraps
.globl vector39
vector39:
  pushd 0
  pushd 39
  jmp alltraps
.globl vector40
vector40:
  pushd 0
  pushd 40
  jmp alltraps
.globl vector41
vector41:
  pushd 0
  pushd 41
  jmp alltraps
.globl vector42
vector42:
  pushd 0
  pushd 42
  jmp alltraps
.globl vector43
vector43:
  pushd 0
  pushd 43
  jmp alltraps
.globl vector44
vector44:
  pushd 0
  pushd 44
  jmp alltraps
.globl vector45
vector45:
  pushd 0
  pushd 45
  jmp alltraps
.globl vector46
vector46:
  pushd 0
  pushd 46
  jmp alltraps
.globl vector47
vector47:
  pushd 0
  pushd 47
  jmp alltraps
.globl vector48
vector48:
  pushd 0
  pushd 48
  jmp alltraps
.globl vector49
vector49:
  pushd 0
  pushd 49
  jmp alltraps
.globl vector50
vector50:
  pushd 0
  pushd 50
  jmp alltraps
.globl vector51
vector51:
  pushd 0
  pushd 51
  jmp alltraps
.globl vector52
vector52:
  pushd 0
  pushd 52
  jmp alltraps
.globl vector53
vector53:
  pushd 0
  pushd 53
  jmp alltraps
.globl vector54
vector54:
  pushd 0
  pushd 54
  jmp alltraps
.globl vector55
vector55:
  pushd 0
  pushd 55
  jmp alltraps
.globl vector56
vector56:
  pushd 0
  pushd 56
  jmp alltraps
.globl vector57
vector57:
  pushd 0
  pushd 57
  jmp alltraps
.globl vector58
vector58:
  pushd 0
  pushd 58
  jmp alltraps
.globl vector59
vector59:
  pushd 0
  pushd 59
  jmp alltraps
.globl vector60
vector60:
  pushd 0
  pushd 60
  jmp alltraps
.globl vector61
vector61:
  pushd 0
  pushd 61
  jmp alltraps
.globl vector62
vector62:
  pushd 0
  pushd 62
  jmp alltraps
.globl vector63
vector63:
  pushd 0
  pushd 63
  jmp alltraps
.globl vector64
vector64:
  pushd 0
  pushd 64
  jmp alltraps
.globl vector65
vector65:
  pushd 0
  pushd 65
  jmp alltraps
.globl vector66
vector66:
  pushd 0
  pushd 66
  jmp alltraps
.globl vector67
vector67:
  pushd 0
  pushd 67
  jmp alltraps
.globl vector68
vector68:
  pushd 0
  pushd 68
  jmp alltraps
.globl vector69
vector69:
  pushd 0
  pushd 69
  jmp alltraps
.globl vector70
vector70:
  pushd 0
  pushd 70
  jmp alltraps
.globl vector71
vector71:
  pushd 0
  pushd 71
  jmp alltraps
.globl vector72
vector72:
  pushd 0
  pushd 72
  jmp alltraps
.globl vector73
vector73:
  pushd 0
  pushd 73
  jmp alltraps
.globl vector74
vector74:
  pushd 0
  pushd 74
  jmp alltraps
.globl vector75
vector75:
  pushd 0
  pushd 75
  jmp alltraps
.globl vector76
vector76:
  pushd 0
  pushd 76
  jmp alltraps
.globl vector77
vector77:
  pushd 0
  pushd 77
  jmp alltraps
.globl vector78
vector78:
  pushd 0
  pushd 78
  jmp alltraps
.globl vector79
vector79:
  pushd 0
  pushd 79
  jmp alltraps
.globl vector80
vector80:
  pushd 0
  pushd 80
  jmp alltraps
.globl vector81
vector81:
  pushd 0
  pushd 81
  jmp alltraps
.globl vector82
vector82:
  pushd 0
  pushd 82
  jmp alltraps
.globl vector83
vector83:
  pushd 0
  pushd 83
  jmp alltraps
.globl vector84
vector84:
  pushd 0
  pushd 84
  jmp alltraps
.globl vector85
vector85:
  pushd 0
  pushd 85
  jmp alltraps
.globl vector86
vector86:
  pushd 0
  pushd 86
  jmp alltraps
.globl vector87
vector87:
  pushd 0
  pushd 87
  jmp alltraps
.globl vector88
vector88:
  pushd 0
  pushd 88
  jmp alltraps
.globl vector89
vector89:
  pushd 0
  pushd 89
  jmp alltraps
.globl vector90
vector90:
  pushd 0
  pushd 90
  jmp alltraps
.globl vector91
vector91:
  pushd 0
  pushd 91
  jmp alltraps
.globl vector92
vector92:
  pushd 0
  pushd 92
  jmp alltraps
.globl vector93
vector93:
  pushd 0
  pushd 93
  jmp alltraps
.globl vector94
vector94:
  pushd 0
  pushd 94
  jmp alltraps
.globl vector95
vector95:
  pushd 0
  pushd 95
  jmp alltraps
.globl vector96
vector96:
  pushd 0
  pushd 96
  jmp alltraps
.globl vector97
vector97:
  pushd 0
  pushd 97
  jmp alltraps
.globl vector98
vector98:
  pushd 0
  pushd 98
  jmp alltraps
.globl vector99
vector99:
  pushd 0
  pushd 99
  jmp alltraps
.globl vector100
vector100:
  pushd 0
  pushd 100
  jmp alltraps
.globl vector101
vector101:
  pushd 0
  pushd 101
  jmp alltraps
.globl vector102
vector102:
  pushd 0
  pushd 102
  jmp alltraps
.globl vector103
vector103:
  pushd 0
  pushd 103
  jmp alltraps
.globl vector104
vector104:
  pushd 0
  pushd 104
  jmp alltraps
.globl vector105
vector105:
  pushd 0
  pushd 105
  jmp alltraps
.globl vector106
vector106:
  pushd 0
  pushd 106
  jmp alltraps
.globl vector107
vector107:
  pushd 0
  pushd 107
  jmp alltraps
.globl vector108
vector108:
  pushd 0
  pushd 108
  jmp alltraps
.globl vector109
vector109:
  pushd 0
  pushd 109
  jmp alltraps
.globl vector110
vector110:
  pushd 0
  pushd 110
  jmp alltraps
.globl vector111
vector111:
  pushd 0
  pushd 111
  jmp alltraps
.globl vector112
vector112:
  pushd 0
  pushd 112
  jmp alltraps
.globl vector113
vector113:
  pushd 0
  pushd 113
  jmp alltraps
.globl vector114
vector114:
  pushd 0
  pushd 114
  jmp alltraps
.globl vector115
vector115:
  pushd 0
  pushd 115
  jmp alltraps
.globl vector116
vector116:
  pushd 0
  pushd 116
  jmp alltraps
.globl vector117
vector117:
  pushd 0
  pushd 117
  jmp alltraps
.globl vector118
vector118:
  pushd 0
  pushd 118
  jmp alltraps
.globl vector119
vector119:
  pushd 0
  pushd 119
  jmp alltraps
.globl vector120
vector120:
  pushd 0
  pushd 120
  jmp alltraps
.globl vector121
vector121:
  pushd 0
  pushd 121
  jmp alltraps
.globl vector122
vector122:
  pushd 0
  pushd 122
  jmp alltraps
.globl vector123
vector123:
  pushd 0
  pushd 123
  jmp alltraps
.globl vector124
vector124:
  pushd 0
  pushd 124
  jmp alltraps
.globl vector125
vector125:
  pushd 0
  pushd 125
  jmp alltraps
.globl vector126
vector126:
  pushd 0
  pushd 126
  jmp alltraps
.globl vector127
vector127:
  pushd 0
  pushd 127
  jmp alltraps
.globl vector128
vector128:
//  pushd 0
//  pushd 128
//  jmp alltraps
    mov isrSavedEAX,eax
    mov isrSavedEBX,ebx
    mov isrSavedECX,ecx
    mov isrSavedEDX,edx
    pushad
    pushfd
    mov eax,cr3
    push eax
    mov eax,kKernelCR3
    pushd isrSavedEDX
    pushd isrSavedECX
    pushd isrSavedEBX
    pushd isrSavedEAX
    call _sysCall
    mov isrSavedEAX,eax
    add esp,16                      #get rid of the registers we pushed on the stack before calling sysCall
    pop eax                         #pop cr3
    mov cr3,eax
    popfd
    popad
    mov eax,isrSavedEAX
    iret
.globl vector129
vector129:
  pushd 0
  pushd 129
  jmp alltraps
.globl vector130
vector130:
  pushd 0
  pushd 130
  jmp alltraps
.globl vector131
vector131:
  pushd 0
  pushd 131
  jmp alltraps
.globl vector132
vector132:
  pushd 0
  pushd 132
  jmp alltraps
.globl vector133
vector133:
  pushd 0
  pushd 133
  jmp alltraps
.globl vector134
vector134:
  pushd 0
  pushd 134
  jmp alltraps
.globl vector135
vector135:
  pushd 0
  pushd 135
  jmp alltraps
.globl vector136
vector136:
  pushd 0
  pushd 136
  jmp alltraps
.globl vector137
vector137:
  pushd 0
  pushd 137
  jmp alltraps
.globl vector138
vector138:
  pushd 0
  pushd 138
  jmp alltraps
.globl vector139
vector139:
  pushd 0
  pushd 139
  jmp alltraps
.globl vector140
vector140:
  pushd 0
  pushd 140
  jmp alltraps
.globl vector141
vector141:
  pushd 0
  pushd 141
  jmp alltraps
.globl vector142
vector142:
  pushd 0
  pushd 142
  jmp alltraps
.globl vector143
vector143:
  pushd 0
  pushd 143
  jmp alltraps
.globl vector144
vector144:
  pushd 0
  pushd 144
  jmp alltraps
.globl vector145
vector145:
  pushd 0
  pushd 145
  jmp alltraps
.globl vector146
vector146:
  pushd 0
  pushd 146
  jmp alltraps
.globl vector147
vector147:
  pushd 0
  pushd 147
  jmp alltraps
.globl vector148
vector148:
  pushd 0
  pushd 148
  jmp alltraps
.globl vector149
vector149:
  pushd 0
  pushd 149
  jmp alltraps
.globl vector150
vector150:
  pushd 0
  pushd 150
  jmp alltraps
.globl vector151
vector151:
  pushd 0
  pushd 151
  jmp alltraps
.globl vector152
vector152:
  pushd 0
  pushd 152
  jmp alltraps
.globl vector153
vector153:
  pushd 0
  pushd 153
  jmp alltraps
.globl vector154
vector154:
  pushd 0
  pushd 154
  jmp alltraps
.globl vector155
vector155:
  pushd 0
  pushd 155
  jmp alltraps
.globl vector156
vector156:
  pushd 0
  pushd 156
  jmp alltraps
.globl vector157
vector157:
  pushd 0
  pushd 157
  jmp alltraps
.globl vector158
vector158:
  pushd 0
  pushd 158
  jmp alltraps
.globl vector159
vector159:
  pushd 0
  pushd 159
  jmp alltraps
.globl vector160
vector160:
  pushd 0
  pushd 160
  jmp alltraps
.globl vector161
vector161:
  pushd 0
  pushd 161
  jmp alltraps
.globl vector162
vector162:
  pushd 0
  pushd 162
  jmp alltraps
.globl vector163
vector163:
  pushd 0
  pushd 163
  jmp alltraps
.globl vector164
vector164:
  pushd 0
  pushd 164
  jmp alltraps
.globl vector165
vector165:
  pushd 0
  pushd 165
  jmp alltraps
.globl vector166
vector166:
  pushd 0
  pushd 166
  jmp alltraps
.globl vector167
vector167:
  pushd 0
  pushd 167
  jmp alltraps
.globl vector168
vector168:
  pushd 0
  pushd 168
  jmp alltraps
.globl vector169
vector169:
  pushd 0
  pushd 169
  jmp alltraps
.globl vector170
vector170:
  pushd 0
  pushd 170
  jmp alltraps
.globl vector171
vector171:
  pushd 0
  pushd 171
  jmp alltraps
.globl vector172
vector172:
  pushd 0
  pushd 172
  jmp alltraps
.globl vector173
vector173:
  pushd 0
  pushd 173
  jmp alltraps
.globl vector174
vector174:
  pushd 0
  pushd 174
  jmp alltraps
.globl vector175
vector175:
  pushd 0
  pushd 175
  jmp alltraps
.globl vector176
vector176:
  pushd 0
  pushd 176
  jmp alltraps
.globl vector177
vector177:
  pushd 0
  pushd 177
  jmp alltraps
.globl vector178
vector178:
  pushd 0
  pushd 178
  jmp alltraps
.globl vector179
vector179:
  pushd 0
  pushd 179
  jmp alltraps
.globl vector180
vector180:
  pushd 0
  pushd 180
  jmp alltraps
.globl vector181
vector181:
  pushd 0
  pushd 181
  jmp alltraps
.globl vector182
vector182:
  pushd 0
  pushd 182
  jmp alltraps
.globl vector183
vector183:
  pushd 0
  pushd 183
  jmp alltraps
.globl vector184
vector184:
  pushd 0
  pushd 184
  jmp alltraps
.globl vector185
vector185:
  pushd 0
  pushd 185
  jmp alltraps
.globl vector186
vector186:
  pushd 0
  pushd 186
  jmp alltraps
.globl vector187
vector187:
  pushd 0
  pushd 187
  jmp alltraps
.globl vector188
vector188:
  pushd 0
  pushd 188
  jmp alltraps
.globl vector189
vector189:
  pushd 0
  pushd 189
  jmp alltraps
.globl vector190
vector190:
  pushd 0
  pushd 190
  jmp alltraps
.globl vector191
vector191:
  pushd 0
  pushd 191
  jmp alltraps
.globl vector192
vector192:
  pushd 0
  pushd 192
  jmp alltraps
.globl vector193
vector193:
  pushd 0
  pushd 193
  jmp alltraps
.globl vector194
vector194:
  pushd 0
  pushd 194
  jmp alltraps
.globl vector195
vector195:
  pushd 0
  pushd 195
  jmp alltraps
.globl vector196
vector196:
  pushd 0
  pushd 196
  jmp alltraps
.globl vector197
vector197:
  pushd 0
  pushd 197
  jmp alltraps
.globl vector198
vector198:
  pushd 0
  pushd 198
  jmp alltraps
.globl vector199
vector199:
  pushd 0
  pushd 199
  jmp alltraps
.globl vector200
vector200:
  pushd 0
  pushd 200
  jmp alltraps
.globl vector201
vector201:
  pushd 0
  pushd 201
  jmp alltraps
.globl vector202
vector202:
  pushd 0
  pushd 202
  jmp alltraps
.globl vector203
vector203:
  pushd 0
  pushd 203
  jmp alltraps
.globl vector204
vector204:
  pushd 0
  pushd 204
  jmp alltraps
.globl vector205
vector205:
  pushd 0
  pushd 205
  jmp alltraps
.globl vector206
vector206:
  pushd 0
  pushd 206
  jmp alltraps
.globl vector207
vector207:
  pushd 0
  pushd 207
  jmp alltraps
.globl vector208
vector208:
  pushd 0
  pushd 208
  jmp alltraps
.globl vector209
vector209:
  pushd 0
  pushd 209
  jmp alltraps
.globl vector210
vector210:
  pushd 0
  pushd 210
  jmp alltraps
.globl vector211
vector211:
  pushd 0
  pushd 211
  jmp alltraps
.globl vector212
vector212:
  pushd 0
  pushd 212
  jmp alltraps
.globl vector213
vector213:
  pushd 0
  pushd 213
  jmp alltraps
.globl vector214
vector214:
  pushd 0
  pushd 214
  jmp alltraps
.globl vector215
vector215:
  pushd 0
  pushd 215
  jmp alltraps
.globl vector216
vector216:
  pushd 0
  pushd 216
  jmp alltraps
.globl vector217
vector217:
  pushd 0
  pushd 217
  jmp alltraps
.globl vector218
vector218:
  pushd 0
  pushd 218
  jmp alltraps
.globl vector219
vector219:
  pushd 0
  pushd 219
  jmp alltraps
.globl vector220
vector220:
  pushd 0
  pushd 220
  jmp alltraps
.globl vector221
vector221:
  pushd 0
  pushd 221
  jmp alltraps
.globl vector222
vector222:
  pushd 0
  pushd 222
  jmp alltraps
.globl vector223
vector223:
  pushd 0
  pushd 223
  jmp alltraps
.globl vector224
vector224:
  pushd 0
  pushd 224
  jmp alltraps
.globl vector225
vector225:
  pushd 0
  pushd 225
  jmp alltraps
.globl vector226
vector226:
  pushd 0
  pushd 226
  jmp alltraps
.globl vector227
vector227:
  pushd 0
  pushd 227
  jmp alltraps
.globl vector228
vector228:
  pushd 0
  pushd 228
  jmp alltraps
.globl vector229
vector229:
  pushd 0
  pushd 229
  jmp alltraps
.globl vector230
vector230:
  pushd 0
  pushd 230
  jmp alltraps
.globl vector231
vector231:
  pushd 0
  pushd 231
  jmp alltraps
.globl vector232
vector232:
  pushd 0
  pushd 232
  jmp alltraps
.globl vector233
vector233:
  pushd 0
  pushd 233
  jmp alltraps
.globl vector234
vector234:
  pushd 0
  pushd 234
  jmp alltraps
.globl vector235
vector235:
  pushd 0
  pushd 235
  jmp alltraps
.globl vector236
vector236:
  pushd 0
  pushd 236
  jmp alltraps
.globl vector237
vector237:
  pushd 0
  pushd 237
  jmp alltraps
.globl vector238
vector238:
  pushd 0
  pushd 238
  jmp alltraps
.globl vector239
vector239:
  pushd 0
  pushd 239
  jmp alltraps
.globl vector240
vector240:
  pushd 0
  pushd 240
  jmp alltraps
.globl vector241
vector241:
  pushd 0
  pushd 241
  jmp alltraps
.globl vector242
vector242:
  pushd 0
  pushd 242
  jmp alltraps
.globl vector243
vector243:
  pushd 0
  pushd 243
  jmp alltraps
.globl vector244
vector244:
  pushd 0
  pushd 244
  jmp alltraps
.globl vector245
vector245:
  pushd 0
  pushd 245
  jmp alltraps
.globl vector246
vector246:
  pushd 0
  pushd 246
  jmp alltraps
.globl vector247
vector247:
  pushd 0
  pushd 247
  jmp alltraps
.globl vector248
vector248:
  pushd 0
  pushd 248
  jmp alltraps
.globl vector249
vector249:
  pushd 0
  pushd 249
  jmp alltraps
.globl vector250
vector250:
  pushd 0
  pushd 250
  jmp alltraps
.globl vector251
vector251:
  pushd 0
  pushd 251
  jmp alltraps
.globl vector252
vector252:
  pushd 0
  pushd 252
  jmp alltraps
.globl vector253
vector253:
  pushd 0
  pushd 253
  jmp alltraps
.globl vector254
vector254:
  pushd 0
  pushd 254
  jmp alltraps
.globl vector255
vector255:
  pushd 0
  pushd 255
  jmp alltraps

# vector table
.data
.globl vectors
vectors:
  .long vector0
  .long vector1
  .long vector2
  .long vector3
  .long vector4
  .long vector5
  .long vector6
  .long vector7
  .long vector8
  .long vector9
  .long vector10
  .long vector11
  .long vector12
  .long vector13
  .long vector14
  .long vector15
  .long vector16
  .long vector17
  .long vector18
  .long vector19
  .long vector20
  .long vector21
  .long vector22
  .long vector23
  .long vector24
  .long vector25
  .long vector26
  .long vector27
  .long vector28
  .long vector29
  .long vector30
  .long vector31
  .long vector32
  .long vector33
  .long vector34
  .long vector35
  .long vector36
  .long vector37
  .long vector38
  .long vector39
  .long vector40
  .long vector41
  .long vector42
  .long vector43
  .long vector44
  .long vector45
  .long vector46
  .long vector47
  .long vector48
  .long vector49
  .long vector50
  .long vector51
  .long vector52
  .long vector53
  .long vector54
  .long vector55
  .long vector56
  .long vector57
  .long vector58
  .long vector59
  .long vector60
  .long vector61
  .long vector62
  .long vector63
  .long vector64
  .long vector65
  .long vector66
  .long vector67
  .long vector68
  .long vector69
  .long vector70
  .long vector71
  .long vector72
  .long vector73
  .long vector74
  .long vector75
  .long vector76
  .long vector77
  .long vector78
  .long vector79
  .long vector80
  .long vector81
  .long vector82
  .long vector83
  .long vector84
  .long vector85
  .long vector86
  .long vector87
  .long vector88
  .long vector89
  .long vector90
  .long vector91
  .long vector92
  .long vector93
  .long vector94
  .long vector95
  .long vector96
  .long vector97
  .long vector98
  .long vector99
  .long vector100
  .long vector101
  .long vector102
  .long vector103
  .long vector104
  .long vector105
  .long vector106
  .long vector107
  .long vector108
  .long vector109
  .long vector110
  .long vector111
  .long vector112
  .long vector113
  .long vector114
  .long vector115
  .long vector116
  .long vector117
  .long vector118
  .long vector119
  .long vector120
  .long vector121
  .long vector122
  .long vector123
  .long vector124
  .long vector125
  .long vector126
  .long vector127
  .long vector128
  .long vector129
  .long vector130
  .long vector131
  .long vector132
  .long vector133
  .long vector134
  .long vector135
  .long vector136
  .long vector137
  .long vector138
  .long vector139
  .long vector140
  .long vector141
  .long vector142
  .long vector143
  .long vector144
  .long vector145
  .long vector146
  .long vector147
  .long vector148
  .long vector149
  .long vector150
  .long vector151
  .long vector152
  .long vector153
  .long vector154
  .long vector155
  .long vector156
  .long vector157
  .long vector158
  .long vector159
  .long vector160
  .long vector161
  .long vector162
  .long vector163
  .long vector164
  .long vector165
  .long vector166
  .long vector167
  .long vector168
  .long vector169
  .long vector170
  .long vector171
  .long vector172
  .long vector173
  .long vector174
  .long vector175
  .long vector176
  .long vector177
  .long vector178
  .long vector179
  .long vector180
  .long vector181
  .long vector182
  .long vector183
  .long vector184
  .long vector185
  .long vector186
  .long vector187
  .long vector188
  .long vector189
  .long vector190
  .long vector191
  .long vector192
  .long vector193
  .long vector194
  .long vector195
  .long vector196
  .long vector197
  .long vector198
  .long vector199
  .long vector200
  .long vector201
  .long vector202
  .long vector203
  .long vector204
  .long vector205
  .long vector206
  .long vector207
  .long vector208
  .long vector209
  .long vector210
  .long vector211
  .long vector212
  .long vector213
  .long vector214
  .long vector215
  .long vector216
  .long vector217
  .long vector218
  .long vector219
  .long vector220
  .long vector221
  .long vector222
  .long vector223
  .long vector224
  .long vector225
  .long vector226
  .long vector227
  .long vector228
  .long vector229
  .long vector230
  .long vector231
  .long vector232
  .long vector233
  .long vector234
  .long vector235
  .long vector236
  .long vector237
  .long vector238
  .long vector239
  .long vector240
  .long vector241
  .long vector242
  .long vector243
  .long vector244
  .long vector245
  .long vector246
  .long vector247
  .long vector248
  .long vector249
  .long vector250
  .long vector251
  .long vector252
  .long vector253
  .long vector254
  .long vector255

_isr_has_errorCode:  .byte      0,0,0,0,0,0,0,0, 1,0,1,1,1,1,1,0
                     .byte      0,1,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
                     .byte      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
