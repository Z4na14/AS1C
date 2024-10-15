    .section .text
    .globl pow
    .type pow, @function

pow:

    li t0, 1
    mv t1, a0
    fcvt.s.w ft0, t0
    fmul.s ft0, ft0, fa0

    .L_loop:  beq t0, t1, .L_end_loop
        fmul.s fa0, fa0, ft0
        addi t0, t0, 1
        j .L_loop
    .L_end_loop: jr ra

