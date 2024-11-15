.data
  # values to be defined for the matrix
  Matrix4: .zero 64
  Matrix8: .zero 256
  Matrix16:.zero 1024
  
  # number of rows and columns
  M4: .word 4 
  M8: .word 8
  M16:.word 16


.text

  .globl main
  main:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    
    
    la a0, Matrix4
    la a1, M4
    lw a1, 0(a1)
    
    # the function is executed for the first time
    rdcycle s0
    jal ra, FillMatrix
    rdcycle s1
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here.
    li a7, 0
    mv a0, s1
    ecall
    
    
    la a0, Matrix8
    la a1, M8
    lw a1, 0(a1)
    
    # the function is executed a second time
    rdcycle s0
    jal ra, FillMatrix
    rdcycle s1
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here
    li a7, 0
    mv a0, s1
    ecall
    
    
    la a0, Matrix16
    la a1, M16
    lw a1, 0(a1)
    
    # the function is executed a third time
    rdcycle s0
    jal ra, FillMatrix
    rdcycle s1
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here
    li a7, 0
    mv a0, s1
    ecall
    
    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12
    jr ra
    
    
  .globl sum
  #.type sum, @function
  sum:
    mv t0, a1
    li t1, 2
    
    mul a0, a0, t1
    add a0, a0, t0
  
  	jr ra
  
      
  .globl FillMatrix
  #.type FillMatrix, @function
  FillMatrix:
  	addi sp, sp, -28
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)

    mv s0, a0     # Address matrix
    mv s1, a1     # Size of matrix M
    # s2            iter (i)
    # s3            iter (j)
    li s5, 0	  # Matrix bias


    li s2, -1
    .L_outer_loop: addi s2, s2, 1
                   beq s2, s1, .L_exit_loop

                  li s3, -1
                  .L_inner_loop: addi s3, s3, 1
                                 beq s3, s1, .L_outer_loop
					  
                    bgt s2, s3, .L_right_lower	# a > b
                    ble s2, s3, .L_left_lower	# a <= b
                    
                    .L_resume_flow:
                    jal ra, sum
                    
                    mv s5, s1
                    mul s5, s5, s2
                    add s5, s5, s3
                    li t0, 4
                    mul s5, s5, t0
                    add s5, s5, s0
                    
                    sw a0, 0(s5)
						
                  j .L_inner_loop

    .L_exit_loop:


    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    addi sp, sp, 28

    jr ra
    
    
    # Used to load the correct parameters to function
    .L_left_lower:
        mv a0, s2	# i
        mv a1, s3	# j
    	j .L_resume_flow
    
    
    .L_right_lower:
    	mv a0, s3	# j
        mv a1, s2	# i
    	j .L_resume_flow
