@R1         
D=M
@SET_ZERO   
D;JLE

@R0         
D=M
@R3
M=D

@R1         
D=M
@R4
M=D

@R5         
M=0

(LOOP)
@R4        
D=M
@END_LOOP
D;JEQ       

@R3         
A=M
D=M
@R5
D=D+M      
@R5
M=D

@R3        
M=M+1
@R4        
M=M-1
@LOOP
0;JMP      

(END_LOOP)
@R5         
D=M
@R2
M=D
@END
0;JMP

(SET_ZERO)  
@R2
M=0
(END)
@END
0;JMP
