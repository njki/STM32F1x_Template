
#include "stm32f10x_conf.h"

int main(void) {
    GPIO_InitTypeDef GPIO_InitStructure;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOC, &GPIO_InitStructure);

    while (1) {
        GPIO_SetBits(GPIOC, GPIO_Pin_13);
        for(int i=0;i<100000; i++){
            __asm("nop");
        }

        GPIO_ResetBits(GPIOC, GPIO_Pin_13);
        for(int i=0;i<100000; i++){
            __asm("nop");
        }
    }
}
