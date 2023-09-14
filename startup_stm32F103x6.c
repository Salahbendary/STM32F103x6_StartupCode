/*
    @file   startup_stm32F103x6.c 
    @author Salah Bendary
    @brief  Startup code
*/


#define NULL 0

typedef unsigned long uint32_t; 

extern int main							(void);
static void System_Intitialization      (void);

void Reset_Handler                      (void);
void NMI_Handler                        (void);
void HardFault_Handler                  (void);
void MemManage_Handler                  (void);
void BusFault_Handler                   (void);
void UsageFault_Handler                 (void);
void SVC_Handler                        (void);
void DebugMon_Handler                   (void);	  
void PendSV_Handler					    (void);
void SysTick_Handler					(void);
void WWDG_IRQHandler					(void);
void PVD_IRQHandler						(void);
void TAMPER_IRQHandler					(void);
void RTC_IRQHandler						(void);
void FLASH_IRQHandler					(void);
void RCC_IRQHandler						(void);
void EXTI0_IRQHandler					(void);
void EXTI1_IRQHandler					(void);
void EXTI2_IRQHandler					(void);
void EXTI3_IRQHandler					(void);
void EXTI4_IRQHandler					(void);
void DMA1_Channel1_IRQHandler			(void);
void DMA1_Channel2_IRQHandler			(void);
void DMA1_Channel3_IRQHandler			(void);
void DMA1_Channel4_IRQHandler			(void);
void DMA1_Channel5_IRQHandler			(void);
void DMA1_Channel6_IRQHandler			(void);
void DMA1_Channel7_IRQHandler			(void);
void ADC1_2_IRQHandler					(void);
void USB_HP_CAN1_TX_IRQHandler			(void);
void USB_LP_CAN1_RX0_IRQHandler			(void);
void CAN1_RX1_IRQHandler				(void);
void CAN1_SCE_IRQHandler				(void);
void EXTI9_5_IRQHandler					(void);
void TIM1_BRK_IRQHandler				(void);
void TIM1_UP_IRQHandler					(void);
void TIM1_TRG_COM_IRQHandler			(void);
void TIM1_CC_IRQHandler					(void);
void TIM2_IRQHandler					(void);
void TIM3_IRQHandler					(void);
void TIM4_IRQHandler					(void);
void I2C1_EV_IRQHandler					(void);
void I2C1_ER_IRQHandler					(void);
void I2C2_EV_IRQHandler					(void);
void I2C2_ER_IRQHandler					(void);
void SPI1_IRQHandler					(void);
void SPI2_IRQHandler					(void);
void USART1_IRQHandler					(void);
void USART2_IRQHandler					(void);
void USART3_IRQHandler					(void);
void EXTI15_10_IRQHandler 				(void);
void RTC_Alarm_IRQHandler 				(void);
void USBWakeUp_IRQHandler 				(void);
void BootRAM							(void);        
                            

extern uint32_t _estack ,_etext,_sdata,_edata,_sbss,_ebss,_sidata;


uint32_t * const MSP_value = (uint32_t*) &_estack;
uint32_t *vector_Table[] __attribute__ ((section (".isr_vector"))) ={


	(uint32_t*)MSP_value,						          	 /* Main Stack Pointer */
	(uint32_t*)&Reset_Handler,                               /* Reset */
	(uint32_t*)&NMI_Handler,                                /* Non maskable interrupt */
	(uint32_t*)&HardFault_Handler,                          /* All class of fault */
	(uint32_t*)&MemManage_Handler,                          /* Memory management */
	(uint32_t*)&BusFault_Handler,                           /* Pre-fetch fault, memory access fault */ 
	(uint32_t*)&UsageFault_Handler,                         /* Undefined instruction or illegal state */
	 0,                                                     
	 0,                                                     
	 0,                                                     
	 0,                                                     
	(uint32_t*)& SVC_Handler,                               /* System service call via SWI instruction */
	(uint32_t*)& DebugMon_Handler,                          /* Debug Monitor */
	 0,
	(uint32_t*)& PendSV_Handler,				            /* Pendable request for system service */ 
	(uint32_t*)& SysTick_Handler,
	(uint32_t*)& WWDG_IRQHandler,
	(uint32_t*)& PVD_IRQHandler,
	(uint32_t*)& TAMPER_IRQHandler,
	(uint32_t*)& RTC_IRQHandler,
	(uint32_t*)& FLASH_IRQHandler,
	(uint32_t*)& RCC_IRQHandler,
	(uint32_t*)& EXTI0_IRQHandler,
	(uint32_t*)& EXTI1_IRQHandler,
	(uint32_t*)& EXTI2_IRQHandler,
	(uint32_t*)& EXTI3_IRQHandler,
	(uint32_t*)& EXTI4_IRQHandler,
	(uint32_t*)& DMA1_Channel1_IRQHandler,
	(uint32_t*)& DMA1_Channel2_IRQHandler,
	(uint32_t*)& DMA1_Channel3_IRQHandler,
	(uint32_t*)& DMA1_Channel4_IRQHandler,
	(uint32_t*)& DMA1_Channel5_IRQHandler,
	(uint32_t*)& DMA1_Channel6_IRQHandler,
	(uint32_t*)& DMA1_Channel7_IRQHandler,
	(uint32_t*)& ADC1_2_IRQHandler,
	(uint32_t*)& USB_HP_CAN1_TX_IRQHandler,
	(uint32_t*)& USB_LP_CAN1_RX0_IRQHandler,
	(uint32_t*)& CAN1_RX1_IRQHandler,
	(uint32_t*)& CAN1_SCE_IRQHandler,
	(uint32_t*)& EXTI9_5_IRQHandler,
	(uint32_t*)& TIM1_BRK_IRQHandler,
	(uint32_t*)& TIM1_UP_IRQHandler,
	(uint32_t*)& TIM1_TRG_COM_IRQHandler,
	(uint32_t*)& TIM1_CC_IRQHandler,
	(uint32_t*)& TIM2_IRQHandler,
	(uint32_t*)& TIM3_IRQHandler,
	(uint32_t*)& TIM4_IRQHandler,
	(uint32_t*)& I2C1_EV_IRQHandler,
	(uint32_t*)& I2C1_ER_IRQHandler,
	(uint32_t*)& I2C2_EV_IRQHandler,
	(uint32_t*)& I2C2_ER_IRQHandler,
	(uint32_t*)& SPI1_IRQHandler,
	(uint32_t*)& SPI2_IRQHandler,
	(uint32_t*)& USART1_IRQHandler,
	(uint32_t*)& USART2_IRQHandler,
	(uint32_t*)& USART3_IRQHandler,
	(uint32_t*)& EXTI15_10_IRQHandler,
	(uint32_t*)& RTC_Alarm_IRQHandler,
	(uint32_t*)& USBWakeUp_IRQHandler,
	 0,
	 0,
	 0,
	 0,
	 0,
	 0,
	 0,
	(uint32_t*)&BootRAM,        
                            


};


static void System_Intitialization(void){
    /* Clock intitialization */

}

void Reset_Handler(void)
{
	uint32_t section_Size=0;
	uint32_t *MemsourceAdd=NULL;
	uint32_t *MemDestAdd=NULL;

	/* 1) Copy the data segment initializers from flash to SRAM */
	section_Size = &_edata - &_sdata;
	
	MemsourceAdd = (uint32_t*)&_sidata;		 						    /* Length of .data segment */
	MemDestAdd = (uint32_t*)&_sdata;         						    /* Start address of .data sengement (LMA) -> Load Memory Address */
	for(uint32_t memcounter=0; memcounter<section_Size;memcounter)      /* Start address of .data sengement (VMA) -> Virtual Memory Address */
	{
		*MemDestAdd++ = *MemsourceAdd++;
	}

	/* 2) Initialize the .bss segment with zero */
	section_Size = &_ebss - &_sbss;				/* Length of .bss segment */
	MemDestAdd = &_sbss;                        /* Start address of .bss sengement */
	
	for(uint32_t memcounter=0; memcounter<section_Size;memcounter++ )
	{
		*MemDestAdd++ = 0;
	}

	/* 3) Call the system intitialization function */
    System_Intitialization();

	/* 4) Call the main function */
	main();
}
void NMI_Handler(void)
{

}
void HardFault_Handler(void)
{

}
void MemManage_Handler(void)
{

}
	
void BusFault_Handler(void)
{

}
void UsageFault_Handler(void)
{

}
void SVC_Handler(void)
{

}
void DebugMon_Handler(void)
{
	
}
void PendSV_Handler(void)
{

}
void SysTick_Handler(void)
{

}
void WWDG_IRQHandler(void)
{

}
void PVD_IRQHandler(void)
{

}
void TAMPER_IRQHandler(void)
{

}
void RTC_IRQHandler(void)
{

}
void FLASH_IRQHandler(void)
{

}
void RCC_IRQHandler(void)
{

}
void EXTI0_IRQHandler(void){
	
}
void EXTI1_IRQHandler(void){
	
}
void EXTI2_IRQHandler(void){
	
}
void EXTI3_IRQHandler(void){
	
}
void EXTI4_IRQHandler(void){
	
}

void DMA1_Channel1_IRQHandler(void){
	
}
void DMA1_Channel2_IRQHandler(void){
	
}
void DMA1_Channel3_IRQHandler(void){
	
}
void DMA1_Channel4_IRQHandler(void){
	
}
void DMA1_Channel5_IRQHandler(void){
	
}
void DMA1_Channel6_IRQHandler(void){
	
}
void DMA1_Channel7_IRQHandler(void){
	
}
void ADC1_2_IRQHandler(void){
	
}
void USB_HP_CAN1_TX_IRQHandler(void){
	
}
void USB_LP_CAN1_RX0_IRQHandler(void){
	
}
void CAN1_RX1_IRQHandler(void)
{

}
void CAN1_SCE_IRQHandler(void)
{

}
void EXTI9_5_IRQHandler(void)
{

}
void TIM1_BRK_IRQHandler(void)
{

}
void TIM1_UP_IRQHandler(void)
{

}
void TIM1_TRG_COM_IRQHandler(void)
{

}
void TIM1_CC_IRQHandler(void)
{

}
void TIM2_IRQHandler(void){
	
}
void TIM3_IRQHandler(void){
	
}
void TIM4_IRQHandler(void){
	
}
void I2C1_EV_IRQHandler(void){
	
}
void I2C1_ER_IRQHandler(void){
	
}
void I2C2_EV_IRQHandler(void){
	
}
void I2C2_ER_IRQHandler(void){
	
}
void SPI1_IRQHandler(void){
	
}
void SPI2_IRQHandler(void){
	
}
void USART1_IRQHandler(void){
	
}
void USART2_IRQHandler(void){
	
}
void USART3_IRQHandler(void){
	
}
void EXTI15_10_IRQHandler(void){
	
}
void RTC_Alarm_IRQHandler(void){
	
}
void USBWakeUp_IRQHandler(void){
	
}
void BootRAM(void){
	
}

void Default_Handler(void)
{
	
}