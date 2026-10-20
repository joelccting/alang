/* data section */
	.data
	.align 4

	.type A, %object
	.size A, 4
A:
	.word 0x55667788

/* Data Processing Instructions */
	.section .text
	.global main
	.type main, %function
.var:
	.word A
main:
	ldr r1, .var 		@r1 := mem32[r0]
	ldr r2, =#0x11223344	@r2 := 0x11223344
	swp r3, r2, [r1]	@tmp := [r1]
				@[r1] := r2
				@r3 := tmp
	nop
	.end
