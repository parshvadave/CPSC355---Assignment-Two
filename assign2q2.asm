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
ldr x19, [x14]


mul x20, x19, x19
mov x21, #2
mov x22, #1
madd x23, x21, x19, x22
mul x24, x23, x20


ldr x0, =output
mov x1, x24
bl printf


ldp x29, x30, [sp], #16
ret