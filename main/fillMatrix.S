.globl sum
.type sum, @function
sum:
li t0, 2

// a0 = a0*2 + a1
mul a0, a0, t0
add a0, a0, a1

jr ra


.globl FillMatrix
.type FillMatrix, @function
FillMatrix:
addi sp, sp, -20
sw ra, 0(sp)
sw s0, 4(sp)
sw s1, 8(sp)
sw s2, 12(sp)
sw s3, 16(sp)

mv s0, a0     // Address matrix
mv s1, a1     // Size of matrix M
li s2, -1     // iter (i)
li s3, -1     // iter (j)


.L_extLoop: addi s2, s2, 1
            bge s2, s1, .L_exit
            li s3, -1
  .L_inLoop: addi s3, s3, 1
             bge s3, s1, .L_extLoop

    bgt s3, s2, .L_right_lower  // a > b
    ble s3, s2, .L_left_lower   // a <= b
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


// Used to load the correct parameters to function
.L_left_lower:
mv a0, s2 // i
mv a1, s3 // j
j .L_resume_flow


.L_right_lower:
mv a0, s3 // j
mv a1, s2 // i
j .L_resume_flow
