.data
	
    Matrix: .zero 100 	# 5x5 matrix
    size: .word 5

.text

main:

    la a0 Matrix
    la a1 size
    lw a1 0(a1)
    li a2 5
    li a3 3
    li a4 2

    jal ra Integral_Matrix

    li a7 10
    ecall

Integral_Matrix:
	
    addi sp sp -36
    sw a0 0(sp)			# Save matrix address
    sw a2 4(sp)			# Save p
    sw a3 8(sp)			# Save q
    sw a4 12(sp)		# Save r
    
    # Load 0 to iterators
    li s0 0				# i
    li s2 0				# j
    mv s3 a1			# Iterator j
    addi a1 a1 -1
    mv s1 a1			# Iterator i (See pseudocode_Ex2.c for explanation)
    
    sw s1 16(sp)
    sw s3 20(sp)
    
    end_nested:	addi s0 s0 1
    			mv s2 s0
    loop_row:	beq s0 s1 end_all
    				addi s2 s2 1
    	loop_col:	beq s2 s3 end_nested
        
					
                    sw s0 24(sp)
                    sw s2 28(sp)
                    sw ra 32(sp)
                    
                    mv a0 s0		# i
                    mv a1 s2		# j
                    lw a2 4(sp)		# p
                    lw a3 8(sp)		# q
                    lw a4 12(sp)	# r
                    li a5 100		# N
                    
                    jal ra Compute_Integral
                    
                    lw s0 24(sp)
                    lw s1 16(sp)
                    lw s2 28(sp)
                    lw s3 20(sp)
                    lw ra 32(sp)
        
        			# Saving result from fa0 to matrix[i][j]
                    # matrix+((i*size)+j) = address
        			lw s4 0(sp)		# Load matrix address
                    # s5 used to calculate bias
                    mv s5 s3
                    mul s5 s5 s0
                    add s5 s5 s2
					
					li s11 4
					mul s5 s5 s11

                    add s5 s5 s4
                    
                    fsw fa0 0(s5)
                    
        			j loop_row
	
    end_all:	addi sp sp 36
    			jr ra





Compute_Integral:

    li s11 0
    fcvt.s.w fs0 s11
    fcvt.s.w fs1 s11
    fcvt.s.w fs2 s11
    fcvt.s.w fs3 s11

    # First we save all the used parameters
    # As b is only used at the beginning,
    # we don't save it

    addi sp sp -36
    sw a2 0(sp)           # p
    sw a3 4(sp)           # q
    sw a4 8(sp)           # r

    # h = (b - a) / N
    sub s0 a1 a0
    fcvt.s.w fs0 s0
    fcvt.s.w fs3 a5       # Save N into floating register
    fdiv.s fs0 fs0 fs3    # to perform operation

    fcvt.s.w fs2 a0       # We store 'a' in fs2 for arithmetics

    li s0 0               # Declaring 'n'
    mv s1 a5
    sw s1 12(sp)          # Storing 'N'
    fsw fs0 16(sp)        # Storing 'h'
    fsw fs2 24(sp)        # Storing 'a' float

loop: beq s1 s0 end

        fcvt.s.w fs3 s0        # Use same register to operate with 'n'
        fmul.s fa0 fs3 fs0
        fadd.s fa0 fa0 fs2     # Storing x directly in argument

        fsw fs1 20(sp)         # Storing sum
        sw  s0  28(sp)         # Storing iterator 'n'


        lw a0 0(sp)            # Loading 'p' to argument
        lw a1 4(sp)            # Loading 'q' to argument
        lw a2 8(sp)            # Loading 'r' to argument
        sw ra 32(sp)           # Storing return address from first call
        jal ra Compute_Function
        lw ra 32(sp)           # Restoring address from first call

        lw s1 12(sp)           # Loading 'N'
        flw fs0 16(sp)         # Loading 'h'
        flw fs1 20(sp)         # Loading sum
        flw fs2 24(sp)         # Loading 'a'
        lw s0 28(sp)           # loading 'n'

        fadd.s fs1 fs1 fa0
        addi s0 s0 1

        j loop

end: 	fmv.s fa0 fs1			# Passing sum to return register
		fmul.s fa0 fa0 fs0		# Multiplying by 'h' the last value (Aproximation)
		addi sp sp 36
		jr ra

Compute_Function:

    fmv.s fs0 fa0         # Save x and use it as parameter for pow
    fcvt.s.w fs1 a0       # p
    fcvt.s.w fs2 a1       # q
    fcvt.s.w fs3 a2       # r

    li a0 2               # Call the pow function
    addi sp sp -4
    sw ra 0(sp)           # Storing previous return address
    jal ra pow
    lw ra 0(sp)
    addi sp sp 4

    fmul.s fa0 fa0 fs1    # p * pow(x, 2)
    fmul.s fs2 fs2 fs0    # q * x

    # Add everything up
    fadd.s fa0 fa0 fs2
    fadd.s fa0 fa0 fs3
    
    fabs.s fa0 fa0		  # Get positive val from the result

	jr ra     			  # Return everything
