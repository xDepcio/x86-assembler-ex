section .text
global  removerng
removerng:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    esi
    push    edi

    mov     eax, [ebp + 8]  ; address of start of chars array in eax
    mov     ebx, [ebp + 8]

    mov     cl, [eax]
    add     cl, 1
    mov     [eax], cl
end:
    pop     edi
    pop     esi
    pop     ebx

    mov     esp, ebp
    pop     ebp
    ret


; removerng:
;     push    ebp
;     mov     ebp, esp
;     mov     eax, [ebp+8]
; begin:
;     mov     cl, [eax]
;     cmp     cl, 0
; ; # cmp ustawia flagi
;     jz      end
; ; # skok na podstawie flagi ustawionej przez cmp
;     add     cl, 1
;     mov     [eax], cl
;     inc     eax
;     jmp     begin
; end:
;     mov     esp, ebp
;     pop     ebp
;     ret

; # stos pełny schodzący
; # |
; # |
; # |
; # |
; # | char*    | + 8 from ebp
; # | RET      | + 4 from EBP
; # | EBP(old) | <- EBP points HERE <- ESP points also here after prolog.
; # | a        |
; # | b        |
; # | c        |
; #
; #
; #

; # begin:    // Przykład jakbyśmy alokowali zmienne lokalne na stosie
; # int a;    // sub esp, 4
; # a = 2;    // mov [ebp-4], 2
; # int b, c; // sub esp, 8
; # a = 3;    // mov [ebp-4], 3
; #
; #
