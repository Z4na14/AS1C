Compute_Function:

    mv fs0 fa0            # Save x and use it as parameter for pow
    fmv.w.x fs1 a0        # p
    fmv.w.x fs2 a1        # q
    fmv.w.x fs3 a2        # r

    li a0 2               # Call the pow function
    jal ra pow

    fmul.s fa0 fa0 fs1    # p * pow(x, 2)
    fmul.s fs2 fs2 fs0    # q * x

    # Add everything up
    fadd.s fa0 fa0 fs2
    fadd.s fa0 fa0 fs3

    jr ra                 # Return everything


Compute_Integral:

    # First we save all the used parameters
    # As b is only used at the beginning,
    # we don't save it

    addi sp sp -32
    sb a0 0(sp)           # a
    sb a2 4(sp)           # p
    sb a3 8(sp)           # q
    sb a4 12(sp)          # r
    sb a5 16(sp)          # N

    # h = (b - a) / N
    sub s0 a1 a0
    fmv.w.x fs0 s0
    fmv.w.x fs3 s5        # Save N into floating register
    fdiv.s fs0 fs0 fs3    # to perform operation

    li fs1 0.0

    li s0 0
    loop: beq a5 s0 end

        


    end:
