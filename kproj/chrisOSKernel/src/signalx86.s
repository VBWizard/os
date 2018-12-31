.intel_syntax noprefix
.globl processSignalDelivery
.type processSignalDelivery, @function

#TODO: Need to put a spinlock on this function so 2 threads aren't in it at the same time???
processSignalDelivery: #first two stack entries have our (esp)sigHandler address and (esp+1)processReturnAddress
    call [esp]
    jmp  [esp+1]
    
