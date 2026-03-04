@R1
D=M
@SET_ZERO
D;JLE       

@R0
D=M
@R3      
M=D        
@R4         
M=1

(LOOP)
@R4
D=M
@R1
D=D-M       
@END_LOOP
D;JEQ       

@R0
D=M
@R5       
M=D
@R4
D=M
@R5
A=M+D    
D=M         

@R3
D=M-D       
@UPDATE_MAX
D;JLT        

@R4
M=M+1
@LOOP
0;JMP

(UPDATE_MAX)
@R3
M=D         
@R4
M=M+1
@LOOP
0;JMP

(END_LOOP)
@R3
D=M
@R2
M=D        
@END
0;JMP

(SET_ZERO)
@R2
M=0         
(END)
