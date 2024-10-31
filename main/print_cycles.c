#include <stdio.h>


void print_variables(int cycles, int *matrix, int rows, int cols) {
  printf("Number of cycles used: %d\n", cycles);
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      printf("%d ", *(matrix + (i * cols) + j));
    }
    printf("\n");
  }
  
  return;
}
