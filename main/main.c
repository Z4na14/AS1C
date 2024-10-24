#include <stdio.h>


void factorialMatrix(int *matrixA, int *matrixB, int N, int M);

int app_main() {

  int N = 2;
  int M = 3;
  int matrixA[] = {1, 2, 3, 4, 5, 6};
  int matrixB[N][M];

  factorialMatrix(&matrixA[0], &matrixB[0][0], N, M);

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      printf("%d ", matrixB[i][j]);
    }
    printf("\n");
  }

  return 0;
}

