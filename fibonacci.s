@define architecture
.cpu cortex-a72 @pi 4
.fpu neon-fp-armv8

@define data, constants
.data
outp:   .asciz  "Enter a Fibonacci term: "
inp:    .asciz  "%d"
outp2:  .asciz  "The %dth Fibonacci term = %d\n"
outp3:  .asciz  "%d"

.text
.align 2
.global main
.type main, %function

main:
        @print message and collect the input
        mov r4, lr
        ldr r0, =outp
        bl printf
        sub sp, sp, #4

        ldr r0, =inp
        mov r1, sp
        bl scanf

        ldr r5, [sp]
        
        @ start the fibibonacci sequence
        @ input and first two terms
start:
        mov r10, r5
        subs r10, r10, #1
        mov r1, #0 
        mov r2, #1
        
        @ the algorithm 
fib:
        add r3, r1, r2
        mov r1, r2
        mov r2, r3
        subs r10, r10, #1
        beq end
        bal fib
        
        @ output
end:
        @mov r0, r3
        ldr r0, =outp2
        mov r1, r5
        bl printf

        ldr r0, =outp3
        mov r1, r3
        bl printf

        mov lr, r4  @ lr = r4
        bx lr
