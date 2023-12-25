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
	.file	"file2.c"
	.text
	.global	var5
	.data
	.align	2
	.type	var5, %object
	.size	var5, 4
var5:
	.word	33
	.global	var6
	.align	2
	.type	var6, %object
	.size	var6, 4
var6:
	.word	44
	.global	var7
	.bss
	.align	2
	.type	var7, %object
	.size	var7, 4
var7:
	.space	4
	.global	var8
	.align	2
	.type	var8, %object
	.size	var8, 4
var8:
	.space	4
	.text
	.align	1
	.global	fun2
	.arch armv7-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fun2, %function
fun2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L2
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2
	str	r3, [r2]
	ldr	r3, .L2+4
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2+4
	str	r3, [r2]
	ldr	r3, .L2+8
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2+8
	str	r3, [r2]
	ldr	r3, .L2+12
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2+12
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L3:
	.align	2
.L2:
	.word	var5
	.word	var6
	.word	var7
	.word	var8
	.size	fun2, .-fun2
	.ident	"GCC: (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)"
