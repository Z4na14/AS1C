.data

    Matrix1: .zero 80    # 5x5 matrix
    size1: .word 5
    
	Matrix2: .zero 4    # 1x1 matrix
    size2: .word 1
    
    Matrix3: .zero 80    # 5x5 matrix
    size3: .word 5
    
    Matrix4: .zero 80    # 5x5 matrix
    size4: .word 5
    
    Matrix5: .zero 1    # 0x0 matrix
    .align 2
    size5: .word 0

.text

main:

    la a0 Matrix1
    la a1 size1
    lw a1 0(a1)
    li a2 5
    li a3 3
    li a4 2
    jal ra Integral_Matrix
    
    la a0 Matrix2
    la a1 size2
    lw a1 0(a1)
    li a2 5
    li a3 3
    li a4 2
    jal ra Integral_Matrix
    
    la a0 Matrix3
    la a1 size3
    lw a1 0(a1)
    li a2 0
    li a3 0
    li a4 0
    jal ra Integral_Matrix
    
    la a0 Matrix4
    la a1 size4
    lw a1 0(a1)
    li a2 100
    li a3 200
    li a4 -500
    jal ra Integral_Matrix
    
    la a0 Matrix5
    la a1 size5
    lw a1 0(a1)
    li a2 5
    li a3 3
    li a4 2
    jal ra Integral_Matrix

    li a7 10
    ecall
    

Integral_Matrix:

	# Saving previous values stored before in registers
	addi sp sp -44
    
    sw s0 0(sp)			# Matrix address	
    sw s1 4(sp)			# p
    sw s2 8(sp)			# q
    sw s3 12(sp)		# r
    sw s4 16(sp)		# i
    sw s5 20(sp)		# j
	sw s6 24(sp)		# iter i
    sw s7 28(sp)		# iter j
    sw s8 32(sp)		# Matrix bias
    sw s9 36(sp)		# Operating register
    sw ra 40(sp)		# Return address

	# Check if the size of the matrix is valid
    li s0 1
    ble a1 s0 exit_loop

	# Load arguments to local registers
    mv s0 a0
    mv s1 a2
    mv s2 a3
    mv s3 a4
    
    # j should go until M and i until M-1
    mv s7 a1
    addi a1 a1 -1
    mv s6 a1
    
    # Load 0 to iterators
    li s4 0
    li s5 0
    
    j outer_loop

	iter_loop: mv s5 s4
    		   addi s4 s4 1
    outer_loop: beq s4 s6 exit_loop

    				addi s5 s5 1
    	inner_loop:	beq s5 s7 iter_loop

			# Preparing parameters for function
			mv a0 s4
            mv a1 s5
            mv a2 s1
            mv a3 s2
            mv a4 s3
            li a5 100

			jal ra Compute_Integral
            
            # Calculating the bias where to store the integral value
            mv s8 s7
            mul s8 s8 s4
            add s8 s8 s5
            li s9 4
            mul s8 s8 s9
            add s8 s8 s0

			fsw fa0 0(s8)

			j outer_loop
        
        
    exit_loop:
    
    lw s0 0(sp)			# Matrix address	
    lw s1 4(sp)			# p
    lw s2 8(sp)			# q
    lw s3 12(sp)		# r
    lw s4 16(sp)		# i
    lw s5 20(sp)		# j
	lw s6 24(sp)		# iter i
    lw s7 28(sp)		# iter j
    lw s8 32(sp)		# Matrix bias
    lw s9 36(sp)		# Operating register
	lw ra 40(sp)		# Return address

	addi sp sp 44
    
    jr ra

Compute_Integral:

	# Saving values
	addi sp sp -40
    
    sw ra 0(sp)
    fsw fs0 4(sp)		# h
    fsw fs1 8(sp)		# sum
    fsw fs2 12(sp)		# Operating register
    
    sw s0 16(sp)		# p
    sw s1 20(sp)	 	# q
    sw s2 24(sp)		# r
    sw s3 28(sp)		# N
    sw s4 32(sp)		# n
    sw s5 36(sp)		# a

	# Initialize float registers
    li s0 0
    fcvt.s.w fs0 s0
    fcvt.s.w fs1 s0
    fcvt.s.w fs2 s0
    
    # Saving used parameters
    mv s0 a2			# p
    mv s1 a3			# q
    mv s2 a4			# r
    mv s3 a5			# N
	li s4 0				# n
    mv s5 a0			# a
    
    # Getting h
    fcvt.s.w fs0 a1
	fcvt.s.w fs2 a0
    fsub.s fs0 fs0 fs2
    fcvt.s.w fs2 a5
    fdiv.s fs0 fs0 fs2    
    
    
    loop: beq s3 s4 end_lopp
    
    	# Loading 'x' in first argument
		fcvt.s.w fa0 s4
        fmul.s fa0 fa0 fs0
        fcvt.s.w fs2 s5
        fadd.s fa0 fa0 fs2 
        
        # Loading parameters for "f"
        mv a0 s0
        mv a1 s1
        mv a2 s2
    
		jal ra f
        
        fadd.s fs1 fs1 fa0
        
        addi s4 s4 1
        j loop
    
    end_lopp:	fmul.s fa0 fs1 fs0	# Multiplying by 'h' the sum
    
    # Loading values back again
	lw ra 0(sp)
    flw fs0 4(sp)		# h
    flw fs1 8(sp)		# sum
    flw fs2 12(sp)		# Operating register
    
    lw s0 16(sp)		# p
    lw s1 20(sp)	 	# q
    lw s2 24(sp)		# r
    lw s3 28(sp)		# N
    lw s4 32(sp)		# n
    lw s5 36(sp)		# a
	addi sp sp 40
	
    jr ra

f:
		
    addi sp sp -20
    fsw fs0 0(sp)
    fsw fs1 4(sp)
    fsw fs2 8(sp)
    fsw fs3 12(sp)
    sw ra 16(sp)

    fmv.s fs0 fa0         # Save x and use it as parameter for pow
    fcvt.s.w fs1 a0       # p
    fcvt.s.w fs2 a1       # q
    fcvt.s.w fs3 a2       # r

    li a0 2               # Call the pow function
    jal ra pow

    fmul.s fa0 fs1 fa0    # p * pow(x, 2)
    fmul.s fs2 fs2 fs0    # q * x

    # Add everything up
    fadd.s fa0 fa0 fs2
    fadd.s fa0 fa0 fs3
    
    fabs.s fa0 fa0		  # Get positive val from the result

    flw fs0 0(sp)
    flw fs1 4(sp)
    flw fs2 8(sp)
    flw fs3 12(sp)
    lw ra 16(sp)
	addi sp sp 20

	jr ra     			  # Return everything
