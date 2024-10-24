	.data
.align 2
A: .word 1, 2, 3, 4		# values for matrix A
.align 2
B: .word 0, 0, 0, 0		# values for matrix B
.align 2
N: .word 2 			# Number of rows
.align 2
M: .word 2	 		# Number of columns

	.text
main:

	addi sp, sp, -12
	sw ra, 0(sp)
	sw s0, 4(sp)
	sw s1, 8 (sp)

	la a0, A
	la a1, A
	la t0, N
	lw a2, 0(t0)
	la t0, M
	lw a3, 0(t0)

	# the function is executed for the first time
	rdcycle s0
	jal ra, factorialMatrix
	rdcycle s1
	sub s1, s1, s0

	# print the number of cycles (s1)
	# the function is executed a second time
	la a0, A
	la a1, A
	la t0, N
	lw a2, 0(t0)
	la t0, M
	lw a3, 0(t0)
	rdcycle s0
	jal ra, factorialMatrix
	rdcycle s1
	sub s1, s1, s0

	# print the number of cycles (s1)
	lw ra, 0(sp)
	lw s0, 4(sp)
	lw s1, 8 (sp)
	addi sp, sp, 12

	jr ra


factorialMatrix:
	
  addi sp, sp, -36
  sw ra, 0(sp)
  sw s0, 4(sp)
  sw s1, 8(sp)
  sw s2, 12(sp)
  sw s3, 16(sp)
  sw s4, 20(sp)
  sw s5, 24(sp)
  sw s6, 28(sp)
  sw s7, 32(sp)

  mv s0, a0     # Address matrix A
  mv s1, a1     # Address matrix B
  mv s2, a2     # N
  mv s3, a3     # M
  # s4            iter N (i)
  # s5            iter M (j)
  li s6, 0      # Matrix bias operation A
  li s7, 0      # Matrix bias operation B


  li s4, -1
  .L_outer_loop: addi s4, s4, 1
                 beq s4, s2, .L_exit_loop

                li s5, -1
                .L_inner_loop: addi s5, s5, 1
                               beq s5, s3, .L_outer_loop

                # We calculate how much bias there is
                mv s6, s4
                mul s6, s6, s3
                add s6, s6, s5
  
                mv s7, s6
                add s6, s6, s0
                add s7, s7, s1

                lw a0, 0(s6)
                jal ra factorial
                sw a0, 0(s7)

                j .L_inner_loop

  .L_exit_loop:
  

  lw ra, 0(sp)
  lw s0, 4(sp)
  lw s1, 8(sp)
  lw s2, 12(sp)
  lw s3, 16(sp)
  lw s4, 20(sp)
  lw s5, 24(sp)
  lw s6, 28(sp)
  lw s7, 32(sp)
  addi sp, sp, 36

  jr ra

factorial:

  mv t0, a0   # Iter
  li a0, 1    # output
  li t1, 1    # Comparator

  .L_calculate_factorial: ble t0, t1, .L_end_calculate_fac

    mul a0, a0, t0
    addi t0, t0, -1

  .L_end_calculate_fac: jr ra

