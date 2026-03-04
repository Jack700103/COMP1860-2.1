@R0
D=M
@CHECK_ZERO
D;JEQ

@R0
D=M
@IS_POSITIVE
D;JGE

@R0
D=M
@R14           
M=!D            
@R14
M=M+1          
@ABS_X
0;JMP

(IS_POSITIVE)
@R0
D=M
@R14            
M=D

(ABS_X)
@R14
D=M
@R3             
M=D
@R1           
M=0

(MULTIPLY_LOOP)
@R3
D=M
@CALCULATION_DONE
D;JLE           

@R14
D=M
@R1
M=D+M           

@R3
M=M-1
@MULTIPLY_LOOP
0;JMP

(CALCULATION_DONE)
@END
0;JMP

(CHECK_ZERO)
@R1
M=0             

(END)
@END
0;JMP