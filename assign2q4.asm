//CPSC355: Assignment 2 - Question 4
//By: Parshva Dave
//UCID: 30251027
//Date: February 15th, 2026


.data
input_number_1: .string "%ld"
input_number_2: .string "%ld"
input_number_3: .string "%ld"
input_number_4: .string "%ld"
output_1: .string "%ld\n"

.bss
.balign 8
number_1: .skip 8
number_2: .skip 8
number_3: .skip 8
number_4: .skip 8

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
ldr x12, =number_1
ldr x19, [x12]

ldr x0, =input_number_2
ldr x1, =number_2
bl scanf
ldr x13, =number_2
ldr x20, [x13]

ldr x0, =input_number_3
ldr x1, =number_3
bl scanf
ldr x14, =number_3
ldr x21, [x14]

ldr x0, =input_number_4
ldr x1, =number_4
bl scanf
ldr x15, =number_4
ldr x22, [x15]




cmp x19, x20
b.ge first_big
b second_big

first_big:
cmp x19, x21
b.ge first_bigger
b third_big

first_bigger:
cmp x19, x22
b.ge first_biggest
b fourth_biggest

second_big:
cmp x20, x21
b.ge second_bigger
b third_bigger

third_big:
cmp x21, x22
b.ge third_biggest
b fourth_biggest

second_bigger:
cmp x20, x22
b.ge second_biggest
b fourth_biggest

third_bigger:
cmp x21, x22
b.ge third_biggest
b fourth_biggest




first_biggest:
mov x28, x19
mov x27, #1
b next_largest

second_biggest:
mov x28, x20
mov x27, #2
b next_largest

third_biggest:
mov x28, x21
mov x27, #3
b next_largest

fourth_biggest:
mov x28, x22
mov x27, #4
b next_largest




next_largest:
cmp x27, #1
b.eq skip_first
cmp x27, #2
b.eq skip_second
cmp x27, #3
b.eq skip_third
b skip_fourth




skip_first:
cmp x20, x21
b.ge two_big
b three_big

two_big:
cmp x20, x22
b.ge two_biggest
b four_biggest

three_big:
cmp x21, x22
b.ge three_biggest
b four_biggest

two_biggest:
mov x26, x20
b print_output

three_biggest:
mov x26, x21
b print_output

four_biggest:
mov x26, x22
b print_output




skip_second:
cmp x19, x21
b.ge one_bigger
b three_bigger

one_bigger:
cmp x19, x22
b.ge one_largest
b four_largest

three_bigger:
cmp x21, x22
b.ge three_largest
b four_largest

one_largest:
mov x26, x19
b print_output

three_largest:
mov x26, x21
b print_output

four_largest:
mov x26, x22
b print_output




skip_third:
cmp x19, x20
b.ge one_large
b two_large

one_large:
cmp x19, x22
b.ge one_greatest
b four_greatest

two_large:
cmp x20, x22
b.ge two_greatest
b four_greatest

one_greatest:
mov x26, x19
b print_output

two_greatest:
mov x26, x20
b print_output

four_greatest:
mov x26, x22
b print_output




skip_fourth:
cmp x19, x20
b.ge first_large
b second_large

first_large:
cmp x19, x21
b.ge greatest_first
b greatest_third

second_large:
cmp x20, x21
b.ge greatest_second
b greatest_third

greatest_first:
mov x26, x19
b print_output

greatest_second:
mov x26, x20
b print_output

greatest_third:
mov x26, x21
b print_output




print_output:
add x25, x28, x26
ldr x0, =output_1
mov x1, x25
bl printf




ldp x29, x30, [sp], #16
ret
