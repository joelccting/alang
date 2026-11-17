/* maxpool.s */

/* --- CODE --- */
	.section .text
	.global maxPool2x2
	.type maxPool2x2, %function

maxPool2x2:
	m .req r4
	n .req r5
	i .req r6
	j .req r7
	min_m .req r8
	min_n .req r9
	tmp .req r10

	MOV ip, sp
	PUSH {r4-r10, fp, ip, lr, pc}
	SUB fp, ip, #4

	MOV m, #0	@ m = 0
	MOV n, #0 	@ n = 0

loopm:
	CMP m, #5	
	BGE exit	@ if m >= 5 exit loopm

loopn:
	CMP n, #5
	BGE loopn_end	@ if n >= 5 jump to loopn_end

	STMFD sp!, {r0} 
	MOV r0, n	
	BL min
	MOV min_n, r0 	@ min_n = min(n + 2, 5);
	LDMFD sp!, {r0}

	STMFD sp!, {r0} 
	MOV r0, m	
	BL min
	MOV min_m, r0 	@ min_m = min(m + 2,5);
	LDMFD sp!, {r0}
	
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

	ADD r2, i, i, LSL #2 	@ r2 = i * 5
	ADD r2, r2, j 		@ r2 += j
	LDR r2, [r0, r2, LSL #2] @ r2 = INPUT[i][j]
	CMP r2, tmp		@ if (INPUT[i][j] > tmp)
	MOVGT tmp, r2		@ tmp = INPUT[i][j]

	ADD j, j, #1
	B loopj

loopi_exit:
	MOV r2, n, LSR #1 	@ r2 = n / 2;
	ADD r2, r2, r2, LSL #1 	@ r2 = r2 * 3;
	ADD r2, r2, m, LSR #1 	@ r2 += m / 2;
	STR tmp, [r1, r2, LSL #2]@ ANS[ANS + r4 * 4] = tmp

	ADD n, n, #2	@ n += 2;
	B loopn

loopn_end:
	MOV n, #0	@ if n >= 5 do n = 0;
	ADD m, m, #2	@ m += 2;
	B loopm 
	
/* function: find minimum. r0 = min(r0 + 2, 5) */
min:
	ADD r0, r0, #2
	CMP r0, #5
	MOVGE r0, #5
	MOV pc, lr

exit:
	SUB sp, fp, #40	
	LDMFD sp, {r4-r10, fp, sp, lr}
	BX lr
	.end
