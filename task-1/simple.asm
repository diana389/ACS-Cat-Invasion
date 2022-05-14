%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    label:
        mov ah, [esi]    ;; caracterul curent
        add esi, 1    

        add ah, dl       ;; se adauga pasul
        
        cmp ah, 90       ;; se verifica daca se trece de 'Z'
        jle jump

        sub ah, 26       ;; daca trece de 'Z' se scade 26

        jump:
        mov [edi], ah    ;; caracterul se muta in enc_string
        add edi, 1
    loop label

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY