
.MODEL SMALL
.STACK 100H    

.DATA
str DB 80 DUP(?)

.CODE   
MOV AX, @DATA
MOV DS, AX

MAIN PROC    
           
           
MOV SI,0           
MOV AH, 1   

NEXT:     
INT 21H                   
CMP AL, 0DH
JZ EXIT
MOV str[SI], AL

CMP str[SI],'z'
                     ; ignoring spacial charecter
JG skip  
CMP str[SI],'A'
JL skip


CMP str[SI],96
JG  capital

CMP str[SI],90
JG  skip

ADD str[SI],64  

capital:
SUB str[SI],32 

skip:

INC SI
JMP NEXT            
EXIT:               

DEC SI 

            
MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H
            

OUTP:
MOV DL, str[SI]
INT 21H       
DEC SI
CMP SI, -1
JZ finish 
JMP OUTP

finish:
 
            
              
MOV AH, 4CH
INT 21H     

MAIN ENDP     

END MAIN

