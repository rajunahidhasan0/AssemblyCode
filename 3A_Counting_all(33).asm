.MODEL SMALL
.STACK 100H    

.DATA
	str DB 80 DUP ?
	MSG DB "Enter a string: $"
	MSGvowel DB "Number of Vowel: $"
	MSGcons DB "Number of Consonant: $"
	MSGspace DB "Number of Space: $"
	MSGdigit DB "Number of Digit: $"
	bc DB '0'
	cc DB '0'
	space DB '0'
	num DB '0'        
	

.CODE   
    MAIN PROC
    MOV AX, @DATA
	MOV DS, AX
	
	MOV AH,9
	LEA DX, MSG
	INT 21H
	
	MOV BL,48           
	MOV CL,48
	MOV SI,0
	MOV AH,1 
	
NEXT:
	INT 21H
	CMP AL,0DH
	JZ EXIT
	
	MOV str[SI], AL
	
	;compare
L1: CMP str[SI],'A'
    JL L
    CMP str[SI],'Z'
    JG L2
    JMP L3
L2: CMP str[SI],'a'
    JL L
    CMP str[SI],'z'
    JG L
    JMP L3

	;COMPARISION FOR VOWEL
L3:
	CMP str[SI],'A'  
	JZ vowel
	CMP str[SI],'a'
	JZ vowel
	CMP str[SI],'E'
	JZ vowel
	CMP str[SI],'e'
	JZ vowel
	CMP str[SI],'I'
	JZ vowel
	CMP str[SI],'i'
	JZ vowel
	CMP str[SI],'O'
	JZ vowel       
	CMP str[SI],'o'
	JZ vowel
	CMP str[SI],'U'
	JZ vowel
	CMP str[SI],'u'
	JZ vowel       
	JMP cons
vowel:
	ADD bc,1
	jmp L
cons:
	ADD cc,1
L:  
    CMP str[SI],' '
    JNE digit
    ADD space, 1
    JMP ignore
digit:
    CMP str[SI],'0'
    JL ignore
    CMP str[SI],'9'
    JG ignore
    ADD num,1
ignore:
    INC SI
    JMP NEXT
    
EXIT:
	DEC SI               
	
	;print a new line
    CALL printNewLine
	
	
	;output vowel
	LEA DX, MSGvowel 
	CALL printX
	
	MOV DL,bc 
	CALL print
	
	;print a new line       
    CALL printNewLine
	
	;output consonants
	MOV AH,9
	LEA DX, MSGcons
	INT 21H
	
	MOV AH, 2
	MOV DL,cc
	INT 21H
	
	;print a new line 
    CALL printNewLine
	
	;output space
	MOV AH,9
	LEA DX, MSGspace
	INT 21H
	
	MOV AH, 2
	MOV DL,space
	INT 21H
	
	;print a new line
    CALL printNewLine
	
	;output numbers
	MOV AH,9
	LEA DX, MSGdigit
	INT 21H
	
	MOV AH, 2
	MOV DL,num
	INT 21H           
	
	
	MOV AH, 4CH
	INT 21H

	MOV AH,4CH

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
   MOV AH,9
   INT 21H  
   RET
printX ENDP     
    

END MAIN
	