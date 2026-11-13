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
	m .req r1
	n .req r2
	i .req r7
	j .req r8
	min_m .req r4
	min_n .req r5
	tmp .req r9

	MOV m, #0	@ m = 0
	MOV n, #0 	@ n = 0

loopm:
	CMP m, #5	
	BGE exit	@ if m >= 5 exit loopm

loopn:
	CMP n, #5
	BGE loopn_end	@ if n >= 5 jump to loopn_end

	BL find_max_val	@ if n < 5 do find_max_val
	ADD n, n, #2	@ n += 2;
	B loopn

loopn_end:
	MOV n, #0	@ if n >= 5 do n = 0;
	ADD m, m, #2	@ m += 2;
	B loopm 
	
/* function: find a max value find_max_val(M, n, m) */
find_max_val:
	STMFD sp!, {r1-r11, lr}

	MOV r0, n	
	BL min
	MOV min_n, r0 	@ r5 = min(n + 2, 5);

	MOV r0, m 
	BL min
	MOV min_m, r0 	@ r4 = min(m + 2,5);

	MOV tmp, #0	@ tmp = 0;
	
	MOV i, n	@ i = n
	MOV j, m	@ j = m
loopi:	
	CMP i, min_n	@ if i >= min(n + 2, 5)
	BGE loopi_exit	@ goto loop2_exit
loopj:
	CMP j, min_m	@ if j >= min(m + 2, 5)
	MOVGE j, m	@ j = m;
	ADDGE i, i, #1	@ i = i + 1;
	BGE loopi	@ goto loopi

	LDR r0, =INPUT		@ r0 = &INPUT
	ADD r11, i, i, LSL #2 	@ r11 = i * 5
	ADD r11, r11, j 	@ r11 += j
	LDR r10, [r0, r11, LSL #2] 	@ r10 = INPUT[i][j]
	CMP r10, tmp		@ if (INPUT[i][j] > tmp)
	MOVGT tmp, r10		@ tmp = INPUT[i][j]

	ADD j, j, #1
	B loopj

loopi_exit:
	LDR r0, = ANS	@ r0 = &ANS
	MOV n, n, LSR #1 	@ n /= 2; 
	MOV m, m, LSR #1 	@ m /= 2;
	ADD n, n, n, LSL #1	@ n = n * 3;
	ADD r0, r0, n, LSL #2	@ r0 += n * 4;
	ADD r0, r0, m, LSL #2	@ r0 += m * 4;
	STR r9, [r0]

	LDMFD sp!, {r1-r11, pc}
	MOV pc, lr

/* function: find minimum. r0 = min(r0 + 2, 5) */
min:
	ADD r0, r0, #2
	CMP r0, #5
	MOVGE r0, #5
	MOV pc, lr

exit:
	LDR r1, = ANS	@ r1 = &ANS
	NOP
	.end
