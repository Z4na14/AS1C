#include "pseudocode_Ex1.h"
#include "pseudocode_Ex2.h"
#include <stdio.h>


void main() {

    float integrals[100][100];
    Integral_Matrix((float *)integrals, 20, 5, 3, 2);

    for (int i = 0; i<100; i++) {
        printf("\n");

        for (int j = 0; j<i; j++) {

            printf("%f ", integrals[i][j]);
        }
    }

    printf("\n");
}
