.model small
.stack 100h 
.data 
    str db 100 ?
    msg1 db "Enter the string:$"
    msg2 db "Output:$"
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9 
    lea dx,msg1 
    int 21h  
    
    mov si,0
    
    input:
        mov ah,1
        int 21h
        cmp al,13
        je end_input
        
        cmp al,'A'
        jl next
        
        cmp al,'z'
        jg next
        
        cmp al,'Z'
        jg check 
        
        jmp end_check
        
        check:
            cmp al,'a'
            jl next
        end_check: 
            
        xor al,32
        
        next:
           mov str[si],al 
           inc si;
       
    jmp input 
    
    end_input:
    
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h 
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    output: 
    cmp di,si
    je end 
    mov ah,2 
    mov dl,str[di]
    int 21h
    inc di
    jmp output
    
    end:   
    main endp
end main
