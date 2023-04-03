.model small
.stack 100h
.data

  msg1 db 'Enter a Number:$'
  msg2 db 'Number is prime$' 
  msg3 db 'Number is not prime$'
  num db ? 
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
    sub al,48
    
    mov num,al
    mov bl,2 
    
    check_prime:
    
    cmp num,2
    jl non_prime 
    
    cmp num,2
    je prime 
    
    
    xor ax,ax
    mov al,num
    div bl
    inc bl
        
    cmp ah,0
    je non_prime
    
    cmp bl,num
    je prime 
   jmp check_prime
      
  non_prime:
  call new
  mov ah,9
  lea dx,msg3
  int 21h 
  jmp exit
  
  prime: 
  call new
  mov ah,9
  lea dx,msg2
  int 21h
   
    
     
  end_input:  
 
 
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
