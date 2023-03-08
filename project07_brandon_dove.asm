

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

        mov ebx, 1              ; mov 1 into ebx
        cmp eax, ebx            ; compare input to ebx, if so... input - ebx = 0
        je not_imp              ; jump to not_imp which prints out the message required.

        
        mov cx, 0               ; zeroing out cx for division
        mov bx, 10              ; moving 10 into bx so we can divide by it
        cmp eax, eax            ; comparing input with itself, so always zero so we can do option #2
        mov eax, [number]       ; moving our selected number into eax
        je reverse_num          ; if they numbers are equal, jump to reverse_num loop
        
       

not_imp:
        call print_nl           ; newline
        mov eax, oops           ; "NOT IMPLEMENTED"
        call print_string       ; printing it
        call print_nl           ; newline
        call print_nl           ; newline
        mov eax, thanks         ; "Thanks for playing!"
        call print_string       ; printing it
        call print_nl           ; newline


reverse_num:
            xchg ax,cx          ; since we put our number into eax, we are gonna move the values over to cx.
            mul bx              ; multiply ax by bx
            xchg ax,cx          ; changing the values back
            mov dx,0            ; moving 0 into dx so we can divide
            div bx              ; division and modulo
            add cx,dx           ; dx holds our number we want to put first
            cmp ax, 0           ; compare ax and 0, if not...
            ja reverse_num      ; continue through loop.
            mov ax, cx          ; moving our reversed value into ax
            call print_nl       ; newline
            call print_int      ; printing it.

            
            
        
        
        
        
        
        
        
        
        
        
        ; mov al, [number]
        ; cdq
        ; mov ebx, 10
        ; div ebx
        ; call dump_regs 1
        ; mov eax, edx
        ; call print_int
        
        
        
        
        


        
        




        
        






        


        

        
        
        
        
        
        







        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


