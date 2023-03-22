.model small
.stack 100h
.data
    msg1 db "Enter the input:$" 
    msg2 db "First capital :$"
    msg3 db "Last capital :$"
    msg4 db "No capital$" 
    first db "*"
    last db "*"
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
    
    cmp al,'A'
    jge check 
    jmp input
    
    check:
    cmp al,'Z' 
    jle change
    jmp input
    
    
    change: 
    mov last,al
    cmp first,'*'
    je changef
    jmp input
    
    changef:
    mov first,al
    jmp input
    
    end_input:
    
    mov ah,2
    mov dl,13
    int 21h
    mov ah,2
    mov dl,10
    int 21h
     
    cmp first,'*'
    je if 
    jmp else
    
    if:
        mov ah,9
        lea dx,msg4
        int 21h
        jmp exit
        
    else: 
        mov ah,9
        lea dx,msg2
        int 21h   
        
        mov ah,2
        mov dl,first
        int 21h
        
        mov ah,2
        mov dl,13
        int 21h
        mov ah,2
        mov dl,10
        int 21h 
        
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
end main  
