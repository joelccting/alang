/* 2022 Midterm Q2 */
	.data
A:
	.word 0xFE824FC0

	.section .text
	.global main
	.type main, %function
var:
	.word A
main:
	LDR r0, =A
	LDRB r1, [r0]
	LDRSB r2, [r0]
	LDRSH r3, [r0, #2]
	LDR r4, [r0]
	nop
	.end
