.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC    
            ;char input    
MOV AH, 1
INT 21H     

MOV BL,AL       

            ;Newline print
MOV AH,2
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H 
 
MOV AL,BL     

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