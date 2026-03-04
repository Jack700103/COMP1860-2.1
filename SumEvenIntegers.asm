@R0
D=M
@NEGATIVE_CASE
D;JLT          

@R0
D=M
@R3
M=D+1          

@R0
D=M
@OVERFLOW_CASE
D;JEQ       

@R1
M=0           
@R0
D=M
@R4
M=D      
@MULTIPLY_LOOP
0;JMP          

(MULTIPLY_LOOP)
@R4
D=M
@END_CALC
D;JLE        

@R1
D=M
@R6
M=D           
@R3
D=M
@R7
M=D           

@R3
D=M
@R1
M=D+M         

@R6
D=M
@R7
D=D&M
@SAME_SIGN
D;JLT         

@R6
D=M
@DIFF_SIGN1
D;JLT
@R7
D=M
@DIFF_SIGN1
D;JLT
@SAME_SIGN
0;JMP          

(DIFF_SIGN1)
@OVERFLOW_CASE
0;JMP

(SAME_SIGN)
@R4
M=M-1        
@MULTIPLY_LOOP
0;JMP

(NEGATIVE_CASE)
@R1
M=-1           
@END
0;JMP

(OVERFLOW_CASE)
@R1
M=-2           
@END
0;JMP

(END_CALC)
@R1
D=M
@END
0;JMP

(END)
@END
0;JMP