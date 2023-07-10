 .model small
.stack 100h
.data 
    msg1 db 'Enter the string:$'
    msg2 db 'Case Conversion:$'
    str db 100 dup ('$')  
   
.code
main proc 
    mov ax,@data
    mov ds,AX
    
    mov ah,9
    lea dx,msg1
    int 21h 
    mov si,0
    
    input:    
    mov ah,1
    int 21h
    cmp al,13
    je next 
    cmp al,'A' 
    jl same
    cmp al,'z'
    jg same
    
    cmp al,'Z'
    jg check
    jmp end_check
    check:
    cmp al,'a'
    jl same
    
    end_check:
    xor ax,32    
    same:
    mov str[si],al 
    inc si
    jmp input
        
    
    next:
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,9
    lea dx,str
    int 21h
   
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
