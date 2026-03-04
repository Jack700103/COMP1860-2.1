@R0        
D=M
@POSITIVE   
D;JGE

@R0        
D=M
@8000      
D=A-D      
@IS_MIN    
D;JEQ

@R0         
D=M
@R1         
M=D
NOT R1, R1  
D=M+1      
@R1
M=D
@R2        
M=1
@R3       
M=0
@END
0;JMP

(IS_MIN)
@R1         
M=R0
@R2         
M=1
@R3         
M=1
@END
0;JMP

(POSITIVE)
@R0         
D=M
@R1
M=D
@R2         
M=0
@R3         
M=0

(END)
@END
0;JMP 
