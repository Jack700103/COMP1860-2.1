@R1
D=M
@INVALID
D;JEQ         

@R4
M=0            

@R0
D=M
@X_NEG
D;JLT
@R5
M=0            
@CONV_X
0;JMP
(X_NEG)
@R5
M=1           
@R0
D=M
@TMP_X
M=!D
M=M+1          

@R0
D=M
@CHK_X
D;JGE
@R0
D=!M
D=D+1
(CHK_X_DONE)
@R5
M=D         

@R1
D=M
@CHK_Y
D;JGE
@R1
D=!M
D=D+1
(CHK_Y_DONE)
@R6
M=D          

@R0
D=M
@R1
D=D&M       

@R0
D=M
@X_IS_NEG
D;JLT
@R1
D=M
@Y_IS_NEG
D;JLT
@SIGN_POS
0;JMP        
@SIGN_POS
0;JMP        

@R7
M=0         

@R0
D=M
@CHECK_X_NEG
D;JGE
@R1
D=M
@CHECK_Y_POS_AFTER_XNEG
D;JGE
@SET_NEG1
0;JMP        
@CHECK_Y_POS_AFTER_XNEG
@SET_NEG2
0;JMP        
(CHECK_X_NEG)
@R1
D=M
@CHECK_Y_NEG
D;JGE
@SET_NEG3
0;JMP        
@END_SIGN
0;JMP

(SET_NEG1)
(SET_NEG2) 
@R7
M=0
@R0
D=M
@X_POS
D;JGE
@R1
D=M
@X_NEG_Y_NEG
D;JLT
@R7
M=1         
@END_SIGN
0;JMP
(X_NEG_Y_NEG)

@END_SIGN
0;JMP

(X_POS)
@R1
D=M
@Y_NEG
D;JLT

@END_SIGN
0;JMP
(Y_NEG)
@R7
M=1          

(END_SIGN)

@R8
M=0          
@R9
M=0          
@R5
D=M
@R9
M=D          

(DIV_LOOP)
@R9
D=M
@R6
D=D-M       
@DIV_DONE
D;JLT        

@R9
M=D          
@R8
M=M+1        
@DIV_LOOP
0;JMP

(DIV_DONE)

@R7
D=M
@APPLY_SIGN
D;JEQ        
@R8
D=M
@TMP_Q
M=!D
M=M+1        
@R8
M=D

(APPLY_SIGN)
@R0
D=M
@FIX_REM
D;JGE
@R9
D=M
@TMP_R
M=!D
M=M+1        
@R9
M=D

(FIX_REM)

@R8
D=M
@R2
M=D
@R9
D=M
@R3
M=D

@END
0;JMP

(INVALID)
@R4
M=1
@R2
M=0
@R3
M=0
@END
0;JMP

(END)
@END
0;JMP
