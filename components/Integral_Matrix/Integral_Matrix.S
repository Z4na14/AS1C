	.section .text
  .globl Integral_Matrix
	.type Integral_Matrix, @function
Integral_Matrix:

	  // Saving previous values stored before in registers
	  addi sp, sp, -44

    sw s0, 0(sp)      // Matrix address
    sw s1, 4(sp)      // p
    sw s2, 8(sp)      // q
    sw s3, 12(sp)     // r
    sw s4, 16(sp)     // i
    sw s5, 20(sp)     // j
	  sw s6, 24(sp)     // iter i
    sw s7, 28(sp)     // iter j
    sw s8, 32(sp)     // Matrix bias
    sw s9, 36(sp)     // Operating register
    sw ra, 40(sp)     // Return address

	  // Load arguments to local registers
    mv s0, a0
    mv s1, a2
    mv s2, a3
    mv s3, a4

    // j should go until M and i until M-1
    mv s7, a1
    addi a1, a1, -1
    mv s6, a1

    // Load 0 to iterators
    li s4, 0
    li s5, 0

    j .L_outer_loop

	  .L_iter_loop: mv s5, s4
                  addi s4, s4, 1
    .L_outer_loop: beq s4, s6, .L_exit_loop

                  addi s5, s5, 1
                  beq s5, s7, .L_iter_loop

			            // Preparing parameters for function
			            mv a0, s4
                  mv a1, s5
                  mv a2, s1
                  mv a3, s2
                  mv a4, s3
                  li a5, 1000

			            jal ra, Compute_Integral

                  // Calculating the bias where to store the integral value
                  mv s8, s7
                  mul s8, s8, s4
                  add s8, s8, s5
                  li s9, 4
                  mul s8, s8, s9
                  add s8, s8, s0

			            sw a0, 0(s8)

			            j .L_outer_loop


      .L_exit_loop:

      lw s0, 0(sp)      // Matrix address	
      lw s1, 4(sp)      // p
      lw s2, 8(sp)      // q
      lw s3, 12(sp)     // r
      lw s4, 16(sp)     // i
      lw s5, 20(sp)     // j
	    lw s6, 24(sp)     // iter i
      lw s7, 28(sp)     // iter j
      lw s8, 32(sp)     // Matrix bias
      lw s9, 36(sp)     // Operating register
	    lw ra, 40(sp)     // Return address

      addi sp, sp, 44

      jr ra

