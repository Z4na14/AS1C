.text
.type main, @function
.globl main
.data
  # values to be defined for the matrix
  Matrix4: .zero 64
  Matrix8: .zero 256
  Matrix16:.zero 1024
  
  # number of rows and columns
  M4: .word 4 
  M8: .word 8
  M16:.word 16
  
  newline: .string "\n"


.text

  .globl main
  main:
    addi sp, sp, -24
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    
    
    la a0, Matrix4
    la a1, M4
    lw a1, 0(a1)
    
    # the function is executed for the first time
#### rdcycles0####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s0, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    jal ra, FillMatrix
#### rdcycles1####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s1, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here.
    li a7, 1
    mv a0, s1
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    li a7, 4
    la a0, newline
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    
    la a0, Matrix8
    la a1, M8
    lw a1, 0(a1)
    
    # the function is executed a second time
#### rdcycles0####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s0, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    jal ra, FillMatrix
#### rdcycles1####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s1, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here
    li a7, 1
    mv a0, s1
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    li a7, 4
    la a0, newline
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    
    la a0, Matrix16
    la a1, M16
    lw a1, 0(a1)
    
    # the function is executed a third time
#### rdcycles0####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s0, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    jal ra, FillMatrix
#### rdcycles1####
addi sp, sp, -8
sw ra, 4(sp)
sw a0, 0(sp)
jal ra, _rdcycle
mv s1, a0
lw a0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
####################
    sub s1, s1, s0
    # The number of cycles (s1) is to be printed here
    li a7, 1
    mv a0, s1
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    li a7, 4
    la a0, newline
#### ecall ####
addi sp, sp, -128
sw x1,  120(sp)
sw x3,  112(sp)
sw x4,  108(sp)
sw x5,  104(sp)
sw x6,  100(sp)
sw x7,  96(sp)
sw x8,  92(sp)
sw x9,  88(sp)
sw x18, 52(sp)
sw x19, 48(sp)
sw x20, 44(sp)
sw x21, 40(sp)
sw x22, 36(sp)
sw x23, 32(sp)
sw x24, 28(sp)
sw x25, 24(sp)
sw x26, 20(sp)
sw x27, 16(sp)
sw x28, 12(sp)
sw x29, 8(sp)
sw x30, 4(sp)
sw x31, 0(sp)
jal _myecall
lw x1,  120(sp)
lw x3,  112(sp)
lw x4,  108(sp)
lw x5,  104(sp)
lw x6,  100(sp)
lw x7,  96(sp)
lw x8,  92(sp)
lw x9,  88(sp)
lw x18, 52(sp)
lw x19, 48(sp)
lw x20, 44(sp)
lw x21, 40(sp)
lw x22, 36(sp)
lw x23, 32(sp)
lw x24, 28(sp)
lw x25, 24(sp)
lw x26, 20(sp)
lw x27, 16(sp)
lw x28, 12(sp)
lw x29, 8(sp)
lw x30, 4(sp)
lw x31, 0(sp)
addi sp, sp, 128
###############
    
    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    addi sp, sp, 24
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
