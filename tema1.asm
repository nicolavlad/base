%include "io.inc"

section .data
   ;%include "input.inc"
   nums dd 4
   nums_array dd 612, 1330, 7, 12988
   base_array dd 16, 1, 2, 14
   incorect db "Baza incorecta", 0
      
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor edx, edx
    mov ebp, esp
    mov ecx, -1                 ; Pentru a putea incrementa in memorare
    
iterare:
    INC ecx
    cmp ecx, nums                ; Verific daca am iterat toate elementele
    jge final                    ; In caz de se verifica, se termina executia 

    mov ebx, [base_array + 4 * ecx]
    
    cmp ebx, 2                  ; Verific daca am baza corecta
    jl bazainc
    cmp ebx, 16
    jg bazainc
    
memorare:
    mov dx, [nums_array + 4*ecx + 2]
    mov ax, [nums_array + 4*ecx]
    
transformare:
    div bx
    push dx
    
    cmp ax, 0                   ; Trecem la urmatorul numar
    je printare
    
    mov dx, 0
    
    jmp transformare            ; Fac loop pana cand transform tot numarul

printare:
    cmp esp, ebp
    je iterare
    
    pop dx
    PRINT_HEX 2, dx
    
    jmp printare
    
bazainc:
    PRINT_STRING incorect
    jmp iterare                ; Trec la urmatorul element
    
final:
    ret