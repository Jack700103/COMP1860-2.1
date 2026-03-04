// SumEvenIntegers.asm
// Computes z = sum(2*i) for i = 0 to n
// Input: R0 = n
// Output: R1 = z
// Rules:
//   - If n < 0 -> R1 = -1
//   - If overflow -> R1 = -2
//   - Do not modify R0

// ==========================================
// 1. 初始化常数和变量
// ==========================================

// 准备常数 -1 (存入 R14) 和 -2 (存入 R15) 以备后用
@R14
M=0
@1
D=A
@R14
M=M-D       // R14 = -1

@R15
M=0
@2
D=A
@R15
M=M-D       // R15 = -2

// 检查 n < 0
@R0
D=M
@NEGATIVE_CASE
D;JLT

// 初始化累加变量
@R1
M=0         // R1 = sum = 0
@R2
M=0         // R2 = current_even = 0 (2*0)
@R3
M=0         // R3 = i = 0

// ==========================================
// 2. 主循环
// ==========================================
(LOOP_START)
    // 检查终止条件: if i > n, 退出
    @R3
    D=M
    @R0
    D=D-M
    @LOOP_END
    D;JGT

    // ==========================================
    // 3. 安全加法与溢出检测
    // ==========================================
    // 我们要计算: new_sum = sum (R1) + current_even (R2)
    // 溢出条件: (R1 >= 0) AND (R2 >= 0) AND (new_sum < 0)
    
    // 3.1 检查 R1 (sum) 是否 >= 0
    @R1
    D=M
    @CHECK_R2_SIGN
    D;JGE       // 如果 R1 >= 0, 继续检查 R2
    // 如果 R1 < 0，说明之前已经出错了，或者逻辑异常，直接视为溢出
    @OVERFLOW_CASE
    0;JMP

(CHECK_R2_SIGN)
    // 3.2 检查 R2 (current_even) 是否 >= 0
    @R2
    D=M
    @CALC_SUM
    D;JGE       // 如果 R2 >= 0, 执行加法
    // 如果 R2 < 0，理论上不该发生，视为溢出
    @OVERFLOW_CASE
    0;JMP

(CALC_SUM)
    // 3.3 执行加法
    @R1
    D=M
    @R2
    D=D+M
    @R4
    M=D         // R4 暂存结果

    // 3.4 检查结果是否 < 0
    @R4
    D=M
    @OVERFLOW_CASE
    D;JLT       // 如果结果 < 0，发生溢出

    // 3.5 更新 R1
    @R4
    D=M
    @R1
    M=D

    // ==========================================
    // 4. 更新计数器
    // ==========================================
    // i++
    @R3
    M=M+1
    
    // current_even += 2
    @R2
    M=M+1
    @R2
    M=M+1

    // 循环
    @LOOP_START
    0;JMP

// ==========================================
// 5. 结束处理
// ==========================================
(LOOP_END)
    // 正常结束，R1 已是结果
    @FINISH
    0;JMP

(NEGATIVE_CASE)
    // n < 0, R1 = -1 (从 R14 读取)
    @R14
    D=M
    @R1
    M=D
    @FINISH
    0;JMP

(OVERFLOW_CASE)
    // 溢出, R1 = -2 (从 R15 读取)
    @R15
    D=M
    @R1
    M=D
    @FINISH
    0;JMP

(FINISH)
    @END
    0;JMP

(END)
    @END
    0;JMP