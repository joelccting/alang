	/* --- DATA --- */
	.data
	/*.align 4*/
	/*.type A, %object*/
A:
	.word 0x11
@	/*.type B, %object*/
B:
	.word 0x22
	/* --- TEXT ---*/
	.section .text
	.global main
	.type main, %function
data:
	.word A
	.word B
main:
	ldr r1, =A
	ldr r1, [r1]
	ldr r2, =B
	ldr r2, [r2]
	add r0, r1, r2
	nop
	.end
	
