[BITS 64]
GLOBAL get_biggest_13


section .text

; rdi - numstr
get_biggest_13:
	cld
	mov rsi, rdi
	mov ecx, 13 ; cnt
	xor edi, edi ; cur max
	mov r8d, 1
	xor edx, edx ; needed 4 mul
	._loop:
		xor eax, eax
		lodsb
		test al, al
		jz .end
		sub al, '0'
		mul r8
		mov r8, rax
		dec ecx
		jnz .skip
		cmp r8, rdi
		mov ecx, 13
		cmova rdi, r8
		sub rsi, 12
		mov r8, 1
		.skip:
	jmp ._loop
	.end:
	mov rax, rdi
ret
