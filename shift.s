/* Shift */
	.data
A:
	.word 0x1

	.section .text
	.global main
	.type main, %function
vars:
	.word A
main:
	ldr r0, =A
	ldr r1, [r0]
	mov r2, r1, lsl #2
	mov r3, r1, lsl #4
	mov r4, r2, lsr #2
	mov r5, r3, lsr #4
	ldr r6, =#0x80000000
	mov r7, r6, asr #8
	ldr r6, =#0x70000000
	mov r7, r6, asr #8
	ldr r6, =#0x700000ff
	mov r7, r6, ror #4
	mov r7, r7, rrx
	nop
	.end
