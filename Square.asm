@R0
D=M
@R2
M=D          
@R1
M=0          
@R3
M=D         

@R3
D=M
@LOOP_CHECK
D;JGE
@R3
M=!M
M=M+1        

(LOOP)
@R3
D=M
@LOOP_END
D;JLE        

@R2
D=M
@R1
M=D+M        

@R3
M=M-1
@LOOP
0;JMP

(LOOP_END)
@END
0;JMP
(END)
@END
0;JMP
