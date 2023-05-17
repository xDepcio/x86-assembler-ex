section .text
global  removerng
removerng:
    push    ebp
    mov     ebp, esp

    push    ebx
    push    esi
    push    edi

    mov     eax, [ebp + 8]  ; address of start of chars array in eax
    mov     esi, [ebp + 8]  ; address of start of chars array in esi
    mov     bl, [ebp + 12]  ; lower limit char in bl
    mov     cl, [ebp + 16]  ; upper limit char in cl
remloop:
    mov     dl, [eax]      ; current char pointed by eax in dl
    cmp     dl, 0
    jz      end

    cmp     dl, bl
    jle     save_char

    cmp     dl, cl
    jge     save_char

    inc     eax
    jmp     remloop

save_char:
    mov     [esi], dl
    inc     esi
    inc     eax
    jmp     remloop

end:
    mov     [esi], byte 0
    mov     eax, [ebp + 8]

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
