//CPSC355: Assignment 2 - Question 2
//By: Parshva Dave
//UCID: 30251027
//Date: February 14th, 2026


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
mov x26, #0




mov x22, #2
mov x23, #1
sum_loop:
add x20, x20, #1
mul x21, x20, x20
madd x24, x20, x22, x23
mul x25, x24, x21

add x26, x26, x25

cmp x20, x19
b.lt sum_loop




ldr x0, =output_sum
mov x1, x26
bl printf


ldp x29, x30, [sp], #16
ret
