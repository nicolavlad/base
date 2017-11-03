%include "io.inc"

section .data
   %include "input.inc"
   incorect db "Baza incorecta"
   zecimal db "0123456789", 0   ; Sirul de caractere pentru baza 10
   hexa db "abcdef", 0          ; Sirul de caractere pana la baza 16
    
section .text
global CMAIN
CMAIN:
    xor eax, eax
    xor edx, edx
    xor ecx, ecx
    PRINT_CHAR [hexa]           ; Apelezi cu adresa + offset
    
memorare:
    mov ebx, [base_array + 4 * ecx] 
    
    mov dx, [num + 4*ecx + 2]   ; Pentru a lua partea high
    mov ax, [num + 4*ecx]       ; Partea low o retin in ax because Little Endian
    
    