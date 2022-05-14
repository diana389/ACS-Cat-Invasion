%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    sub ecx, 1                         ;; se fac len-1 iteratii

    label:

        push ebx                       ;; se transmit parametrii
        push eax
        mov dword [ebx], 0
 
        extern points_distance
        call points_distance           ;; se apeleaza functia points_distance

        add eax, 4                     ;; se trece la urmatorul element
        add ebx, 4                     ;; se trece la urmatorul element
        add esp, 8

    loop label 

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY