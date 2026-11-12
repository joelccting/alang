/* Homework 4 */

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
	LDR r0, =INPUT
	MOV r1, #0	@ m = r1 = 0
	MOV r2, #0 	@ n = r2 = 0

loopm:
	CMP r1, #5	
	BGE exit	@ if m < 5 do loopn

loopn:
	CMP r2, #5
	BGE loopn_end
	BL find_max_val	@ if n < 5 do find_max_val
	ADD r2, r2, #2	@ n += 2;
	B loopn

loopn_end:
	MOV r2, #0		@ if n >= 5 do n = 0;
	ADD r1, r1, #2	@ m += 2;
	B loopm 
	
/* function: find a max value find_max_val(M, n, m) */
find_max_val:
	STMFD sp!, {r0-r2, lr}

	MOV r6, r0	@ r6 = INPUT
	MOV r7, r1	@ r7 = m
	MOV r8, r2 	@ r8 = n

	MOV r0, r2	
	BL min
	MOV r5, r0 	@ r5 = min(n + 2, 5);

	MOV r0, r1
	BL min
	MOV r4, r0 	@ r4 = min(m + 2,5);

	MOV r1, r7	@ j = r1 = m
	MOV r2, r8	@ i = r2 = n
	MOV r9, #0	@ tmp = r9 = 0;
loop2n:	
	CMP r2, r5
	BGE loop2_exit
loop2m:
	CMP r1, r4		@ if j >= min(m + 2, 5) do
	MOVGE r1, r7		@ j = m;
	ADDGE r2, r2, #1	@ i = i + 1;
	BGE loop2n

	MOV r0, r6			@ r0 = r6 = INPUT
	ADD r11, r2, r2, LSL #2 	@ r11 = r1 * 5
	ADD r11, r11, r1 		@ r11 += r2
	LDR r10, [r0, r11, LSL #2] 	@ r10 = INPUT[i][j]
	CMP r10, r9
	MOVGT r9, r10

	ADD r1, r1, #1
	B loop2m

	MOVGE r1, r7
	ADDGE r2, #1
	BGE loop2n

loop2_exit:
	LDR r0, = ANS	@ r0 = &ANS
	MOV r1, r7, LSR #1 	@ r1 = m; 
	MOV r2, r8, LSR #1 	@ r2 = n;
	ADD r2, r2, r2, LSL #1	@ r2 = r2 * 3;
	ADD r0, r0, r2, LSL #2	@ r0 += r2;
	ADD r0, r0, r1, LSL #2	@ r0 += r1;
	STR r9, [r0]
	LDMFD sp!, {r0-r2, pc}
	MOV pc, lr

/* function: find minimum. r0 = min(r0 + 2, 5) */
min:
	STMFD sp!, {r1-r11, lr}
	ADD r0, r0, #2
	CMP r0, #5
	MOVGE r0, #5
	LDMFD sp!, {r1-r11, pc}
	MOV pc, lr

exit:
	NOP
	.end
