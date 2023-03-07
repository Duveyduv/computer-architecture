

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;

prompt db "Enter a positive number <=255: ", 0
prompt2 db "What shall we do with your number? ",0
prompt3 db "1) Print Binary Representation", 0
prompt4 db "2) Print number in Reverse", 0
choice db "Choice: ", 0

oops db "NOT IMPLEMENTED", 0
thanks db "Thanks for playing!", 0






segment .bss
;
; uninitialized data is put in the bss segment
;

number resd 1
num_choice resd 1

 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha


;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

        mov eax, prompt         ; moving prompt into eax
        call print_string       ; printing it
        call read_int           ; read the integer into it                             
        
        mov [number], eax       ; moving that value into number
        mov eax, prompt2        ; moving prompt2 into eax
        call print_nl           ; newline
        call print_string       ; printing it
        
        mov eax, prompt3        ; moving prompt3 into eax
        call print_nl           ; newline
        call print_string       ; print it
        
        mov eax, prompt4        ; moving prompt 4 into eax
        call print_nl           ; newline
        call print_string       ; printing it
        
        mov eax, choice         ; moving choice into eax
        call print_nl           ; newline
        call print_string       ; printing it
        call read_int           ; reading that value into eax
        mov [num_choice], eax   ; mov eax into num_choice

        mov ebx, 2
        cmp eax, ebx
        jz not_imp
        
        cmp eax, eax
        je binary

        

not_imp:
        call print_nl
        mov eax, oops
        call print_string
        call print_nl
        mov eax, thanks
        call print_nl
        call print_string


binary:
        mov eax, [number]       ; moving our input number into eax

        
        cdq                     ; initializing edx
        mov ecx, 2              ; moving 2 into ecx so we can do eax / 2
        div ecx                 ; eax = eax / ecx
        mov ebx, edx            ; moving remainder into ebx
        shl ebx, 1              ; shifting ebx by 1
        
        mov [number], eax

        cmp eax, 0
        jne binary



        call dump_regs 1

        
        






        


        

        
        
        
        
        
        







        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


