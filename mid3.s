/* 2022 mid Q4 */
	.section .text
	.global main
	.type main, %function
main:
	MOV r6, #6
	MOV r7, #1
LOOP:
	CMP r6, #0
	MULGT r7, r6, r7
	SUBGT r6, r6, #1
	BGT LOOP
	NOP
	.END
