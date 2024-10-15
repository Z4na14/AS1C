    .section .text
    .globl pow
    .type pow, @function

pow:

    mv t0, a0	// x
    mv t1, a1	// exponent
	li t2, 1	// iter count


    .L_multiply:  beq t2, t1, .L_end_multiply
        mul a0, a0, t0
        addi t2, t2, 1
        j .L_multiply
    .L_end_multiply: jr ra

