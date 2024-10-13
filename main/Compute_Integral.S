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
    sb a2 0(sp)           # p
    sb a3 4(sp)           # q
    sb a4 8(sp)           # r

    # h = (b - a) / N
    sub s0 a1 a0
    fcvt.s.w fs0 s0
    fcvt.s.w fs3 a5       # Save N into floating register
    fdiv.s fs0 fs0 fs3    # to perform operation

    fcvt.s.w fs2 a0       # We store 'a' in fs2 for arithmetics

    li s0 0               # Declaring 'n'
    mv s1 a5
    sb s1 12(sp)          # Storing 'N'
    fsw fs0 16(sp)        # Storing 'h'
    fsw fs2 24(sp)        # Storing 'a' float

loop: beq s1 s0 end

        fcvt.s.w fs3 s0        # Use same register to operate with 'n'
        fmul.s fa0 fs3 fs0
        fadd.s fa0 fa0 fs2     # Storing x directly in argument

        fsw fs1 20(sp)         # Storing sum
        sb  s0  28(sp)         # Storing iterator 'n'


        lb a0 0(sp)            # Loading 'p' to argument
        lb a1 4(sp)            # Loading 'q' to argument
        lb a2 8(sp)            # Loading 'r' to argument
        sw ra 32(sp)           # Storing return address from first call
        jal ra Compute_Function
        lw ra 32(sp)           # Restoring address from first call

        lb s1 12(sp)           # Loading 'N'
        flw fs0 16(sp)         # Loading 'h'
        flw fs1 20(sp)         # Loading sum
        flw fs2 24(sp)         # Loading 'a'
        lb s0 28(sp)           # loading 'n'

        fadd.s fs1 fs1 fa0
        addi s0 s0 1

        j loop

end: fmv.s fa0 fs1            # Passing sum to return register
	   fmul.s fa0 fa0 fs0       # Multiplying by 'h' the last value (Aproximation)
     addi sp sp 36
     jr ra

