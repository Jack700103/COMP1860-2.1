@R0
D=M
@R1
D=D+M
@R2
M=D             

@R0
D=M
@SIGN_CHECK
M=D             

@R1
D=M
@SIGN_Y
M=D            

@SIGN_CHECK
D=M
@SIGN_Y
D=D&M           
@CHECK_SIGN_BIT
M=D             

@SIGN_CHECK
D=M
@SIGN_Y
D=D|M         
@CHECK_POS_OR_NEG
M=D         

@CHECK_SIGN_BIT
D=M
@TEST_HIGH_BIT
M=D            

@TEST_HIGH_BIT
D=M
@MASK_HIGH_BIT
M=D            

@SIGN_CHECK
D=M
@SIGN_Y
D=D&M
@HIGH_BIT_MASK
M=D

@SIGN_CHECK
D=M
@IS_X_NEG
D;JGE           

@SIGN_Y
D=M
@IS_Y_NEG
D;JGE           

@R2
D=M
@SET_OVERFLOW
D;JGE           
@NO_OVERFLOW
0;JMP

(IS_X_NEG)

@SIGN_Y
D=M
@IS_Y_POS
D;JLT           

@R2
D=M
@SET_OVERFLOW
D;JLT           
@NO_OVERFLOW
0;JMP

(IS_Y_NEG)
(IS_Y_POS)

@NO_OVERFLOW
0;JMP

(SET_OVERFLOW)
@R3
M=1             
@END
0;JMP

(NO_OVERFLOW)
@R3
M=0             

(END)
@END
0;JMP