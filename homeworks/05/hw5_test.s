/* Homework 5 */

/* --- DATA --- */
	.data
	.align 4
INPUT:
	.word 0x1 /* (0,0) */
	.word 0x2 /* (0,1) */
	.word 0x3 /* (0,2) */
	.word 0x4 /* (0,3) */
	.word 0x5 /* (0,4) */

	.word 0x6 /* (1,0) */
	.word 0x7 /* (1,1) */
	.word 0x8 /* (1,2) */
	.word 0x9 /* (1,3) */
	.word 0x0 /* (1,4) */

	.word 0x3 /* (2,0) */
	.word 0x2 /* (2,1) */
	.word 0x1 /* (2,2) */
	.word 0x4 /* (2,3) */
	.word 0x2 /* (2,4) */

	.word 0x1 /* (3,0) */
	.word 0x2 /* (3,1) */
	.word 0x0 /* (3,2) */
	.word 0x4 /* (3,3) */
	.word 0x5 /* (3,4) */

	.word 0x9 /* (4,0) */
	.word 0x2 /* (4,1) */
	.word 0x8 /* (4,2) */
	.word 0x4 /* (4,3) */
	.word 0x1 /* (4,4) */

ANS:
	.word 0x0 /* (0,0) */
	.word 0x0 /* (0,1) */
	.word 0x0 /* (0,2) */
	.word 0x0 /* (1,0) */
	.word 0x0 /* (1,1) */
	.word 0x0 /* (1,2) */
	.word 0x0 /* (2,0) */
	.word 0x0 /* (2,1) */
	.word 0x0 /* (2,2) */

/* --- CODE --- */
	.section .text
	.global main
	.type main, %function
main:
	/* APCS header */
	mov	ip, sp
	push	{fp, ip, lr, pc}
	sub	fp, ip, #4

	LDR r0, =INPUT
	LDR r1, =ANS
	bl maxPool2x2
	
	/* APCS tailer */
	sub	sp, fp, #12
	ldm	sp, {fp, sp, lr}
	bx	lr
	NOP
	.end
