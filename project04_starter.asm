
; Author: Megan Avery Spring 2023
; This is the starter code for Project 4

%include "asm_io.inc"

segment .data
;
; initialized data is put in the data segment here
;
prompt db "Enter your favorite number: ", 0


segment .bss
;
; uninitialized data is put in the bss segment
;
input resd 1
input2 resd 1
input3 resd 1
input4 resd 1




segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

;
; don't edit anything between lines 20 and 23
;

        ; STARTER CODE, DO NOT EDIT
        mov eax, prompt
        call print_string	; print out the prompt defined in the .data segment
        call read_int		; value entered by user now lives in EAX
	call print_nl		; print a new line character

	call print_int		; print value in EAX, currently what user entered
        
        
        mov [input], eax        ; moving input of user into directive input
        mov ebx, eax            ; moving eax into ebx
        add eax, ebx            ; adding ebx to eax
        
        mov [input2], eax       ; moving the value of eax into directive input2
        mov ebx, eax            ; moving eax into ebx again
        
        add eax, ebx            ; adding the two registers together
        mov [input3], eax       ; moving eax into directive input3      
        
        add eax, [input3]       ; adding directive input3 to eax

        mov [input4], eax       ; moving the value of eax into directive input4
        mov ecx, [input4]       ; moving input4's directive into ecx
        
        add eax, [input]        ; adding the original value of input to eax to get the (VALUE) * 9
        
        call print_nl           ; newline
        call print_int          ; printing the (VALUE) * 9
        
        mov eax, [input4]       ; moving input4's value into eax, if input is 4, the value is 32
       
       
        mov ebx, eax            ; at this point, if the value is 32, it gets added across all three registers
        add ebx, ecx            ; and the registers get added right to left, printing out the requested value.
        add eax, ebx            ;
        
        call print_nl
        call print_int












        

        

        

		

;
; don't edit anything below this line
;
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


