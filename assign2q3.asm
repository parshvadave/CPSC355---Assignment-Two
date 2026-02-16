.data
input_number_1: .string "%ld"
input_number_2: .string "%ld"
input_number_3: .string "%ld"
output_1: .string "%ld\n"
output_2: .string "%ld\n"

.bss
.balign 8
number_1: .skip 8
number_2: .skip 8
number_3: .skip 8

.text
.extern scanf
.extern printf
.global main





main:
stp x29, x30, [sp, #-16]!
mov x29, sp


ldr x0, =input_number_1
ldr x1, =number_1
bl scanf
ldr x13, =number_1
ldr x19, [x13]

ldr x0, =input_number_2
ldr x1, =number_2
bl scanf
ldr x14, =number_2
ldr x20, [x14]

ldr x0, =input_number_3
ldr x1, =number_3
bl scanf
ldr x15, =number_3
ldr x21, [x15]




cmp x19, x20
b.ge first_ge_second
b second_gt_first

first_ge_second:
cmp x19, x21
b.ge first_greatest
b third_first_second

first_greatest:
cmp x20, x21
b.ge first_second_third
b first_third_second

second_gt_first:
cmp x20, x21
b.ge second_greatest
b third_second_first

second_greatest:
cmp x19, x21
b.ge second_first_third
b second_third_first




third_first_second:
ldr x0, =output_1
mov x1, x21
bl printf
ldr x0, =output_2
mov x1, x20
bl printf
b finished_sort

first_second_third:
ldr x0, =output_1
mov x1, x19
bl printf
ldr x0, =output_2
mov x1, x21
bl printf
b finished_sort

first_third_second:
ldr x0, =output_1
mov x1, x19
bl printf
ldr x0, =output_2
mov x1, x20
bl printf
b finished_sort

third_second_first:
ldr x0, =output_1
mov x1, x21
bl printf
ldr x0, =output_2
mov x1, x19
bl printf
b finished_sort

second_first_third:
ldr x0, =output_1
mov x1, x20
bl printf
ldr x0, =output_2
mov x1, x21
bl printf
b finished_sort

second_third_first:
ldr x0, =output_1
mov x1, x20
bl printf
ldr x0, =output_2
mov x1, x19
bl printf
b finished_sort




finished_sort:
ldp x29, x30, [sp], #16
ret