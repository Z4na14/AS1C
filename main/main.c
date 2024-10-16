#include "../components/Compute_Integral/include/Compute_Integral.h"
#include "../components/Integral_Matrix/include/Integral_Matrix.h"
#include "../components/Compute_Function/include/Compute_Function.h"
#include "../components/pow/include/pow.h"
#include <stdio.h>
#include <time.h>


void app_main(void) {

  int result = Compute_Integral(0, 500, 5, 3, 2, 100);
  int function = Compute_Function(320, 5, 3, 2);
  int power_val = pow(5, 4);
  printf("Integral: %d\nFunction: %d\nPower: %d\n\n", result, function, power_val);

  clock_t start, end;
  double cpu_time_used;

  start = clock();

  int size = 10;
  int values_integral[size][size];
  Integral_Matrix(&values_integral[0][0], size, 5, 3, 2);

  end = clock();
  cpu_time_used = ((double) (end) - (start)) / CLOCKS_PER_SEC;

  printf("Start time: %ld, End time: %ld\n", start, end);
  printf("Duration of the function: %.10f\nCycles per second: %d\n", cpu_time_used, CLOCKS_PER_SEC);


  for (int i = 0; i<size-1; i++) {
    printf("\n");

    for (int j = i+1; j<size; j++) {

      printf("%d", values_integral[i][j]);
    }
  }

  printf("\n");

  return;
}
