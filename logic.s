	.data
A:
	.word 0x00001111
B:
	.word 0x11110000
	/* --- TEXT --- */
	.section .text
	.global main
	.type main, %function
var:
	.word A
	.word B
main:
	ldr r0, var
	/*ldr r1, =A*/
	ldr r1, [r0], #4
	/*ldr r2, =B*/
	ldr r2, [r0]
	and r0, r1, r2
	orr r0, r1, r2
	mvn r0, r0
	eor r0, r1, r2
	orr r0, r1, r2
	bic r0, r0, r1
	orr r0, r1, r2
	bic r0, r0, r2

	bic r2, r2, #0xffffffff
	ldr r2, =#0xffffffff
	ldr r2, =#0
	nop
	.end
