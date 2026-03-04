@R1
D=M
@CHECK_DIV_BY_ZERO
D;JEQ

@R0
D=M
@STORE_X
M=D            

@R1
D=M
@STORE_Y
M=D            

@STORE_X
D=M
@DIVIDEND_IS_ZERO
D;JEQ

@STORE_X
D=M
@X_POSITIVE
D;JGE

@STORE_X
D=M
@ABS_X
M=!D           
@ABS_X
D=D+1         
@CHECK_Y_SIGN
0;JMP

(X_POSITIVE)

@STORE_X
D=M
@ABS_X
M=D

(CHECK_Y_SIGN)

@STORE_Y
D=M
@Y_POSITIVE
D;JGE

@STORE_Y
D=M
@ABS_Y
M=!D     
@ABS_Y
D=D+1       
@START_DIVISION
0;JMP

(Y_POSITIVE)

@STORE_Y
D=M
@ABS_Y
M=D

(START_DIVISION)

@QUOTIENT
M=0             
@REMAINDER
M=0           

@ABS_X
D=M
@REMAINDER
M=D


(DIVISION_LOOP)
@REMAINDER
D=M
@ABS_Y
D=D-M           
@COMPARE_REM_Y
D;JLT           

@REMAINDER
M=M-D           

@REMAINDER
M=M-1          
@ABS_Y
D=M
@REMAINDER
M=M-D           

@REMAINDER
D=M
@ABS_Y
D=D-M         
@REMAINDER
M=D             

@QUOTIENT
M=M+1         
@DIVISION_LOOP
0;JMP

(COMPARE_REM_Y)

@QUOTIENT
D=M
@FINALIZE_RESULT
0;JMP

(DIVIDEND_IS_ZERO)

@QUOTIENT
M=0
@REMAINDER
M=0
@FINALIZE_RESULT
0;JMP

(CHECK_DIV_BY_ZERO)

@R4
M=1             
@R2
M=0            
@R3
M=0            
@END
0;JMP

(FINALIZE_RESULT)

@STORE_X
D=M
@STORE_Y
D=D+M           

@STORE_X
D=M
@TEMP_SIGN_X
M=D            

@STORE_Y
D=M
@TEMP_SIGN_Y
M=D            

@TEMP_SIGN_X
D=M
@TEMP_SIGN_Y
D=D&M         
@BOTH_NEG
D;JLT          

@TEMP_SIGN_X
D=M
@TEMP_SIGN_Y
D=D|M          
@ANY_NEG
D;JLT          

@QUOTIENT
D=M
@R2
M=D            
@R3
M=0            

@STORE_X
D=M
@IS_REM_POS
D;JGE           

@REMAINDER
D=M
@R3
M=!D          
@R3
M=M+1          
@SET_FLAG_SUCCESS
0;JMP

(IS_REM_POS)
@REMAINDER
D=M
@R3
M=D

@SET_FLAG_SUCCESS
@R4
M=0            
@END
0;JMP

(ANY_NEG)
@QUOTIENT
D=M
@R2
M=!D          
@R2
M=M+1           

@STORE_X
D=M
@IS_REM_POS_2
D;JGE          

@REMAINDER
D=M
@R3
M=!D        
@R3
M=M+1           
@SET_FLAG_SUCCESS
0;JMP

(IS_REM_POS_2)
@REMAINDER
D=M
@R3
M=D

@SET_FLAG_SUCCESS
@R4
M=0             
@END
0;JMP

(BOTH_NEG)
@QUOTIENT
D=M
@R2
M=D            
@R3
M=0           

@STORE_X
D=M
@R3
M=!D            
@R3
M=M+1          

@SET_FLAG_SUCCESS
@R4
M=0            

(END)
@END
0;JMP