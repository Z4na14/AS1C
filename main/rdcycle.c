#include <stdio.h>
#include <esp_cpu.h>


int rdcycle(void) {
  int x = esp_cpu_get_cycle_count();
  printf("%d\n", x);
  return x;
}
