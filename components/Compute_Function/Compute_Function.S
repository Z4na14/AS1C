	.section .text
	.globl Compute_Function
	.type Compute_Function, @function
Compute_Function:

    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)

    mv s0, a0       // Save x and use it as parameter for pow
    mv s1, a1       // p
    mv s2, a2       // q
    mv s3, a3       // r

    li a1, 2               // Call the pow function
    jal ra, pow

    mul a0, s1, a0    // p * pow(x, 2)
    mul s2, s2, s0    // q * x

    // Add everything up
    add a0, a0, s2
    add a0, a0, s3

    blt a0, zero, .L_abs_val   // Get positive val from the result
    .L_continue_abs:

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
	  addi sp, sp, 20

	  jr ra     // Return everything



    .L_abs_val: neg a0, a0
                j .L_continue_abs

