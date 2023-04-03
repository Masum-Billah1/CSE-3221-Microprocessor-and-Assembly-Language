.model small
.stack 100h 
.data 
    str db 100 ?
    msg1 db "Enter the string:$"
    msg2 db "Reversed string:$"
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9 
    lea dx,msg1 
    int 21h  
    
    xor cx,cx
    input:
        mov ah,1
        int 21h
        cmp al,13 
        je end_input
        push ax
        inc cx
    jmp input 
    
    end_input:
    
    call new 
    
    mov ah,9
    lea dx,msg2
    int 21h 
   
    jcxz exit;first enter key handle
    mov ah,2
    output: 
        pop dx 
        int 21h
    loop output
    
    exit:
        mov ah,4ch
        int 21h   
    main endp 

    new proc 
        mov ah,2
        mov dl,10
        int 21h
        mov ah,2
        mov dl,13
        int 21h
        ret
    new endp
end main
