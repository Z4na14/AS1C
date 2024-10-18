#include <stdio.h>


int factorial(int x) {
  int result = 1;
  int i = x;
  while (i > 1) {
    result *= i;
    i--;
  }

  return result;
}

void factorialMatrix(int *matrixA, int *matrixB, int N, int M) {

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {

      *(matrixB + (i*M) + j) = factorial(*(matrixA + (i*M) + j));
    }
  }

  return;
}

int main() {

  int N = 2;
  int M = 3;
  int matrixA[][M] = {{1, 2, 3}, {4, 5, 6}};
  int matrixB[N][M];

  factorialMatrix(&matrixA[0][0], &matrixB[0][0], N, M);

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      printf("%d ", matrixB[i][j]);
    }
    printf("\n");
  }

  return 0;
}

