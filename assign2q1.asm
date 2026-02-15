.data
input_number: .string "%ld"
output_sum: .string "%ld\n"

.bss
.balign 8
number: .skip 8

.text
.extern scanf
.extern printf
.global main





main: 
stp x29, x30, [sp, #-16]!
mov x29, sp


ldr x0, =input_number
ldr x1, =number
bl scanf
ldr x14, =number
ldr x19, [x14]


mov x20, #0
mov x25, #0




sum_loop:
add x20, x20, #1
add x21, x20, #1
add x22, x20, #2
mul x23, x22, x21
mul x24, x23, x20

add x25, x25, x24

cmp x20, x19
b.lt sum_loop




ldr x0, =output_sum
mov x1, x25
bl printf


ldp x29, x30, [sp], #16
ret
