.text

main:

    li a0 0
    li a1 10
    li a2 5
    li a3 3
    li a4 2
    li a5 10

    jal ra Compute_Integral

    li a7 2
    ecall

    li a7 10
    ecall

