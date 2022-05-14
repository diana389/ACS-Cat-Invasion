%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

section .data
    pointArray:    times 800    dw 0

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov ch, [ebx + point.x]   ;; A.x
    mov cl, [ebx + point.y]   ;; A.y
    add ebx, 4
    mov dh, [ebx + point.x]   ;; B.x
    mov dl, [ebx + point.y]   ;; B.y

    cmp ch, dh                ;; A.x = B.x => paralel cu Oy
    je Oy_paralel

    cmp cl, dl                ;; A.y = B.y => paralel cu Ox
    je Ox_paralel

    Oy_paralel:

    cmp dl, cl                ;; B.y <= A.y  => case2_OY        
    jle case2_OY

    case1_OY:                 ;; B.y > A.y
    sub dl, cl
    mov [eax], dl             ;; Se muta diferenta in [eax]
    jmp exit

    case2_OY:                 ;; B.y <= A.y
    sub cl, dl
    mov [eax], cl             ;; Se muta diferenta in [eax]
    jmp exit

    Ox_paralel:
    
    cmp dh, ch                ;; B.x <= A.x  => case2_OX       
    jle case2_OX

    case1_OX:                 ;; B.x > A.x
    sub dh, ch
    mov [eax], dh             ;; Se muta diferenta in [eax]
    jmp exit

    case2_OX:                 ;; B.x < A.x
    sub ch, dh
    mov [eax], ch             ;; Se muta diferenta in [eax]

    exit:
    
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY