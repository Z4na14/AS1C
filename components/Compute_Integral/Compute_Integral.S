	.text
	.global Compute_Integral
	.type Compute_Integral, @function
Compute_Integral:

	// Saving values
	addi sp sp -40
    
    sw ra 0(sp)
    fsw fs0 4(sp)		// h
    fsw fs1 8(sp)		// sum
    fsw fs2 12(sp)		// Operating register
    
    sw s0 16(sp)		// p
    sw s1 20(sp)	 	// q
    sw s2 24(sp)		// r
    sw s3 28(sp)		// N
    sw s4 32(sp)		// n
    sw s5 36(sp)		// a

	// Initialize float registers
    li s0 0
    fcvt.s.w fs0 s0
    fcvt.s.w fs1 s0
    fcvt.s.w fs2 s0
    
    // Saving used parameters
    mv s0 a2			// p
    mv s1 a3			// q
    mv s2 a4			// r
    mv s3 a5			// N
	li s4 0				// n
    mv s5 a0			// a
    
    // Getting h
    fcvt.s.w fs0 a1
	fcvt.s.w fs2 a0
    fsub.s fs0 fs0 fs2
    fcvt.s.w fs2 a5
    fdiv.s fs0 fs0 fs2    
    
    
    .L_loop: beq s3 s4 .L_end_loop
    
    	// Loading 'x' in first argument
		fcvt.s.w fa0 s4
        fmul.s fa0 fa0 fs0
        fcvt.s.w fs2 s5
        fadd.s fa0 fa0 fs2 
        
        // Loading parameters for Compute_Function
        mv a0 s0
        mv a1 s1
        mv a2 s2
    
		jal ra Compute_Function
        
        fadd.s fs1 fs1 fa0
        
        addi s4 s4 1
        j .L_loop
    
    .L_end_loop:	fmul.s fa0 fs1 fs0	// Multiplying by 'h' the sum
    
    // Loading values back again
	lw ra 0(sp)
    flw fs0 4(sp)		// h
    flw fs1 8(sp)		// sum
    flw fs2 12(sp)		// Operating register
    
    lw s0 16(sp)		// p
    lw s1 20(sp)	 	// q
    lw s2 24(sp)		// r
    lw s3 28(sp)		// N
    lw s4 32(sp)		// n
    lw s5 36(sp)		// a
	addi sp sp 40
	
    jr ra
