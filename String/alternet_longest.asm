 ; this program will find out the longest sequence of letters in alphabetical order 

    .MODEL SMALL
    .STACK 100H 
    
    .DATA
        MSG1 DB 'Write a string either in uppercase or in lower case :',13,10,'$'
        MSG2 DB 'The longest consecutive increasing string is : $'
        
    .CODE
        MAIN PROC
            MOV AX,@DATA    ;Initialize ds
            MOV DS,AX 
                     
                     
         ;PRINTING MASSAGE 1
            MOV AH,09H
            LEA DX,MSG1
            INT 21H
            
  
                    
            MOV AH,01H
            INT 21H 
            
            MOV BL, AL                   ; set BL=AL
            MOV BH, AL                   ; set BH=AL
            MOV DH, AL                   ; set DH=AL, the first character of the longest consecutive string
            MOV DL, 1                    ; set DL=1,the length of the longest consecutive string
            MOV CL, 1
                       
             
                    
       ;TAKING INPUT 
       
         INPUT:
            INT 21H 
            
            CMP AL,13
            JE END_INPUT
            
            INC BL
            CMP AL,BL
            
            JNE RESET
            INC CL
            JMP INPUT
            
         RESET:                     
            CMP CL,DL
            JLE SKIP_UPDATION_1
            
            MOV DH,BH
            MOV DL, CL
            
         SKIP_UPDATION_1:    ;Reset BL to the ASCII value of the current character, and set CL to 1.
            MOV BH,AL
            MOV BL,AL
            MOV CL,1
          JMP INPUT  
                
            
       ;TAKING INPUT DONE 
            
         END_INPUT:  
            CMP CL,DL
            JLE SKIP_UPDATION_2   
             
            MOV DH, BH
            MOV DL, CL
            
         SKIP_UPDATION_2:
            MOV BX,DX
            
            LEA DX,MSG2
            MOV AH,9
            INT 21H
            
            XOR CX,CX
            MOV CL,BL 
             
         
        ; PRINTING OUTPUT HERE
            
            MOV DL,BH
            MOV AH,2
            
         OUTPUT:
            INT 21H
            INC DL
          LOOP OUTPUT
            
           
            EXIT:
            MOV AH,4CH
            INT 21H
            
            
        MAIN ENDP
        
        NEW_LINE PROC
            MOV AH,02H
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H 
            RET
                
        
    END MAIN
