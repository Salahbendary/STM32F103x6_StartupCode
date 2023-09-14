	.cpu cortex-m3
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"startup_stm32F103x6.c"
	.text
	.global	MSP_value
	.section	.rodata
	.align	2
	.type	MSP_value, %object
	.size	MSP_value, 4
MSP_value:
	.word	_estack
	.global	vector_Table
	.section	.isr_vector,"aw"
	.align	2
	.type	vector_Table, %object
	.size	vector_Table, 268
vector_Table:
	.word	_estack
	.word	Reset_Handler
	.word	NMI_Handler
	.word	HardFault_Handler
	.word	MemManage_Handler
	.word	BusFault_Handler
	.word	UsageFault_Handler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler
	.word	DebugMon_Handler
	.word	0
	.word	PendSV_Handler
	.word	SysTick_Handler
	.word	WWDG_IRQHandler
	.word	PVD_IRQHandler
	.word	TAMPER_IRQHandler
	.word	RTC_IRQHandler
	.word	FLASH_IRQHandler
	.word	RCC_IRQHandler
	.word	EXTI0_IRQHandler
	.word	EXTI1_IRQHandler
	.word	EXTI2_IRQHandler
	.word	EXTI3_IRQHandler
	.word	EXTI4_IRQHandler
	.word	DMA1_Channel1_IRQHandler
	.word	DMA1_Channel2_IRQHandler
	.word	DMA1_Channel3_IRQHandler
	.word	DMA1_Channel4_IRQHandler
	.word	DMA1_Channel5_IRQHandler
	.word	DMA1_Channel6_IRQHandler
	.word	DMA1_Channel7_IRQHandler
	.word	ADC1_2_IRQHandler
	.word	USB_HP_CAN1_TX_IRQHandler
	.word	USB_LP_CAN1_RX0_IRQHandler
	.word	CAN1_RX1_IRQHandler
	.word	CAN1_SCE_IRQHandler
	.word	EXTI9_5_IRQHandler
	.word	TIM1_BRK_IRQHandler
	.word	TIM1_UP_IRQHandler
	.word	TIM1_TRG_COM_IRQHandler
	.word	TIM1_CC_IRQHandler
	.word	TIM2_IRQHandler
	.word	TIM3_IRQHandler
	.word	TIM4_IRQHandler
	.word	I2C1_EV_IRQHandler
	.word	I2C1_ER_IRQHandler
	.word	I2C2_EV_IRQHandler
	.word	I2C2_ER_IRQHandler
	.word	SPI1_IRQHandler
	.word	SPI2_IRQHandler
	.word	USART1_IRQHandler
	.word	USART2_IRQHandler
	.word	USART3_IRQHandler
	.word	EXTI15_10_IRQHandler
	.word	RTC_Alarm_IRQHandler
	.word	USBWakeUp_IRQHandler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	BootRAM
	.text
	.align	1
	.arch armv7-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	System_Intitialization, %function
System_Intitialization:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	System_Intitialization, .-System_Intitialization
	.align	1
	.global	Reset_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	Reset_Handler, %function
Reset_Handler:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	ldr	r2, .L7
	ldr	r3, .L7+4
	subs	r3, r2, r3
	asrs	r3, r3, #2
	str	r3, [r7, #8]
	ldr	r3, .L7+8
	str	r3, [r7, #20]
	ldr	r3, .L7+4
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L3
.L4:
	ldr	r2, [r7, #20]
	adds	r3, r2, #4
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r1, r3, #4
	str	r1, [r7, #16]
	ldr	r2, [r2]
	str	r2, [r3]
.L3:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	.L4
	ldr	r2, .L7+12
	ldr	r3, .L7+16
	subs	r3, r2, r3
	asrs	r3, r3, #2
	str	r3, [r7, #8]
	ldr	r3, .L7+16
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L5
.L6:
	ldr	r3, [r7, #16]
	adds	r2, r3, #4
	str	r2, [r7, #16]
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L5:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	.L6
	bl	System_Intitialization
	bl	main
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	_edata
	.word	_sdata
	.word	_sidata
	.word	_ebss
	.word	_sbss
	.size	Reset_Handler, .-Reset_Handler
	.align	1
	.global	NMI_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	NMI_Handler, %function
NMI_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	NMI_Handler, .-NMI_Handler
	.align	1
	.global	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	HardFault_Handler, .-HardFault_Handler
	.align	1
	.global	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	MemManage_Handler, .-MemManage_Handler
	.align	1
	.global	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	BusFault_Handler, .-BusFault_Handler
	.align	1
	.global	UsageFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	UsageFault_Handler, %function
UsageFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	UsageFault_Handler, .-UsageFault_Handler
	.align	1
	.global	SVC_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SVC_Handler, %function
SVC_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	SVC_Handler, .-SVC_Handler
	.align	1
	.global	DebugMon_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DebugMon_Handler, %function
DebugMon_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DebugMon_Handler, .-DebugMon_Handler
	.align	1
	.global	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.global	WWDG_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	WWDG_IRQHandler, %function
WWDG_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	WWDG_IRQHandler, .-WWDG_IRQHandler
	.align	1
	.global	PVD_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	PVD_IRQHandler, %function
PVD_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	PVD_IRQHandler, .-PVD_IRQHandler
	.align	1
	.global	TAMPER_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TAMPER_IRQHandler, %function
TAMPER_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TAMPER_IRQHandler, .-TAMPER_IRQHandler
	.align	1
	.global	RTC_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	RTC_IRQHandler, %function
RTC_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	RTC_IRQHandler, .-RTC_IRQHandler
	.align	1
	.global	FLASH_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	FLASH_IRQHandler, %function
FLASH_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	FLASH_IRQHandler, .-FLASH_IRQHandler
	.align	1
	.global	RCC_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	RCC_IRQHandler, %function
RCC_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	RCC_IRQHandler, .-RCC_IRQHandler
	.align	1
	.global	EXTI0_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI0_IRQHandler, %function
EXTI0_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI0_IRQHandler, .-EXTI0_IRQHandler
	.align	1
	.global	EXTI1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI1_IRQHandler, %function
EXTI1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI1_IRQHandler, .-EXTI1_IRQHandler
	.align	1
	.global	EXTI2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI2_IRQHandler, %function
EXTI2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI2_IRQHandler, .-EXTI2_IRQHandler
	.align	1
	.global	EXTI3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI3_IRQHandler, %function
EXTI3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI3_IRQHandler, .-EXTI3_IRQHandler
	.align	1
	.global	EXTI4_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI4_IRQHandler, %function
EXTI4_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI4_IRQHandler, .-EXTI4_IRQHandler
	.align	1
	.global	DMA1_Channel1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel1_IRQHandler, %function
DMA1_Channel1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel1_IRQHandler, .-DMA1_Channel1_IRQHandler
	.align	1
	.global	DMA1_Channel2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel2_IRQHandler, %function
DMA1_Channel2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel2_IRQHandler, .-DMA1_Channel2_IRQHandler
	.align	1
	.global	DMA1_Channel3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel3_IRQHandler, %function
DMA1_Channel3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel3_IRQHandler, .-DMA1_Channel3_IRQHandler
	.align	1
	.global	DMA1_Channel4_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel4_IRQHandler, %function
DMA1_Channel4_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel4_IRQHandler, .-DMA1_Channel4_IRQHandler
	.align	1
	.global	DMA1_Channel5_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel5_IRQHandler, %function
DMA1_Channel5_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel5_IRQHandler, .-DMA1_Channel5_IRQHandler
	.align	1
	.global	DMA1_Channel6_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel6_IRQHandler, %function
DMA1_Channel6_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel6_IRQHandler, .-DMA1_Channel6_IRQHandler
	.align	1
	.global	DMA1_Channel7_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	DMA1_Channel7_IRQHandler, %function
DMA1_Channel7_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	DMA1_Channel7_IRQHandler, .-DMA1_Channel7_IRQHandler
	.align	1
	.global	ADC1_2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ADC1_2_IRQHandler, %function
ADC1_2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	ADC1_2_IRQHandler, .-ADC1_2_IRQHandler
	.align	1
	.global	USB_HP_CAN1_TX_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USB_HP_CAN1_TX_IRQHandler, %function
USB_HP_CAN1_TX_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USB_HP_CAN1_TX_IRQHandler, .-USB_HP_CAN1_TX_IRQHandler
	.align	1
	.global	USB_LP_CAN1_RX0_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USB_LP_CAN1_RX0_IRQHandler, %function
USB_LP_CAN1_RX0_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USB_LP_CAN1_RX0_IRQHandler, .-USB_LP_CAN1_RX0_IRQHandler
	.align	1
	.global	CAN1_RX1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	CAN1_RX1_IRQHandler, %function
CAN1_RX1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	CAN1_RX1_IRQHandler, .-CAN1_RX1_IRQHandler
	.align	1
	.global	CAN1_SCE_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	CAN1_SCE_IRQHandler, %function
CAN1_SCE_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	CAN1_SCE_IRQHandler, .-CAN1_SCE_IRQHandler
	.align	1
	.global	EXTI9_5_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI9_5_IRQHandler, %function
EXTI9_5_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI9_5_IRQHandler, .-EXTI9_5_IRQHandler
	.align	1
	.global	TIM1_BRK_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM1_BRK_IRQHandler, %function
TIM1_BRK_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM1_BRK_IRQHandler, .-TIM1_BRK_IRQHandler
	.align	1
	.global	TIM1_UP_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM1_UP_IRQHandler, %function
TIM1_UP_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM1_UP_IRQHandler, .-TIM1_UP_IRQHandler
	.align	1
	.global	TIM1_TRG_COM_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM1_TRG_COM_IRQHandler, %function
TIM1_TRG_COM_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM1_TRG_COM_IRQHandler, .-TIM1_TRG_COM_IRQHandler
	.align	1
	.global	TIM1_CC_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM1_CC_IRQHandler, %function
TIM1_CC_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM1_CC_IRQHandler, .-TIM1_CC_IRQHandler
	.align	1
	.global	TIM2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM2_IRQHandler, %function
TIM2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM2_IRQHandler, .-TIM2_IRQHandler
	.align	1
	.global	TIM3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM3_IRQHandler, %function
TIM3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM3_IRQHandler, .-TIM3_IRQHandler
	.align	1
	.global	TIM4_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	TIM4_IRQHandler, %function
TIM4_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	TIM4_IRQHandler, .-TIM4_IRQHandler
	.align	1
	.global	I2C1_EV_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	I2C1_EV_IRQHandler, %function
I2C1_EV_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	I2C1_EV_IRQHandler, .-I2C1_EV_IRQHandler
	.align	1
	.global	I2C1_ER_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	I2C1_ER_IRQHandler, %function
I2C1_ER_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	I2C1_ER_IRQHandler, .-I2C1_ER_IRQHandler
	.align	1
	.global	I2C2_EV_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	I2C2_EV_IRQHandler, %function
I2C2_EV_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	I2C2_EV_IRQHandler, .-I2C2_EV_IRQHandler
	.align	1
	.global	I2C2_ER_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	I2C2_ER_IRQHandler, %function
I2C2_ER_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	I2C2_ER_IRQHandler, .-I2C2_ER_IRQHandler
	.align	1
	.global	SPI1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SPI1_IRQHandler, %function
SPI1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	SPI1_IRQHandler, .-SPI1_IRQHandler
	.align	1
	.global	SPI2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	SPI2_IRQHandler, %function
SPI2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	SPI2_IRQHandler, .-SPI2_IRQHandler
	.align	1
	.global	USART1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USART1_IRQHandler, %function
USART1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USART1_IRQHandler, .-USART1_IRQHandler
	.align	1
	.global	USART2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USART2_IRQHandler, %function
USART2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USART2_IRQHandler, .-USART2_IRQHandler
	.align	1
	.global	USART3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USART3_IRQHandler, %function
USART3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USART3_IRQHandler, .-USART3_IRQHandler
	.align	1
	.global	EXTI15_10_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	EXTI15_10_IRQHandler, %function
EXTI15_10_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	EXTI15_10_IRQHandler, .-EXTI15_10_IRQHandler
	.align	1
	.global	RTC_Alarm_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	RTC_Alarm_IRQHandler, %function
RTC_Alarm_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	RTC_Alarm_IRQHandler, .-RTC_Alarm_IRQHandler
	.align	1
	.global	USBWakeUp_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	USBWakeUp_IRQHandler, %function
USBWakeUp_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	USBWakeUp_IRQHandler, .-USBWakeUp_IRQHandler
	.align	1
	.global	BootRAM
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	BootRAM, %function
BootRAM:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	BootRAM, .-BootRAM
	.align	1
	.global	Default_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	Default_Handler, %function
Default_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	Default_Handler, .-Default_Handler
	.ident	"GCC: (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)"
