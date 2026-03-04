// SumEvenIntegers.asm
// 计算 z = sum(2*i) for i = 0 to n
// 输入: R0 = n
// 输出: R1 = z
// 约束: 不得修改 R0
// 错误处理: n < 0 -> R1 = -1; 溢出 -> R1 = -2

// 1. 检查 n 是否为负数
@R0
D=M
@NEGATIVE_N
D;JLT

// 2. 初始化变量
// R1 (Accumulator) = 0
@R1
M=0

// R2 (Current Even Number, 2*i) = 0
@R2
M=0

// R3 (Counter i) = 0
@R3
M=0

(LOOP_START)
// 检查循环条件: if i > n, exit loop
@R3
D=M
@R0
D=D-M
@LOOP_END
D;JGT

// 3. 执行加法: temp = R1 + R2
@R1
D=M
@R2
D=D+M
@TEMP_SUM
M=D

// 4. 溢出检查
// 规则: 两个非负数相加，结果为负，则溢出。
// 检查 R1 (旧和) 是否非负
@R1
D=M
@CHECK_OPERAND2
D;JLT           // 如果旧和已经是负的（理论上不应发生，除非之前溢出未捕获），跳过或视为溢出

// 检查 R2 (当前加数) 是否非负
@R2
D=M
@CHECK_RESULT
D;JLT           // 如果加数是负的，跳过

// 检查结果 (TEMP_SUM) 是否为负
@TEMP_SUM
D=M
@OVERFLOW_DETECTED
D;JLT           // 如果结果 < 0，发生溢出

(CHECK_OPERAND2)
(CHECK_RESULT)
// 无溢出，更新 R1
@TEMP_SUM
D=M
@R1
M=D

// 5. 更新变量
// R2 = R2 + 2 (下一个偶数)
@R2
M=M+1
@R2
M=M+1

// R3 = R3 + 1 (计数器加 1)
@R3
M=M+1

// 跳回循环开始
@LOOP_START
0;JMP

(LOOP_END)
// 正常结束，R1 中已是结果
@FINAL_END
0;JMP

(NEGATIVE_N)
// n < 0 的情况
@R1
M=-1
@FINAL_END
0;JMP

(OVERFLOW_DETECTED)
// 溢出情况
@R1
M=-2
@FINAL_END
0;JMP

(FINAL_END)
@END
0;JMP

(END)
@END
0;JMP