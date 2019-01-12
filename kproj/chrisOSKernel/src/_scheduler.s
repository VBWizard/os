.intel_syntax noprefix
.extern scheduler
.extern isrSavedCS, isrSavedEIP, isrSavedErrorCode, isrSavedEAX, isrSavedEBX, isrSavedECX, isrSavedEDX, isrSavedESI, isrSavedEDI, isrSavedEBP, isrSavedCR0, isrSavedCR1, isrSavedCR4, isrSavedDS, isrSavedES, isrSavedFS, isrSavedGS, isrSavedSS, isrSavedNumber, isrSavedCR2, isrSavedESP, isrSavedFlags, isrSavedStack
.extern forkReturn
.extern nextTaskTSS;

.globl _schedule
.type _schedule, @function
_schedule:
    call    scheduler
    mov eax, isrSavedCS
    and eax, 2
    cmp eax, 2
    je nonKernelProcess
    mov eax,1
    mov scheduleIsKernelProcess, eax
    jmp continue1
nonKernelProcess:
    mov eax,0
    mov scheduleIsKernelProcess, eax
continue1:
    mov bx, isrSavedDS
    mov ds, bx
    mov bx, isrSavedES
    mov es, bx                  # load ds and es with valid selector
    mov bx, isrSavedFS
    mov fs,bx
    mov bx, isrSavedGS
    mov gs, bx
loadTaskRegisters:
    mov bx, isrSavedES
    mov es, bx                  # load ds and es with valid selector
    mov bx, isrSavedFS
    mov fs,bx
    mov bx, isrSavedGS
    mov gs, bx
    mov ebp,isrSavedEBP
    mov eax, isrSavedFlags
    or eax, 0x3000
    mov isrSavedFlags, eax
    mov ecx, isrSavedECX
    mov edx, isrSavedEDX
    mov esi, isrSavedESI
    mov edi, isrSavedEDI
    mov ebp,isrSavedEBP

overloadTaskRegister:
    mov eax,isrSavedCR3
    mov ebx,cr3
    cmp eax,ebx
    je overRestoreCR3
    mov CR3, eax
overRestoreCR3:
    mov eax, scheduleIsKernelProcess
    cmp eax,1           
    jne overKernelReturn  
    mov eax, forkReturn
    cmp eax,1
    je overKernelReturn
    #For kernel processes, we have to switch back to the process' SS:ESP and then iret

    mov eax, nextTaskTSS
    cmp eax,0
    je overloadTaskRegister2
    mov eax,0
    mov nextTaskTSS, eax
overloadTaskRegister2:
    mov eax, isrSavedESP
    mov esp, eax
    mov eax, isrSavedSS
    mov ss, eax
    mov bx, isrSavedDS
    mov ds, bx
    mov ebx,isrSavedEBX
    mov eax, isrSavedEAX
    iretd

overKernelReturn:
    mov eax, isrSavedEIP
    mov [esp], eax
    mov eax, isrSavedCS
    mov [esp+4], eax
    mov eax, scheduleIsKernelProcess
    cmp eax,1
    je overStackPush #kernel process so ljmp will not use the 
    mov eax, isrSavedESP
    mov [esp+8], eax
    mov eax, isrSavedSS
    mov [esp+12], eax
overStackPush:
    mov al,schedulerTaskSwitched
    cmp al,0
    jnz newTaskLoaded
    jmp doTheJump

newTaskLoaded:
       #Stack is already where it was when we started the ISR
    #reset the task switched indicator
    mov eax, nextTaskTSS
    cmp eax,0
    je overloadTaskRegister
    mov eax,0
    mov nextTaskTSS, eax
    mov schedulerTaskSwitched,eax
#    mov eax,kTaskSwitchCount
#    inc eax
#    mov kTaskSwitchCount,eax
    #Restore the CR3 if it differs from the current one
doTheJump:
    mov bx, isrSavedDS
    mov ds, bx
    mov ebx,isrSavedEBX
    mov eax, isrSavedFlags
    push eax
    popf
    mov eax, isrSavedEAX
    retf 0

    
scheduleIsKernelProcess:   .word  0
                             .word 0
