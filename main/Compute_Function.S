Compute_Function:

    fmv.s fs0 fa0            # Save x and use it as parameter for pow
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

    jr ra                 # Return everything
