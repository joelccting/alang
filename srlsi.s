/* Exercise on single register load and store instructions */
/* DATA */
	.data
	.align 4
	.type C, %object
C:
	.word 0xff

	.type A, %object
A:
	.word 0x11223344

	.type B, %object
B:
	.word 0x55667788

/* TEXT */
	.section .text
	.global main
	.type main, %function
vars:
	.word A
	.word B
	.word C
main:
	/* post-indexed addressing mode */
	ldr r1, vars		@r1 := mem32[vars]
	ldr r2, [r1], #4	@r2 := mem32[r1]
				@r1 := r1 + 4
	ldr r3, [r1], #4	@r3 := mem32[r1]
				@r1 := r1 + 4
	add r0, r2, r3		@r0 := r2 + r3
	str r0, [r1]		@mem32[r1] = r0

	/* auto-indexing address mode, pre-index with writeback */
	ldr r1, vars		@r1 := mem32[vars]
	ldr r2, [r1, #4]!	@r2 := mem32[r1 + 4]
				@r1 := r1 + 4
	ldr r3, [r1, #4]!	@r3 := mem32[r1 + 4]
				@r1 := r1 + 4
	add r0, r2, r3		@r0 := r2 + r3
	str r0, [r1]		@mem32[r1] = r0

	/* pre-indexed addressing mode */
	ldr r1, vars
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	add r0, r2, r3
	str r0, [r1]	
	nop
	.end
