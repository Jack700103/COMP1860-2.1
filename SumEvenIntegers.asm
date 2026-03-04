@R0
D=M
@NEGATIVE_CASE
D;JLT          

@R0
D=M
@R3
M=D+1         

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
@OVERFLOW_CHECK_FINAL
D;JLE          

@R3
D=M
@SIGN_A
M=D           
@R1
D=M
@SIGN_RES
M=D           

@R3
D=M
@R1
M=D+M          

@SIGN_A
D=M
@SIGN_RES
D=D&M         
@SIGN_SAME
D;JLT          
@OVERFLOW_CASE 
0;JMP

(SIGN_SAME)
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

(OVERFLOW_CHECK_FINAL)
@R1
D=M
@END
0;JMP

(END)
@END
0;JMP
