.data
input: .string "%ld"
output: .string "%ld\n"

.bss
.balign 8
n: .skip 8


.text
.extern scanf
.extern printf
.global main

main: stp x29, x30, [sp, #-16]!
mov x29, sp

ldr x0, =input
ldr x1, =n
bl scanf

ldr x14, =n
ldr x19, [x14] //--> value for n


add x20, x19, #1 // x20 = n + 1
add x21, x19, #2// x21 = n + 2
mul x22, x21, x20 // x22 = (n+2) * (n + 1)
mul x23, x22, x19 // x23 = n * ((n + 2) * (n + 1))

ldr x0, =output
mov x1, x23
bl printf


ldp x29, x30, [sp], #16
ret