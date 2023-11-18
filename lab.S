.data
N:
.word 5
M:
.word 3

matrix:
.word -5, 8, 6, 0, 1 # 10
.word -10, 10, -8, 8, -5 # -5
.word 23, 46, 79, 80, -1 # a lot

res_line:
.asciiz "min line: "

.text

main:
la a0, matrix 
la t0, M
la t1, N
lw a1, 0(t0)
lw a2, 0(t1)
call find_row_min_sum
mv s0, a0
la a1, res_line
addi a0, x0, 4
ecall
mv a1, s0
call print_int
addi a0, x0, 10
ecall

print_int: # printf("%d\n", a1)
addi a0, x0, 1
ecall
addi a0, x0, 11
addi a1, x0, 10
ecall
ret

find_row_min_sum:
# a0 - matrix, a1 - rows (M), a2 - cols (N)
addi t0, x0, 0 # t0 - min_sum
not t0, t0
srli t0, t0, 1
addi t1, x0, 0 # t1 - res_row

addi t3, x0, 0 # t3 - i

cycle:
addi t4, x0, 0 # t4 - j
addi t2, x0, 0 # t2 - cur_sum
sum_cycle:
lw t5, 0(a0)
add t2, t2, t5
addi t4, t4, 1
addi a0, a0, 4
blt t4, a2, sum_cycle

bge t2, t0, next_row
mv t0, t2
mv t1, t3

next_row:
addi t3, t3, 1
blt t3, a1, cycle
mv a0, t1
ret
