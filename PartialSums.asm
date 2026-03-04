@R2
D=M
@END
D;JLE       

@R3        
M=0
@R4         
M=0

(LOOP)
@R4
D=M
@R2
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
D=M+D      
@R1
D=M
@R6        
M=D
@R4
D=M
@R6
A=M+D      
M=D          

@R4
M=M+1
@LOOP
0;JMP

(END_LOOP)
@END
0;JMP
(END)
