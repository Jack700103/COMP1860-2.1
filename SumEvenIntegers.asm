// SumEvenIntegers.asm
// 计算 z = sum(2*i) for i = 0 to n
// 即: 0 + 2 + 4 + ... + 2*n
// 输入: R0 = n
// 输出: R1 = z
// 约束: 
//   1. 不得修改 R0 的初始值
//   2. 如果 n < 0, R1 = -1
//   3. 如果求和过程中发生溢出, R1 = -2

// --- 步骤 1: 检查 n 是否小于 0 ---
@R0
D=M
@NEGATIVE_CASE
D;JLT           // 如果 n < 0, 跳转到错误处理

// --- 步骤 2: 初始化变量 ---
// R1: 累加器 (Sum), 初始化为 0
@R1
M=0

// R2: 当前偶数值 (current_val = 2*i), 初始化为 0 (当 i=0)
@R2
M=0

// R3: 循环计数器 (i), 初始化为 0
@R3
M=0

// --- 步骤 3: 主循环 ---
(LOOP_START)
    // 检查循环终止条件: if i > n, 则退出循环
    // 计算 D = i - n
    @R3
    D=M
    @R0
    D=D-M
    
    @LOOP_END
    D;JGT         // 如果 i > n, 跳出循环
    
    // --- 步骤 4: 执行加法并检查溢出 ---
    // 我们即将计算: new_sum = current_sum + current_val
    // 溢出规则: 若 A >= 0, B >= 0, 但 A+B < 0, 则发生溢出
    
    // 4.1 获取当前和 (A)
    @R1
    D=M
    @CHECK_A_NEG
    D;JLT         // 防御性编程：如果当前和已经是负数（不应发生），视为异常或直接跳过检查
    
    // 4.2 获取当前加数 (B = 2*i)
    @R2
    D=M
    @CHECK_B_NEG
    D;JLT         // 防御性编程：如果加数是负数（不应发生）
    
    // 4.3 计算和并存入临时寄存器 R4
    @R1
    D=M
    @R2
    D=D+M
    @R4
    M=D           // R4 = R1 + R2
    
    // 4.4 检查结果是否为负 (溢出标志)
    @R4
    D=M
    @OVERFLOW_CASE
    D;JLT         // 如果结果 < 0, 说明发生了溢出
    
    // 4.5 无溢出，更新 R1
    @R4
    D=M
    @R1
    M=D
    
    @CONTINUE_LOOP
    0;JMP

(CHECK_A_NEG)
(CHECK_B_NEG)
    // 如果操作数出现意外的负数，理论上对于此题逻辑不会发生，
    // 但为了安全，如果发生，我们继续执行加法，让结果检查去捕获，或者视为正常流程继续
    // 这里重新计算以确保 R4 被正确赋值
    @R1
    D=M
    @R2
    D=D+M
    @R4
    M=D
    @R4
    D=M
    @OVERFLOW_CASE
    D;JLT
    @R4
    D=M
    @R1
    M=D
    @CONTINUE_LOOP
    0;JMP

(CONTINUE_LOOP)
    // --- 步骤 5: 更新变量 ---
    
    // i++ (R3 = R3 + 1)
    @R3
    M=M+1
    
    // current_val += 2 (R2 = R2 + 2)
    @R2
    M=M+1
    @R2
    M=M+1
    
    // 跳回循环开始
    @LOOP_START
    0;JMP

(LOOP_END)
    // 正常结束，R1 中已经是最终结果
    @FINAL_EXIT
    0;JMP

(NEGATIVE_CASE)
    // n < 0, 设置 R1 = -1
    @R1
    M=-1
    @FINAL_EXIT
    0;JMP

(OVERFLOW_CASE)
    // 发生溢出，设置 R1 = -2
    @R1
    M=-2
    @FINAL_EXIT
    0;JMP

(FINAL_EXIT)
    @END
    0;JMP

(END)
    @END
    0;JMP