; Author: Megan Avery Spring 2023
; This is the base assembly code for Project 5

%include "asm_io.inc"
segment .data
;
; initialized data is put in the data segment here
;
NUM_OF_GOATS equ 255
COST_OF_FEED equ 100

; TODO: rename these labels so the fit your narrative
greeting db "👋 Greetings user!", 0
goat1  db "Enter number #1: ", 0
goat2  db "Enter number #2: ", 0
goat3  db "Enter number #3: ", 0
goat4  db "Enter number #4: ", 0
total_feed_value   db "🥳 Answer: ", 0

segment .bss
;
; uninitialized data is put in the bss segment
;
total resd 1

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

; TODO: annotate every line of assembly
; CODE START
        
        mov eax, greeting            ; moving greeting into eax.
        call print_string            ; printing the string of greeting.
        call print_nl                ; newline print
        call print_nl                ; newline print

        mov eax, goat1               ; moving goat1 into eax
        call print_string            ; printing a string
        call read_int                ; reading the integer that's stored into eax
        mov [total], eax             ; moving that value into total

        mov eax, goat2               ; moving goat2 into eax
        call print_string            ; printing that string of goat2
        call read_int                ; reading the integer into eax
        add [total], eax             ; adding that value of eax into total, so +=

        mov eax, goat3               ; moving goat3 into eax
        call print_string            ; printing that string of goat3
        call read_int                ; reading that value into eax
        mov ecx, eax                 ; moving eax into cx, changed to ecx
        imul ecx, NUM_OF_GOATS       ; multiplying the value of COST_OF_GOATS which is defined as 255 by ecx.
        add [total], ecx             ; adding ecx's value into total.
        
        mov eax, goat4               ; moving goat4 into eax
        call print_string            ; printing that string
        call read_int                ; reading that value into eax
        mov ecx, eax                 ; moving eax into ecx
        imul ecx, COST_OF_FEED       ; multiplying COST_OF_FEED which is defined as 100 by ecx so *=
        add [total], ecx             ; adding ecx to total's value

        call print_nl                ; printing a newline
        mov eax, total_feed_value    ; Moving total_feed_value into eax
        call print_string            ; printing the string of that value
        mov eax, [total]             ; moving total into eax
        call print_int               ; printing that value

; CODE END
                
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
