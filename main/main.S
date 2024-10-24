
	.data
A: .word 1, 2, 3, 4   // values for matrix A
B: .word 0, 0, 0, 0   // values for matrix B
N: .word 2            // Number of rows
M: .word 2            // Number of columns


	.section .text
	.globl app_main
  .type app_main, @function
app_main:

	addi sp, sp, -12
	sw ra, 0(sp)
	sw s0, 4(sp)
	sw s1, 8 (sp)

	la a0, A
	la a1, B
	la t0, N
	lw a2, 0(t0)
	la t0, M
	lw a3, 0(t0)

	// the function is executed for the first time
  // https://ctrlsrc.io/posts/2023/counting-cpu-cycles-on-esp32c3-esp32c6/
	csrw 0x7E0, 1
  csrr s0, 0x7E2
	jal ra, factorialMatrix
	csrr s1, 0x7E2
	sub s1, s1, s0

  mv a0, s1
  li a7, 1
  ecall

	// print the number of cycles (s1)
	// the function is executed a second time
	la a0, A
	la a1, B
	la t0, N
	lw a2, 0(t0)
	la t0, M
	lw a3, 0(t0)
	csrr s0, 0x7E2
	jal ra, factorialMatrix
	csrr s1, 0x7E2
	sub s1, s1, s0

  mv a0, s1
  li a7, 1
  ecall

	// print the number of cycles (s1)
	lw ra, 0(sp)
	lw s0, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 12

	jr ra
