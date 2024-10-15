#include "../components/Compute_Integral/include/Compute_Integral.h"
#include "../components/Integral_Matrix/include/Integral_Matrix.h"
#include "../components/pow/include/pow.h"
#include <stdio.h>


void app_main(void) {
	printf("Hello world\n");

  float result = Compute_Integral(0, 10, 5, 3, 2, 1000);

  printf("The result is: %f\n", result);

}
