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
	.file	"application.c"
	.text
	.global	Counter1
	.data
	.align	2
	.type	Counter1, %object
	.size	Counter1, 4
Counter1:
	.word	5
	.global	Counter2
	.align	2
	.type	Counter2, %object
	.size	Counter2, 4
Counter2:
	.word	10
	.global	Counter3
	.bss
	.align	2
	.type	Counter3, %object
	.size	Counter3, 4
Counter3:
	.space	4
	.global	Counter4
	.align	2
	.type	Counter4, %object
	.size	Counter4, 4
Counter4:
	.space	4
	.text
	.align	1
	.global	main
	.arch armv7-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	ldr	r3, .L10
	ldr	r3, [r3, #48]
	ldr	r2, .L10
	orr	r3, r3, #8
	str	r3, [r2, #48]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, .L10+4
	orr	r3, r3, #16777216
	str	r3, [r2]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, .L10+4
	orr	r3, r3, #67108864
	str	r3, [r2]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, .L10+4
	orr	r3, r3, #268435456
	str	r3, [r2]
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r2, .L10+4
	orr	r3, r3, #1073741824
	str	r3, [r2]
.L9:
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L7:
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	orr	r3, r3, #4096
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	orr	r3, r3, #8192
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	orr	r3, r3, #16384
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	orr	r3, r3, #32768
	str	r3, [r2, #20]
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L3
.L4:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L3:
	ldr	r3, [r7, #8]
	ldr	r2, .L10+8
	cmp	r3, r2
	bls	.L4
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	bic	r3, r3, #4096
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	bic	r3, r3, #8192
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	bic	r3, r3, #16384
	str	r3, [r2, #20]
	ldr	r3, .L10+4
	ldr	r3, [r3, #20]
	ldr	r2, .L10+4
	bic	r3, r3, #32768
	str	r3, [r2, #20]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L5
.L6:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L5:
	ldr	r3, [r7, #4]
	ldr	r2, .L10+8
	cmp	r3, r2
	bls	.L6
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #4
	bls	.L7
	ldr	r3, .L10+12
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L10+12
	str	r3, [r2]
	ldr	r3, .L10+16
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L10+16
	str	r3, [r2]
	ldr	r3, .L10+12
	ldr	r3, [r3]
	cmp	r3, #10
	bne	.L9
	ldr	r3, .L10+20
	movs	r2, #9
	str	r2, [r3]
	ldr	r3, .L10+24
	movs	r2, #8
	str	r2, [r3]
	b	.L9
.L11:
	.align	2
.L10:
	.word	1073887232
	.word	1073875968
	.word	156249
	.word	Counter1
	.word	Counter2
	.word	Counter3
	.word	Counter4
	.size	main, .-main
	.ident	"GCC: (GNU Arm Embedded Toolchain 10-2020-q4-major) 10.2.1 20201103 (release)"
