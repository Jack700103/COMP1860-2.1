@R14
M=0
@1
D=A
@R14
M=M-D      

@R15
M=0
@2
D=A
@R15
M=M-D       

@R0
D=M
@NEGATIVE_CASE
D;JLT

@R1
M=0         
@R2
M=0        
@R3
M=0        

(LOOP_START)
    @R3
    D=M
    @R0
    D=D-M
    @LOOP_END
    D;JGT

    @R1
    D=M
    @CHECK_R2_SIGN
    D;JGE       
    @OVERFLOW_CASE
    0;JMP

(CHECK_R2_SIGN)
    @R2
    D=M
    @CALC_SUM
    D;JGE       
    @OVERFLOW_CASE
    0;JMP

(CALC_SUM)
    @R1
    D=M
    @R2
    D=D+M
    @R4
    M=D         

    @R4
    D=M
    @OVERFLOW_CASE
    D;JLT      

    @R4
    D=M
    @R1
    M=D

    @R3
    M=M+1
    
    @R2
    M=M+1
    @R2
    M=M+1

    @LOOP_START
    0;JMP

(LOOP_END)
    @FINISH
    0;JMP

(NEGATIVE_CASE)
    @R14
    D=M
    @R1
    M=D
    @FINISH
    0;JMP

(OVERFLOW_CASE)
    @R15
    D=M
    @R1
    M=D
    @FINISH
    0;JMP

(FINISH)
    @END
    0;JMP

(END)
    @END
    0;JMP