.data
  # values to be defined for the matrix
  Matrix4: .zero 64
  Matrix8: .zero 256
  Matrix16:.zero 1024
  
  # number of rows and columns
  M4: .word 4 
  M8: .word 8
  M16:.word 16
  
  newline: .string ": Clock cycles  ;"


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
    li a7, 1
    mv a0, s1
    ecall
    
    li a7, 4
    la a0, newline
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
    li a7, 1
    mv a0, s1
    ecall
    
    li a7, 4
    la a0, newline
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
    li a7, 1
    mv a0, s1
    ecall
    
    li a7, 4
    la a0, newline
    ecall
    
    
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12
    jr ra
    

sum:
li t0, 2

# a0 = a0*2 + a1
mul a0, a0, t0
add a0, a0, a1

jr ra

FillMatrix:
addi sp, sp, -20
sw ra, 0(sp)
sw s0, 4(sp)
sw s1, 8(sp)
sw s2, 12(sp)
sw s3, 16(sp)

mv s0, a0     # Address matrix
mv s1, a1     # Size of matrix M
li s2, -1     # iter (i)
li s3, -1     # iter (j)


.L_extLoop: addi s2, s2, 1
            bge s2, s1, .L_exit
            li s3, -1
  .L_inLoop: addi s3, s3, 1
             bge s3, s1, .L_extLoop

    bgt s3, s2, .L_right_lower  # a > b
    ble s3, s2, .L_left_lower   # a <= b
    .L_resume_flow:
	
    jal ra sum

    sw a0, 0(s0)

    addi s0, s0, 4
    j .L_inLoop


.L_exit:

lw ra, 0(sp)
lw s0, 4(sp)
lw s1, 8(sp)
lw s2, 12(sp)
lw s3, 16(sp)
addi sp, sp, 20

jr ra


# Used to load the correct parameters to function
.L_left_lower:
mv a0, s2 # i
mv a1, s3 # j
j .L_resume_flow


.L_right_lower:
mv a0, s3 # j
mv a1, s2 # i
j .L_resume_flow

  