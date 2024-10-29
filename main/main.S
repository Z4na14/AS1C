
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
	jal ra, rdcycle
  mv s0, a0
	jal ra, factorialMatrix
	jal ra, rdcycle
  mv s1, a0
	sub a0, s1, s0

  jal print_cycles


	// print the number of cycles (s1)
	// the function is executed a second time
	la a0, A
	la a1, B
	la t0, N
	lw a2, 0(t0)
	la t0, M
	lw a3, 0(t0)
	jal ra, rdcycle
  mv s0, a0
	jal ra, factorialMatrix
	jal ra, rdcycle
  mv s1, a0
	sub a0, s1, s0

  jal print_cycles

	// print the number of cycles (s1)
	lw ra, 0(sp)
	lw s0, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 12

	jr ra
