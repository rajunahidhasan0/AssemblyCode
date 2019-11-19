.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC    
            ;char input    
MOV AH, 1
INT 21H     
         
MOV AL,BL       

            ;Newline print
MOV AH,2
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H 
 
;MOV BL,AL   
            ;swapping (capital, small)

CMP BL,91
JG Line1 

ADD BL,64
Line1:
SUB BL,32

            ;output print
MOV DL,AL
MOV AH,2
INT 21H     
            ;this 2 line maybe not necessary            
MOV AH, 4CH
INT 21H     

MAIN ENDP     

END MAIN
        `