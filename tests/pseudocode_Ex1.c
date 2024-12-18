#include <stdio.h>
#include <math.h>


float Compute_Function(float x, int p, int q, int r) {

	// The function returns the value corresponding
	// to f(x) = px^2 +qx +r
	
	float result = (p*pow(x, 2.0)) + (q*x) + r;

  if (result < 0) {
    result = (0-result);
  }

	return result;
	
}

float Compute_Integral(int a, int b, int p, int q, int r, int N) {

	// h = (b-a)/N    N-1
	// integral = h * SUM(f(a + n*h))
	//                n=0

	// N is the number of values to take between a and b.
	// N=1000 used.

	// f(x) = px^2 +qx +r  /  a = initial value, b = end value
	
	// The function does not have to print anything.
	// A function to calculate f(x) is mandatory.
	
	if (b < a || N < 1) {
		return 0.0;
	}

	float h = ((float) b - (float) a) / (float) N;
	float sum = 0.0;
	float curr_val;

	for (int n = 0; n < N; n++) {
		curr_val = a+(n*h);
		sum += Compute_Function(curr_val, p, q, r);
	}

  sum *= h;
  printf("h:%f, sum:%f, i:%d, j:%d", h, sum, a, b);

	return sum;
}

