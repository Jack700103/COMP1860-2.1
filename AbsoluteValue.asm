@R0
D=M
@R2
M=0
@NEGATIVE
D;JLT
@R1
M=D
@END
0;JMP
(NEGATIVE)
@R2
M=1
D=-D
@R1
M=D
@OVERFLOW
@R0
D=M
@IS_NEG
D;JLT         

@R0
D=M
@R1
M=D            
@R2
M=0            
@R3
M=0            
@END
0;JMP

(IS_NEG)

@R2
M=1            

@R0
D=M
@CHECK_OVERFLOW
D;JEQ          

@R0
D=!M
@TMP
M=D            
@TMP
D=M+1          
@R0
D=D-M          

@R0
D=M
@CALC_NEG
D=!D
D=D+1          
@R1
M=D            

@R0
D=M
@R1
D=D-M          

@R1
D=M
@NO_OVERFLOW
D;JGE          

@R3
M=1            
@R0
D=M
@R1
M=D            
@END
0;JMP

(NO_OVERFLOW)
@R3
M=0            
@END
0;JMP

(END)
@END
0;JMP
