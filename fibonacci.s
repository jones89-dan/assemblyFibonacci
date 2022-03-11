@define architecture
.cpu cortex-a72 @pi 4
.fpu neon-fp-armv8

@define data, constants
.data
outp:   .asciz  "Enter a Fibonacci term: "
inp:    .asciz  "%d"
outp2:   .asciz  "The %dth  Fibonacci term = %d\n"

.text
.align 2
.global main
.type main, %function

main:
mov r4, lr
ldr r0, =outp
bl printf
sub sp, sp, #4

ldr r0, =inp
mov r1, sp
bl scanf

ldr r5, [sp]

ldr r0, =outp2
mov r1, r5
bl printf

mov lr, r4  @ lr = r4

bx lr
