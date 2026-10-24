/* Compare */
	.data
A:
	.word 0xffff0000
B:
	.word 0x0000ffff
N:
	.word 0x80000000
Z:
	.word 0x40000000
C:
	.word 0x20000000
V:
	.word 0x10000000

	.section .text
	.global main
	.type main, %function
vars:
	.word A
	.word B
	.word N
	.word Z
	.word C
	.word V
main:
	ldr r0, =A
	ldr r1, [r0], #4
	ldr r2, [r0], #4

	ldr r3, =Z
	ldr r3, [r3] 
	cmp r1, r1
	mrs r4, cpsr  /*NOTE: use "Move Status Register to General Purpose Register */
	and r4, r4, r3 
	
	cmp r1, r2
	mrs r4, cpsr  /*NOTE: use "Move Status Register to General Purpose Register */
	and r4, r4, r3 
	
	cmn r1, r2
	tst r1, r1
	tst r1, r2
	teq r1, r1
	teq r1, r2
	
	nop
	.end
	.
