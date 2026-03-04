@R0         
D=M
@R1
D=D-M       

@SET_R2_R0  
D;JGE

@R1         
D=M
@R2
M=D
@R3
M=1       
@END
0;JMP

(SET_R2_R0)
@R0         
D=M
@R2
M=D
@R3
M=0       

(END)
@END
0;JMP       
