@R0
D=M
@R1
D=D+M          
@R2
M=D            

@R0
D=M
@R1
D=D&M          

@R0
D=M
@CHECK_POS
D;JGE          

@R1
D=M
@CHECK_BOTH_NEG
D;JLT          
@NO_OVERFLOW
0;JMP         

(CHECK_BOTH_NEG)

@R2
D=M
@NO_OVERFLOW
D;JGE          
@OVERFLOW
0;JMP

(CHECK_POS)

@R1
D=M
@CHECK_BOTH_POS
D;JGE         
@NO_OVERFLOW
0;JMP         

(CHECK_BOTH_POS)

@R2
D=M
@OVERFLOW
D;JLT          

(NO_OVERFLOW)
@R3
M=0
@END
0;JMP

(OVERFLOW)
@R3
M=1

(END)
@END
0;JMP
