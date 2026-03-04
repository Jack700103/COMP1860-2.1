@R0
D=M
@NEG_CASE
D;JLT

@R1
M=0    
@R3
M=0     

(LOOP)
@R3
D=M
@R0
D=M-D    
@DONE
D;JLT    

@R3
D=M
D=D+D    

@R1
D=M
@R4
M=D      
@R3
D=M
D=D+D    

@R3
D=M
D=D+D
@R5
M=D      

@R4
D=M
D=D+M    
@R1
M=D

@R1
D=M
@R4
D=D-M    
@OVERFLOW
D;JLT

@R3
M=M+1
@LOOP
0;JMP

(DONE)
@END
0;JMP

(OVERFLOW)
@R1
M=-2
@END
0;JMP

(NEG_CASE)
@R1
M=-1

(END)
@END
0;JMP
