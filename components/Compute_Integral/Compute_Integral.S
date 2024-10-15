	.section .text
	.globl Compute_Integral
	.type Compute_Integral, @function
Compute_Integral:

	  // Saving values
	  addi sp, sp, -36

    sw ra, 0(sp)
    sw s6, 4(sp)        // h
    sw s7, 8(sp)        // sum

    sw s0, 16(sp)       // p
    sw s1, 20(sp)       // q
    sw s2, 24(sp)       // r
    sw s3, 28(sp)       // N
    sw s4, 32(sp)       // n
    sw s5, 36(sp)       // a

    // Saving used parameters
    mv s0, a2           // p
    mv s1, a3           // q
    mv s2, a4           // r
    mv s3, a5           // N
	  li s4, 0            // n
    mv s5, a0           // a
    li s6, 0            // h
    li s7, 0            // sum

    // Getting h
    sub s6, a1, a0
    div s6, s6, a5

    .L_loop: beq s3, s4, .L_end_loop

    	  // Loading 'x' in first argument
        mul a0, s4, s6
        add a0, a0, s5

        // Loading parameters for Compute_Function
        mv a1, s0
        mv a2, s1
        mv a3, s2

        jal ra, Compute_Function
        add s7, s7, a0

        addi s4, s4, 1
        j .L_loop

    .L_end_loop:  mul a0, s6, s7  // Multiplying by 'h' the sum

    // Loading values back again
    lw ra, 0(sp)
    lw s6, 4(sp)        // h
    lw s7, 8(sp)        // sum

    lw s0, 16(sp)       // p
    lw s1, 20(sp)       // q
    lw s2, 24(sp)       // r
    lw s3, 28(sp)       // N
    lw s4, 32(sp)       // n
    lw s5, 36(sp)       // a

    addi sp, sp, 36

    jr ra

