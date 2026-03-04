@R0
D=M
@NEG_CASE
D;JLT           

@R0
D=M
@R3
M=D+1           
@R0
D=M
@R4
M=D            
@R1
M=0             
@MULT_LOOP
0;JMP           

(MULT_LOOP)
@R4
D=M
@END_CALC
D;JEQ          

@R1
D=M
@R5
M=D            
@R3
D=M
@R6
M=D            

@R3
D=M
@R1
M=D+M          

@R5
D=M
@R6
D=D&M
@SAME_SIGN
D;JLT           
@R5
D=M
@OVERFLOW
D;JLT         
@R6
D=M
@OVERFLOW
D;JLT           
@SAME_SIGN
0;JMP         

(OVERFLOW)
@R1
M=-2
@END
0;JMP

(SAME_SIGN)
@R4
M=M-1
@MULT_LOOP
0;JMP

(NEG_CASE)
@R1
M=-1
@END
0;JMP

(END_CALC)
@END
0;JMP

(END)
@END
0;JMP