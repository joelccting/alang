.equ SYS_WRITEC, 0x03
.equ SYS_WRITE0, 0x04
.equ SYS_EXIT, 0x18
.equ Angel_SWI_ARM, 0x123456
.equ ADP_Stopped_ApplicationExit, 0x20026
	.data
my_char:
	.byte 'H'
hello:
	.asciz "Hello World!\n"

	.section .text
	.global main
	.type main, %function
main:
	mov r0, #SYS_WRITEC
	ldr r1, =my_char
	svc #Angel_SWI_ARM

	mov r0, #SYS_WRITE0
	ldr r1, =hello
	svc #Angel_SWI_ARM
	
	mov r0, #0
	ldr r1, =ADP_Stopped_ApplicationExit
	stmdb sp!, {r0, r1}

	mov r0, #SYS_EXIT 
	mov r1, sp
	svc #Angel_SWI_ARM
	nop
	.end
