#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_chip_info.h"
#include "esp_flash.h"
#include "driver/uart.h"
#include "esp_cpu.h"

/// Misceláneo
#include "esp_sleep.h"
#include "esp_random.h"
#include "driver/gpio.h"


void FillMatrix(int size, int *array);

void app_main(void) {

  int before_run;
  int after_run;

  int array_4bit[16];
  int array_8bit[64];
  int array_16bit[256];

  printf("Started Program... \n");

  printf("Executing 4 int array lenght \n");
  printf("---------------------------- \n");

  before_run = esp_cpu_get_cycle_count();
  printf("holaaaaaaa");
  FillMatrix(4, &array_4bit[0]); 
  after_run = esp_cpu_get_cycle_count();

  printf("---------------------------- \n");

  printf("It took %d clock cycles \n", after_run - before_run);

  printf("Executing 8 int array lenght \n");
  printf("---------------------------- \n");

  before_run = esp_cpu_get_cycle_count();
  FillMatrix(8, &array_8bit[0]);
  after_run = esp_cpu_get_cycle_count();

  printf("---------------------------- \n");

  printf("It took %d clock cycles \n", after_run - before_run);

  printf("Executing 16 int array lenght \n");
  printf("---------------------------- \n");

  before_run = esp_cpu_get_cycle_count();
  FillMatrix(16, &array_16bit[0]);
  after_run = esp_cpu_get_cycle_count();

  printf("---------------------------- \n");

  printf("It took %d clock cycles \n", after_run - before_run);

  printf("Finished program \n");
}


