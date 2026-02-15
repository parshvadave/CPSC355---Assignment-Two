.balign 4
output: .string "%d"

.global main



main: stp x29, x30, [sp, #-16]!
mov x29, sp


mov x19, #2
mov x20, #3
mov x21, #5
mov x22, #7
mov x23, #4

mul x0, x19, x23, x23
mul x0, x0, x23
mneg x1, x20, x23, x23
mul x2, x21, x23


add x0, x0, x1
add x0, x0, x2
add x0, x0, x22

ldr x0, =output
bl printf


ldp x29, x30, [sp], #16
ret
