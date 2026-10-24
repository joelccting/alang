	.data
	.align 4
	.type A, %object
A:
	.word 0x1
	
	.type B, %object
B:
	.word 0x2

	.type C, %object
C:	
	.word 0x3

	.type D, %object
D:
	.word 0x4

	.section .text
	.global main
	.type main, %function
data:
	.word A
	.word B
	.word C
	.word D
main:
	ldr r9, data
	ldmia r9!, {r1, r2}
	BL add2
	ldmia r9!, {r1, r2}
	bl add2
	b exit
add2:
	add r0, r1, r2
	mov pc, lr
exit:
	nop
	.end
