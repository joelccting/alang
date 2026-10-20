/* Exercise on Load an Address into Register */
/* Handout page 72-74/112 */
	.data
	.align 4

	.type A, %object
A:
	.word 0x11223344

	.type B, %object
B:
	.word 0x55667788
	
	.type C, %object
C:
	.word 0x99aabbcc

	.type D, %object
D:
	.word 0xddeeff00

	.section .text
	.global main
	.type main, %function

data:
	.word A
	.word B
	.word C
	.word D

main:
	ldr r1, data		@r1 := data 
	ldm r1, {r2, r3, r4, r5} @r2 := mem32[r1]
				@r3 := mem32[r1 + 4]
				@r4 := mem32[r1 + 8]
				@r5 := mem32[r1 + 12]

	adr r1, data		@r1 := pc + data
	ldr r1, [r1]		@r1 := mem32[r1]
	ldm r1, {r2, r3, r4, r5} @r2 := mem32[r1]
				@r3 := mem32[r1 + 4]
				@r4 := mem32[r1 + 8]
				@r5 := mem32[r1 + 12]
	nop
	.end
