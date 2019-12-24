;INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    X DB 80 DUP(?)
    MSG  DB  "Enter Elements: $\"
    MSGS  DB  0DH,0AH,"Sorted Elements : $\"
 
.CODE
 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG   
	CALL printX
	
    MOV AH,1
    MOV SI,0
    
     
    NEXT:
    INT 21H
    CMP AL,0DH
    JZ EXIT     
    
    CMP AL,' '
    JZ NEXT    
    
    MOV X[SI],AL
    INC SI
    JMP NEXT
     
    EXIT:
          
    CALL printNewLinE        
              
    MOV CX,SI
    
    OUTLP1:          
    DEC SI 
     
    MOV BL,X[SI]
    MOV DI,SI  
      INLP2:
      DEC DI
      CMP BL,X[DI]
      JG SKIP
        MOV CL,X[DI]
        MOV X[SI],CL
        MOV X[DI],BL
        MOV BL, CL
         
      SKIP:
      CMP DI,0
      JG INLP2
    CMP SI,0
    JG OUTLP1
     
     
    LEA DX, MSGS 
	CALL printX
 
    DEC CX
    MOV SI,0
     
    MOV AH,2 
    TOP:        
    MOV DL,X[SI]   
    INT 21H  
    MOV DL,' '  
    INT 21H
    INC SI
    LOOP TOP
MAIN ENDP 


printNewLine PROC
    MOV AH, 2
	MOV DL, 0AH
	INT 21H
	MOV DL, 0DH
	INT 21H      
	RET                       
printNewLine ENDP     

print PROC
   MOV AH,2
   INT 21H    
   RET
print ENDP  
       
printX PROC  
   MOV AH,09
   INT 21H  
   RET
printX ENDP 

END MAIN
