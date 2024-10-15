#include "../components/Compute_Integral/include/Compute_Integral.h"
#include "../components/Integral_Matrix/include/Integral_Matrix.h"
#include "../components/pow/include/pow.h"
#include <stdio.h>


void app_main(void) {
	printf("Hello world\n");

  int result = Compute_Integral(0, 500, 5, 3, 2, 100);

  printf("The result is: %d\n", result);

  return;
}
