#include "pseudocode_Ex1.h"
#include <stdio.h>


void Integral_Matrix(float *matrix, int M, int p, int q, int r) {

    /*
      0 1 2 3 4 | j
    0 X V V V V
    1 X X V V V
    2 X X X V V
    3 X X X X V
    4 X X X X X
    -
    i

    The function creates a matrix with the respective definite integral
    solved. It would be stored in memory, so no value is returned.

    The same function used in the last exercise will be used.
    */

    for (int i = 0; i<M-1; i++) {
        for (int j = i+1; j<M; j++) {
           *(matrix+((i*M)+j)) = (float) Compute_Integral(i, j, p, q, r, 1000);
           printf(" Value stored in matrix: %f\n", *(matrix+((i*M)+j)));
    }
  }
}
