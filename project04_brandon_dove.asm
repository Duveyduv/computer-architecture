

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
favorite resd 1
times_two resd 1
times_four resd 1
final_num resd 1




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
        
        
        mov [favorite], eax        ; moving input of user into directive favorite
        mov ebx, eax               ; moving eax into ebx
        add eax, ebx               ; adding ebx to eax
        
        mov [times_two], eax       ; moving the value of eax into directive times_two
        mov ebx, eax               ; moving eax into ebx again
        
        add eax, ebx               ; adding the two registers together
        mov [times_four], eax      ; moving eax into directive times_four      
        
        add eax, [times_four]      ; adding directive times_four to eax

        mov [final_num], eax       ; moving the value of eax into directive final_num
        mov ecx, [final_num]       ; moving final_nums's directive into ecx
        
        add eax, [favorite]        ; adding the original value of favorite to eax to get the (VALUE) * 9
        
        call print_nl              ; newline
        call print_int             ; printing the (VALUE) * 9
        
        mov eax, [final_num]       ; moving final_nums's value into eax, if input is 4, the value is 32
       
                                   
        mov ebx, eax               ; at this point, if the value is 32, it gets added across all three registers
        add ebx, ecx               ; and the registers get added right to left, printing out the requested value.
        add eax, ebx               
        
        call print_nl
        call print_int












        

        

        

		

;
; don't edit anything below this line
;
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


