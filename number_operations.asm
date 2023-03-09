; Author: Megan Avery Spring 2023 
; COSC 2331

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;
prompt db "Enter a binary number: ", 0

base10_msg db "Number in base 10: ", 0
count_msg db "Number of 1s: ", 0

segment .bss
;
; uninitialized data is put in the bss segment
;i
base10_answer resd 1
count_answer resd 1

 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

		; print initial prompt
		mov eax, prompt
		call print_string
		call read_int
		
		push base10_answer			
		push eax					
		call binary_to_base10		
		add esp, 8					

		; printing new base 10 number
		call print_nl
		mov eax, base10_msg		
		call print_string
		mov eax, [base10_answer]
		call print_int
		call print_nl

		push count_answer	   	
		push dword [base10_answer]	
		call count_ones				
		add esp, 8				

		; printing count of ones
		mov eax, count_msg
		call print_string
		mov eax, [count_answer]
		call print_int

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

; function to convert a "binary" number into base 10
;
; binary_to_base10(int binary_number, int* answer)
binary_to_base10:
	; prologue
	push ebp
	mov ebp, esp
	sub esp, 8 				

	mov dword [ebp - 4], 0   ; power of 2 being applied
	mov dword [ebp - 8], 0   ; final answer

	mov ebx, [ebp + 8]		
binary_loop:
	cmp ebx, 0		
	je binary_ending	

	xor edx, edx	
	mov eax, ebx			
	mov ecx, 10				

	div ecx				

	mov ebx, eax			

	mov eax, edx			
	
	mov cl, [ebp - 4]		
	shl eax, cl				

	add [ebp - 8], eax		
	inc dword [ebp - 4]		

	jmp binary_loop			

binary_ending:
	mov eax, [ebp - 8]		

	mov ebx, [ebp + 12]	
	mov [ebx], eax		

	; epilogue
	mov esp, ebp
	pop ebp
	ret

; function to count the number of 1s in the
; binary representation of a decimal number
;
; count_ones(int decimal_number, int* answer)
count_ones:
	push ebp
	mov ebp, esp
	sub esp, 4

	mov dword [ebp - 4], 0   ; count of 1s

	mov eax, [ebp + 8]      
	xor ebx, ebx
count_loop:
	cmp eax, 0
	je count_ending

	shr eax, 1
	setc bl

	add [ebp - 4], ebx

	jmp count_loop

count_ending:
	mov eax, [ebp - 4]

	mov ebx, [ebp + 12]
	mov [ebx], eax

	mov esp, ebp
	pop ebp
	ret

