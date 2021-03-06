TITLE CONDITIONAL STATEMENTS AND JMP (SIGNED) (.EXE MODEL/FORMAT)
;---------------------------------------------
STACKSEG SEGMENT PARA 'Stack'
STACKSEG ENDS
;---------------------------------------------
DATASEG SEGMENT PARA 'Data'
	TEMP_READING DB '30'
	

  ALERTA DD '80'
  ALERTB DD '30'
  ALERTC DD '-273'
  ALERTD DD '100'
  ;ALERTC 
  ;ALERTAA DD 50H
  ;ALERTBB DD 1EH
  ;ALERTCC DD FFFFH
  ;ALERTDD 
  
  STRING1 DB "Too hot! Give yourself a shower.$"
  STRING2 DB "You're good. Stay alert.$"
  STRING3 DB "Oh no! You're freezing.$"
  
DATASEG ENDS
;---------------------------------------------
CODESEG SEGMENT PARA 'Code'
  ASSUME SS:STACKSEG, DS:DATASEG, CS:CODESEG
START:
  ;set DS correctly
  MOV AX, DATASEG
  MOV DS, AX

  ;print
	MOV AH, 09
	LEA DX, QUESTION1
	INT 21H

  ;comparison
  CMP TEMP_READING, ALERTB
  JL CHECK1
  JG CHECK2
  
  CHECK1:
  CMP TEMP_READING, ALERTC
  JGE PRINT3
  
  CHECK2:
  CMP TEMP_READING, ALERTA
  JGE CHECK3
  JL PRINT2
  
  CHECK3:
  CMP TEMP_READING, ALERTD
  JLE PRINT1
  
  PRINT1:
  MOV AH, 09
  LEA DX, STRING1
  INT 21H

	JMP EXIT
	
	
	
	PRINT2:
	MOV AH, 09
  LEA DX, STRING2
  INT 21H
  
  JMP EXIT
	
  PRINT3:
  MOV AH, 09
  LEA DX, STRING3
  INT 21H
  
  JMP EXIT
  
  EXIT:
  ;return/terminate/exit
  MOV AH, 4CH
  INT 21H
CODESEG ENDS
END START