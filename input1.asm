TITLE ASM1 (.EXE MODEL)
;---------------------------------------------
STACKSEG SEGMENT PARA 'Stack'
STACKSEG ENDS
;---------------------------------------------
DATASEG SEGMENT PARA 'Data'
	INPUT1 DB ? , 0AH, 0DH, 0AH, 0DH; <<<INITIALIZED TO ZERO NA ANG QUESTION MARK
	; INPUT2 DB 0AH, 0DH, ?  <<SAMERAS NAAS TAAS
	INPUT2 DB ? , 0AH, 0DH;
	INPUT3 DB ?, '$'
	;EXPANDED VERSION INPUT3 DB ?
	;DELIM DB ?
DATASEG ENDS
;---------------------------------------------
CODESEG SEGMENT PARA 'Code'
  ASSUME SS:STACKSEG, DS:DATASEG, CS:CODESEG
START:
	; SET DS to correct value
	MOV AX, DATASEG
	MOV DS, AX
	
	;code part
	
	MOV AH,10H
	INT 16H 
	MOV INPUT1,AL  
	
	
	MOV AH,10H
	INT 16H
	MOV INPUT2,AL 
	
	
	MOV AH,10H
	INT 16H
	MOV INPUT3,AL     

	
	MOV AH,09H 
	LEA DX, INPUT1
	INT 21H  
	
	; return/exit
	MOV AH, 4CH
	INT 21H
CODESEG ENDS
END START
