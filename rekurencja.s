.intel_syntax noprefix
.text
.globl main
 
 main :
	
	push ebp
	mov ebp , esp
	mov ebx , [ebp + 12]
	push [ebx+4]
	call atoi
	mov esi , eax
	add esp ,4
	push [ebx+8]
	call atoi
	mov ecx , eax
	mov eax , esi
	push ecx
	call function
	push edx
	push offset msg
	call printf
	add esp, 8
	mov esp, ebp
	pop ebp
	ret
	
function : 
	cmp eax , 0
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push ebx
	push esi
	push edi
	jne f1
	mov edx,ecx
	add edx , 1
	jmp final
f1 :
	cmp eax , 1
	jne f2
	mov edx , ecx
	jmp final

f2 : 
	cmp eax , 2
	jne fnext
	mov edx , ecx
	add edx ,3
	jmp final
	
fnext :
	mov esi , eax
	mov edi , ecx
	xor ebx , ebx
	sub eax , 1
	push ecx
	call function
	add esp , 4
	add ebx , edx
	mov eax , esi
	mov ecx , edi
	sub eax , 2
	inc ecx
	push ecx
	call function
	add esp , 4
	sub ebx , edx
	mov eax , esi
	mov ecx , edi
	sub eax , 3
	push ecx
	call function
	add esp , 4
	add ebx , edx
	add ebx , edx
	mov eax , esi
	mov ecx  , edi
	mov edx , ebx
	jmp final
	
	
final:
	pop edi
	pop esi
	pop ebx
	pop ecx
	pop eax
	pop ebp
	ret
	
 
.data
msg:
  .asciz "EDX = %d\n"
  .byte 0
