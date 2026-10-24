/* 2024 midterm question 5 */
	.data
A:
	.word 0x5

	.section .text
	.global main
	.type main, %function
vars:
	.word A
main:
	ldr r1, =A @r1 := addr[A]
	ldr r1, [r1] @r1 := mem32[r1]
	ldr r2, =#0x80000000
	eor r3, r3, r3
loop:
	and r4, r1, r2
	cmp r4, #0
	addeq r3, r3, #1
	mov r2, r2, LSR #1
	cmp r2, #0
	bne loop
	nop
	.end
