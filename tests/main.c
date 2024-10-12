#include "pseudocode_Ex1.h"
#include "pseudocode_Ex2.h"
#include <stdio.h>


void test_Program(float *matrix, int M, int p, int q, int r) {

    Integral_Matrix(matrix, M, p, q, r);

    for (int i = 0; i<M-1; i++) {
        printf("\n");

        for (int j = i+1; j<M; j++) {

            printf("%f ", *(matrix+((i*M)+j)));
        }
    }

    printf("\n");
}

void main() {

    int size = 20;
    float matrix1[size][size];

    test_Program(&matrix1[0][0], size, 5, 3, 2);
    test_Program(&matrix1[0][0], size, -20, 8, 10);
    test_Program(&matrix1[0][0], size, 1, 10, -5);
    test_Program(&matrix1[0][0], size, 0, 2, 0);
}
