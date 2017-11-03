%include "io.inc"

section .data
   ;%include "input.inc"
   nums dd 4
   nums_array dd 612, 1330, 7, 12988
   base_array dd 16, 1, 2, 14
   incorect db "Baza incorecta"
   caractere db "0123456789abcdef", 0   ; Sirul de caractere folosite pentru transformare
    
section .text
global CMAIN
CMAIN:
    xor eax, eax
    xor edx, edx
    mov ecx, -1                 ; Pentru a putea incrementa in memorare
    PRINT_CHAR [hexa]           ; Apelezi cu adresa + offset
    
iterare:
    INC ecx
    mov ebx, [base_array + 4 * ecx]
    
    cmp ebx, 2                  ; Verific daca am baza corecta
    jl bazainc
    cmp ebx, 16
    jg bazainc
    
    cmp ecx, nums + 1           ; Verific daca am iterat toate elementele
    ret                         ; In caz de se verifica, se termina executia 

memorare:
    mov dx, [num + 4*ecx + 2]   ; Pentru a lua partea high
    mov ax, [num + 4*ecx]       ; Partea low o retin in ax because Little Endian
    
transformare:
    div bx
    PRINT_CHAR [caractere + dx]
    
    cmp ax, 0                   ; Am terminat transformarea, pentru asta punem newline
    NEWLINE
    
    cmp ax, 0                   ; Trecem la urmatorul numar
    je iterare
    
    mov dx, 0
    
    jmp transformare            ; Fac loop pana cand transform tot numarul
    
    
    ; Cand o sa transformi restul in caracter sa verifici de fiecare data
    ; Daca este ax = 0 dupa printare, pentru a putea itera elementele 

bazainc:
    PRINT_STRING incorect
    jmp iterare                ; Trec la urmatorul element