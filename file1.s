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
	.file	"file1.c"
	.text
	.global	var1
	.data
	.align	2
	.type	var1, %object
	.size	var1, 4
var1:
	.word	33
	.global	var2
	.align	1
	.type	var2, %object
	.size	var2, 2
var2:
	.short	44
	.global	var3
	.bss
	.type	var3, %object
	.size	var3, 1
var3:
	.space	1
	.global	var4
	.align	2
	.type	var4, %object
	.size	var4, 4
var4:
	.space	4
	.global	var11
	.section	.rodata
	.align	2
	.type	var11, %object
	.size	var11, 4
var11:
	.word	287454020
	.text
	.align	1
	.global	fun1
	.arch armv7-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fun1, %function
fun1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L2
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2
	str	r3, [r2]
	ldr	r3, .L2+4
	ldrh	r3, [r3]
	adds	r3, r3, #1
	uxth	r2, r3
	ldr	r3, .L2+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L2+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L2+8
	strb	r2, [r3]
	ldr	r3, .L2+12
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2+12
	str	r3, [r2]
	bl	fun2
	nop
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	var1
	.word	var2
	.word	var3
	.word	var4
	.size	fun1, .-fun1
	.ident	"GCC: (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)"
