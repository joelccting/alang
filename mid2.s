/* 2022 Midterm Q3 */

	.data
A:
	.word 0x0

	.section .text
	.global main
	.type main, %function
main:
	LDR r0, =#0x143f01fc
	LDR r1, = A
	STR r0, [r1]
	LDRSB r2, [r1]
	nop
	.end
