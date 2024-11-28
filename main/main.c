#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "sdkconfig.h"
#include "esp_cpu.h"



void FillMatrix(int *array, int size);
void sum(int val0, int val1);


void app_main(void) {

  esp_cpu_cycle_count_t before_run;
  esp_cpu_cycle_count_t after_run;

  int array_4bit[16];
  int array_8bit[64];
  int array_16bit[256];

  printf("Started Program... \n");
  printf("---------------------------- \n");
  printf("Executing 4 int array lenght \n");
  
  before_run = esp_cpu_get_cycle_count();
  FillMatrix(&array_4bit[0], 4); 
  after_run = esp_cpu_get_cycle_count();
  
  printf("It took %ld clock cycles \n", after_run - before_run);
  printf("---------------------------- \n");

  printf("---------------------------- \n");
  printf("Executing 8 int array lenght \n");
  
  before_run = esp_cpu_get_cycle_count();
  FillMatrix(&array_8bit[0], 8);
  after_run = esp_cpu_get_cycle_count();
 
  printf("It took %ld clock cycles \n", after_run - before_run);
  printf("---------------------------- \n");

 
  printf("---------------------------- \n");
  printf("Executing 16 int array lenght \n");
  before_run = esp_cpu_get_cycle_count();
  FillMatrix(&array_16bit[0], 16);
  after_run = esp_cpu_get_cycle_count();

  printf("It took %ld clock cycles \n", after_run - before_run);
  printf("---------------------------- \n");

  printf("Finished program \n");
}

