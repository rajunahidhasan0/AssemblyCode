.MODEL SMALL
.STACK 100H    

.DATA
str DB 80 DUP(?)   
msg DB "Enter a String: $" 
show DB "Reverse string: $"

.CODE   


MAIN PROC  
    
MOV AX, @DATA
MOV DS, AX
  
           
            ;Message print
MOV AH, 9
LEA DX, msg
INT 21H    
 
          ;Input
           
MOV SI,0           
MOV AH, 1
NEXT:
INT 21H             
            
CMP AL, 0DH
JZ EXIT
MOV str[SI], AL

INC SI
JMP NEXT            
EXIT:   
DEC SI            
 
      
      
      
      


            ;Output   
MOV AH,2
MOV DL, 0AH
INT 21H  
MOV DL, 0DH
INT 21H            
            
            
MOV AH, 9
LEA DX, show
INT 21H          
           
MOV AH, 2

OUTP:
MOV DL, str[SI]
INT 21H       
DEC SI
CMP SI, -1
JZ EXIT2
JMP OUTP

EXIT2:
            
            ;this 2 line maybe not necessary            
MOV AH, 4CH
INT 21H     

MAIN ENDP     

END MAIN