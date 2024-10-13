.data
	
    Matrix: .zero 100    # 5x5 matrix
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
