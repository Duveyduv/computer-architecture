;
; file: skel.asm
; This file is a skeleton that can be used to start assembly programs.

%include "asm_io.inc"
segment .data

RPS db "R, P, S?: ", 0

RPS2 db "R, P, S?: ", 0

tie db "It's a tie!", 0

p1win db "Player 1 wins!", 0

p2win db "Player 2 wins!", 0 

segment .bss

person1 resd 1
person2 resd 1

segment .text
        global  asm_main



asm_main:
        enter   0,0               ; setup routine
        pusha


        mov eax, RPS        ; moving first rps prompt into eax
        call print_string   ; printing a string
        call read_char      ; reading character into eax
        mov [person1], eax  ; moving eax into person1
        
        call print_nl       ; newline
        call read_char      ; consuming newline char
        
        mov eax, RPS2       ; moving second prompt into eax
        call print_string   ; printing a string
        call read_char      ; reading character
        mov [person2], eax  ; moving eax into person2


        mov ebx, [person2]  ; ebx now holds person2
        mov eax, [person1]  ; eax now holds person1

        cmp eax, ebx        ; comparing if they're 0, eax - ebx
        jz tie_case         ; if this is the case, the zero flag will be set so JZ into tie_case
        
        
        cmp eax, "R"        ; compare eax with R
        je compare1         ; jump if equal to compare1
        cmp eax, "P"        ; compare eax with P                ; these three compares are every possibility, for every
        je compare2         ; jump if equal to compare2         ; input option, each option gets compared with another posibility
        cmp eax, "S"        ; compare eax with S                ; within each jump
        je compare3         ; jump if equal to compare3



; R=R, P=P, S=S
tie_case:
        mov eax, tie        ; moving tie case into eax
        call print_nl       ; printing newline
        call print_string   ; printing string
        jmp end_if

; Rock
compare1:
        cmp ebx, "P"        ; compare if ebx is p
        je player_2win      ; if so, player 2 wins
        cmp ebx, "S"        ; compare if ebx is S
        je player_1win      ; if so, player 1 wins

; Paper
compare2:
        cmp ebx, "R"        ; compare ebx with R
        je player_1win      ; if so, player 1 wins
        cmp ebx, "S"        ; compare ebx with S
        je player_2win      ; if so, player 2 wins

; Scissors
compare3:
        cmp ebx, "R"        ; compare ebx with R
        je player_2win      ; if so, player 2 wins
        cmp ebx, "P"        ; compare ebx with P
        je player_1win      ; if so, player 1 wins


player_2win:
        mov eax, p2win      ; moving player 2 win string into eax, printing, and jumping to the end_if block
        call print_nl
        call print_string
        jmp end_if


player_1win:
        mov eax, p1win      ; moving player 1 win string into eax, printing, and jumping to end_if block
        call print_nl
        call print_string
        jmp end_if


end_if:

        




;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


