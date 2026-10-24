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
	bl add2
	ldmia r9!, {r1, r2}
	b exit
add2:
	stmfd sp!, {r1-r2, r9, lr}
	add r0, r1, r2
	mov r1, r0
	bl add3
	add r0, r0, r1
	ldmfd sp!, {r1-r2, r9, pc}
	mov pc, lr
add3:
	ldr r2, data
	add r2, r2, #8
	ldm r2, {r3, r4}
	eor r0, r0
	add r0, r3, r4
	add r0, r0, r1
	mov pc, lr
exit:
	nop
	.end
