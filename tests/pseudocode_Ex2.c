#include "pseudocode_Ex1.h"


void Integral_Matrix(float matrix[], int M, int p, int q, int r) {

    /*
      1 2 3 4 5 | M2
    1 X X X X X
    2 V X X X X
    3 V V X X X
    4 V V V X X
    5 V V V V X
    -
    M1

    The function creates a matrix with the respective definite integral
    solved. It would be stored in memory, so no value is returned.

    The same function used in the last exercise will be used.
    */

    for (int i = 0; i<M; i++) {

        for (int j = 0; j<i; j++) {

            matrix[i][j] = Compute_Integral(i, j, p, q, r, 100);
    }
  }


}
