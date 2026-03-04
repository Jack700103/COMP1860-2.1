    @R0
    D=M
    @NEGATIVE
    D;JLT

    @R1
    M=0        
    @i
    M=0        

(LOOP)
    @i
    D=M
    @R0
    D=D-M     
    @END
    D;JGT

    @i
    D=M
    @2
    D=D+A     
    @R1
    M=D+M      

    @R1
    D=M
    @PREV
    M=D        
    @i
    D=M
    @2
    D=D+A
    @R1
    M=M-D      
    @PREV
    D=M
    @R1
    M=D       
    @R1
    D=M
    @PREVSUM
    M=D        
    @R1
    D=M
    @PREVSUM
    D=D-M      
    @OVERFLOW
    D;JLT

    @i
    M=M+1
    @LOOP
    0;JMP

(NEGATIVE)
    @R1
    M=-1
    @END
    0;JMP

(OVERFLOW)
    @R1
    M=-2
    @END
    0;JMP

(END)
    @END
    0;JMP