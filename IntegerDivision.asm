    @R1
    D=M
    @INVALID
    D;JEQ

    @R4
    M=0

    @R0
    D=M
    @R5
    M=D
    @CHECK_X_SIGN
    D;JGE
    @R5
    M=-M
    (CHECK_X_SIGN)

    @R1
    D=M
    @R6
    M=D
    @CHECK_Y_SIGN
    D;JGE
    @R6
    M=-M
    (CHECK_Y_SIGN)

    @R2
    M=0

    (DIV_LOOP)
    @R5
    D=M
    @R6
    D=D-M
    @APPLY_SIGNS
    D;LT

    @R5
    M=D

    @R2
    M=M+1

    @DIV_LOOP
    0;JMP

    (APPLY_SIGNS)
    @R0
    D=M
    @REM_POSITIVE
    D;JGE

    @R5
    D=-M
    @STORE_REM
    0;JMP

    (REM_POSITIVE)
    @R5
    D=M

    (STORE_REM)
    @R3
    M=D

    @R0
    D=M
    @X_POS
    D;JGE
    @X_NEG
    0;JMP

    (X_POS)
    @R1
    D=M
    @FINISH
    D;JLT
    @FINISH
    0;JMP

    (X_NEG)
    @R1
    D=M
    @NEGATE_QUOTIENT
    D;JGE
    @FINISH
    0;JMP

    (NEGATE_QUOTIENT)
    @R2
    M=-M

    (FINISH)
    @END
    0;JMP

    (INVALID)
    @R4
    M=1
    @R2
    M=0
    @R3
    M=0

    (END)
    @END
    0;JMP
