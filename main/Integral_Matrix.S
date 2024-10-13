Integral_Matrix:

    addi sp sp -36
    sw a0 0(sp)     # Save matrix address
    sw a2 4(sp)     # Save p
    sw a3 8(sp)     # Save q
    sw a4 12(sp)    # Save r

    # Load 0 to iterators
    li s0 0       # i
    li s2 0       # j
    mv s3 a1      # Iterator j
    addi a1 a1 -1
    mv s1 a1      # Iterator i (See pseudocode_Ex2.c for explanation)

    sw s1 16(sp)
    sw s3 20(sp)

    end_nested: addi s0 s0 1
              mv s2 s0
    loop_row: beq s0 s1 end_all
              addi s2 s2 1
      loop_col: beq s2 s3 end_nested

					
                    sw s0 24(sp)
                    sw s2 28(sp)
                    sw ra 32(sp)

                    mv a0 s0      # i
                    mv a1 s2      # j
                    lw a2 4(sp)   # p
                    lw a3 8(sp)   # q
                    lw a4 12(sp)  # r
                    li a5 100     # N

                    jal ra Compute_Integral

                    lw s0 24(sp)
                    lw s1 16(sp)
                    lw s2 28(sp)
                    lw s3 20(sp)
                    lw ra 32(sp)

                    # Saving result from fa0 to matrix[i][j]
                    # matrix+((i*size)+j) = address
                    lw s4 0(sp)   # Load matrix address
                    # s5 used to calculate bias
                    mv s5 s3
                    mul s5 s5 s0
                    add s5 s5 s2
                    add s5 s5 s4

                    fsw fa0 0(s5)

                    j loop_row
	
    end_all:  addi sp sp 36
              jr ra

