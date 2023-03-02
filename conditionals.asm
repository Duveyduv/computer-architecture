

;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data

; character_prompt db "Enter a character: ", 0

; and_message db "and your point is?... ", 0

; number_prompt db "Enter a number: ", 0

; even_message db "It is even", 0

; odd_message db "It is odd", 0


; tie_case

; 


segment .bss
;
; uninitialized data is put in the bss segment
;


 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

;         mov eax, character_prompt
;         call print_string
;         call read_char

;         cmp eax, "&"
;         jne not_amp
;         mov eax, and_message
;         call print_string

; not_amp:
;         call read_char ; consuming new line character



;         mov eax, number_prompt
;         call print_string
;         call read_int
        
;         and eax, 1      ; anding eax with 1, so it check if last bit is 0
;         jz even_block   ; jumping to even_block
        
;         ; odd stuff
;         mov eax, odd_message
;         jmp end_check



; even_block:
;         mov eax, even_message
        

; end_check:
;         call print_string
;         call read_char








        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


