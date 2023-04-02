.model small
.stack 100h
.data
    msg1 db "Enter the input:$" 
    msg2 db "First capital :$"
    msg3 db "Last capital :$"
    msg4 db "No capital$" 
    first db '['
    last db '@'
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
    cmp al,'@'
    jg check 
    jmp input
    
    check:
    cmp al,'['
    jl change
    jmp input
    
    change:
    cmp al,first
    jl changef
    jmp end_changef
    
    changef:
    mov first,al
     
    end_changef:
    cmp al,last
    jg changel
    jmp end_changel
    
    changel:
    mov last,al
    end_changel:
    jmp input
    
    end_input:
    cmp first,'['
    jne print
    call new 
    mov ah,9
    lea dx,msg4
    int 21h
    jmp exit
    
    print:
    call new
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,2
    mov dl,first
    int 21h 
    call new
    mov ah,9
    lea dx,msg3
    int 21h
    mov ah,2
    mov dl,last
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
