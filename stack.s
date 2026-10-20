	.data
	.align 4
	.type A, %object
A:
	.word 0x01234567
	
	.type B, %object
B:
	.word 0x89abcdef

	.type C, %object
C:	
	.word 0x13579bdf

	.type D, %object
D:
	.word 0x2468ace0

	.section .text
	.global main
	.type main, %function
data:
	.word A
	.word B
	.word C
	.word D
main:
	ldr r1, data
	ldm r1, {r2, r3, r4, r5}
	stmfa sp!, {r2, r3, r4, r5}
	ldmfa sp!, {r6, r7, r8, r9}
	nop
	.end
