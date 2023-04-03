.model small
.stack 100h
.data 
    msg1 db "Enter the input(space is required between two input):$" 
    msg2 db "Large number:$"
    large db '0' 
    
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
    cmp al,large
    jg change
    jmp end_change
    
    change:
    mov large,al
    
    end_change:                       
    mov ah,1;for space
    int 21h 
    cmp al,13
    je end_input
    jmp input 
        
    end_input:
    call new
    mov ah,9 
    lea dx,msg2
    int 21h 
    mov ah,2 
    mov dl,large
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
main endp 
new proc
    mov ah,2
    mov dl,13
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    ret 
    new endp
end main  
