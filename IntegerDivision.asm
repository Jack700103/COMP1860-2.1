@R1
D=M
@INVALID_DIV
D;JEQ          

@R0
D=M
@SET_X_NEG
D;JLT          
@R7
M=0            
@CHECK_Y_SIGN
0;JMP
(SET_X_NEG)
@R7
M=1          
@CHECK_Y_SIGN
0;JMP

(CHECK_Y_SIGN)
@R1
D=M
@SET_Y_NEG
D;JLT         
@R8
M=0           
@CALC_ABS
0;JMP
(SET_Y_NEG)
@R8
M=1            
@CALC_ABS
0;JMP

(CALC_ABS)

@R0
D=M
@R5
M=D
@X_IS_POS
D;JGE
@R5
M=!D           
M=M+1          
(X_IS_POS)

@R1
D=M
@R6
M=D
@Y_IS_POS
D;JGE
@R6
M=!D           
M=M+1          
(Y_IS_POS)

@R2
M=0            
@R3
M=0            
@R5
D=M
@R3
M=D           

(DIV_LOOP)
@R3
D=M
@R6
D=D-M
@DIV_DONE
D;JLT        
@R3
M=D            
@R2
M=M+1          
@DIV_LOOP
0;JMP         

(DIV_DONE)

@R7
D=M
@R8
D=D-M
@QUOTIENT_NEG
D;JNE          
@REMAINDER_SIGN
0;JMP

(QUOTIENT_NEG)
@R2
D=M
M=!D
M=M+1
@REMAINDER_SIGN
0;JMP

(REMAINDER_SIGN)
@R7
D=M
@REMAINDER_POS
D;JEQ         
@R3
D=M
M=!D          
M=M+1          
@VALID_DIV
0;JMP
(REMAINDER_POS)
@VALID_DIV
0;JMP

(INVALID_DIV)
@R4
M=1
@R2
M=0
@R3
M=0
@END
0;JMP

(VALID_DIV)
@R4
M=0
@END
0;JMP

(END)
@END
0;JMP
