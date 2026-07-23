#include "stm32f411.h"

int main()
{
    RCC->AHB1ENR = 0;

    while(1);
}