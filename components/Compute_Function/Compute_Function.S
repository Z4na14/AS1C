	.section .text
	.globl Compute_Function
	.type Compute_Function, @function
Compute_Function:

    addi sp, sp, -20
    fsw fs0, 0(sp)
    fsw fs1, 4(sp)
    fsw fs2, 8(sp)
    fsw fs3, 12(sp)
    sw ra, 16(sp)

    fmv.s fs0, fa0         // Save x and use it as parameter for pow
    fcvt.s.w fs1, a0       // p
    fcvt.s.w fs2, a1       // q
    fcvt.s.w fs3, a2       // r

    li a0, 2               // Call the pow function
    jal ra, pow

    fmul.s fa0, fs1, fa0    // p * pow(x, 2)
    fmul.s fs2, fs2, fs0    // q * x

    // Add everything up
    fadd.s fa0, fa0, fs2
    fadd.s fa0, fa0, fs3

    fabs.s fa0, fa0		  // Get positive val from the result

    flw fs0, 0(sp)
    flw fs1, 4(sp)
    flw fs2, 8(sp)
    flw fs3, 12(sp)
    lw ra, 16(sp)
	  addi sp, sp, 20

	  jr ra     // Return everything

