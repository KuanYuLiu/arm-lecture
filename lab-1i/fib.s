	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3,r4,r5,r6,r7,r8,r9,lr}
	subs r4,r0,#0; @ R4 = R0 - 0 (update flags)
	ble .L3 @ if(R0 <= 0) goto .L3 (which returns 0)
	cmp r4, #1;  @ Compare R4 wtih 1
	beq .L4 @ If R4 == 1 goto .L4 (which returns 1)
        mov r6,#1
	mov r7,#1
	mov r9,#2
	cmp r4,#1
	bgt .Loop	
	//pop {pc}		
	@push {lr} 
        @a0 =R6, a1=R7,fib=R8,x=R0 ,i=R9
	
.Loop:
	add r8,r6,r7;  @fib = a0+a1 
	mov r6,r7;       @a0=a1
	mov r7,r8;       @a1=fib
	add r9,r9,#1;  @i=i+1
	cmp r9,r0;
	blt .Loop

	mov r0,r8
	pop {r3,r4,r5,r6,r7,r8,r9,pc}

.L3:
	mov r0, #0			@ R0 = 0
	pop {pc}		@ EPILOG
	@pop {pc}
.L4:
	mov r0, #1			@ R0 = 1
	pop {pc}		@ EPILOG
	@pop {pc}
	.size fibonacci, .-fibonacci
	.end
