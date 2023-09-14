# 1 "application.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "application.c"





typedef unsigned int uint32_t;

typedef struct
{
  volatile uint32_t MODER;
  volatile uint32_t OTYPER;
  volatile uint32_t OSPEEDR;
  volatile uint32_t PUPDR;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t LCKR;
  volatile uint32_t AFR[2];
} GPIO_TypeDef;

typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t PLLCFGR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t AHB1RSTR;
  volatile uint32_t AHB2RSTR;
  volatile uint32_t AHB3RSTR;
  uint32_t RESERVED0;
  volatile uint32_t APB1RSTR;
  volatile uint32_t APB2RSTR;
  uint32_t RESERVED1[2];
  volatile uint32_t AHB1ENR;
  volatile uint32_t AHB2ENR;
  volatile uint32_t AHB3ENR;
  uint32_t RESERVED2;
  volatile uint32_t APB1ENR;
  volatile uint32_t APB2ENR;
  uint32_t RESERVED3[2];
  volatile uint32_t AHB1LPENR;
  volatile uint32_t AHB2LPENR;
  volatile uint32_t AHB3LPENR;
  uint32_t RESERVED4;
  volatile uint32_t APB1LPENR;
  volatile uint32_t APB2LPENR;
  uint32_t RESERVED5[2];
  volatile uint32_t BDCR;
  volatile uint32_t CSR;
  uint32_t RESERVED6[2];
  volatile uint32_t SSCGR;
  volatile uint32_t PLLI2SCFGR;
} RCC_TypeDef;
# 71 "application.c"
uint32_t Counter1 = 5;
uint32_t Counter2 = 10;

uint32_t Counter3 = 0;
uint32_t Counter4;

int main(void){
    ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1ENR) |= ((0x1UL << (3U))));
    ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->MODER |= (1 << 24);
    ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->MODER |= (1 << 26);
    ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->MODER |= (1 << 28);
    ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->MODER |= (1 << 30);
    while(1){
        for(uint32_t counter = 0; counter < 5; counter++){
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR |= (1 << 12);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR |= (1 << 13);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR |= (1 << 14);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR |= (1 << 15);
            for(uint32_t i = 0 ; i < 156250 ; i++);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR &= ~(1 << 12);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR &= ~(1 << 13);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR &= ~(1 << 14);
            ((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL))->ODR &= ~(1 << 15);
            for(uint32_t i = 0 ; i < 156250 ; i++);
        }
        Counter1++;
        Counter2++;
        if(Counter1 == 10){
            Counter3 = 9;
            Counter4 = 8;
        }
    }
}
