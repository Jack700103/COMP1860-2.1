// SumEvenIntegers.asm
// Computes z = sum(2*i) for i = 0 to n
// Input: R0 = n
// Output: R1 = z
// Constraints: 
//   - Do not modify R0.
//   - If n < 0, R1 = -1.
//   - If overflow occurs, R1 = -2.

// 1. Check if n < 0
@R0
D=M
@NEGATIVE
D;JLT

// 2. Initialize variables
@R1
M=0       // sum = 0
@R2
M=0       // current_even = 0 (2*0)
@R3
M=0       // i = 0

// 3. Loop: while (i <= n)
(LOOP_START)
    // Check if i > n
    @R3
    D=M
    @R0
    D=D-M
    @LOOP_END
    D;JGT     // if i > n, exit loop

    // Calculate temp_sum = sum + current_even
    @R1
    D=M
    @R2
    D=D+M
    @R4
    M=D       // Store result in R4 temporarily

    // Check for overflow: if result < 0 (since operands are non-negative)
    @R4
    D=M
    @OVERFLOW
    D;JLT

    // Update sum
    @R4
    D=M
    @R1
    M=D

    // Increment i
    @R3
    M=M+1

    // Increment current_even by 2
    @R2
    M=M+1
    @R2
    M=M+1

    // Repeat loop
    @LOOP_START
    0;JMP

(LOOP_END)
    // Normal termination
    @FINISH
    0;JMP

(NEGATIVE)
    // Set R1 = -1
    @R1
    M=0
    @VAL1
    D=M
    @R1
    D=M-D   // 0 - 1 = -1
    M=D
    @FINISH
    0;JMP

(OVERFLOW)
    // Set R1 = -2
    @R1
    M=0
    @VAL2
    D=M
    @R1
    D=M-D   // 0 - 2 = -2
    M=D
    @FINISH
    0;JMP

(FINISH)
    @END
    0;JMP

(END)
    @END
    0;JMP

// Constant definitions
(VAL1)
@1
D=A
M=D
@VAL2
0;JMP

(VAL2)
@2
D=A
M=D
@FINISH
0;JMP