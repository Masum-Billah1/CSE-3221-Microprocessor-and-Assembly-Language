.model small
.stack 100h
.data
    msg1 db 'Enter the input:$' 
    msg2 db 'Number of vowel is :$'
    msg3 db 'Number of consonent is :$'
    msg4 db 'Number of digit is :$'
    msg5 db 'Number of space is :$'
    str db 'aeiou$'
    vowel db '0'
    consonent db '0' 
    digit db '0'
    space db '0'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    input:
        mov ah,1
        int 21h
        cmp al,13  
        je end_input 
        cmp al,'a'
        jl number
        cmp al,'z'
        jg number 
        mov si,-1 
        inc consonent
        
        vowell:
            inc si 
            cmp si,5
            je number
            cmp al,str[si]
            jne vowell
            dec consonent
            inc vowel
        jmp vowell
        
        number:
        cmp al,'0'
        jl spacel
        cmp al,'9'
        jg spacel
        inc digit
           
        spacel:
        cmp al,' '
        jne input
        inc space
    jmp input
        
    end_input:
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,2
    mov dl,vowel
    int 21h
    
    call new
    mov ah,9
    lea dx,msg3
    int 21h
    mov ah,2
    mov dl,consonent
    int 21h
    
    call new
    mov ah,9
    lea dx,msg4
    int 21h
    mov ah,2
    mov dl,digit
    int 21h
    
    call new
    mov ah,9
    lea dx,msg5
    int 21h
    mov ah,2
    mov dl,space
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp

    new proc
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        ret
    new endp
end main
