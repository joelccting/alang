	.section .text
	.global main
	.type main, %function
main:
	ldr r1, =#0xffffffff
	mvn r1, r1
	add r1, r1, #1
	mov r0, r1
	nop
	.end
