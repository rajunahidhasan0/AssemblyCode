
.MODEL SMALL
.STACK 100H    

.DATA
str DB 80 DUP(?) 
length db ?  
Vowel db ?    
Consonant db ?

.CODE   
MOV AX, @DATA
MOV DS, AX

MAIN PROC    
           
           
MOV SI,0 
MOV Vowel,0    
MOV Consonant,0        
MOV AH, 1   

NEXT:     
INT 21H                   
CMP AL, 0DH
JZ EXIT
MOV str[SI], AL

CMP str[SI],'a'
JE countV
CMP str[SI],'e'
JE countV
CMP str[SI],'i'
JE countV
CMP str[SI],'o'
JE countV
CMP str[SI],'u'
JE countV 

ADD Consonant,1 
SUB Vowel,1               
countV:
ADD Vowel,1

skip:
INC SI
JMP NEXT            
EXIT:               

;MOV length,SI
DEC SI      
        
            
MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H
            
                ;No. of Vowel
ADD Vowel,48
MOV DL, Vowel
INT 21H       
     
                 

MOV AH,2 
MOV DL,0AH
INT 21H
MOV DL,0DH
INT 21H

                 
                 
      
                ;No. of Consonant

ADD Consonant,48
MOV DL, Consonant
INT 21H              
              
MOV AH, 4CH
INT 21H     

MAIN ENDP     

END MAIN

