// SumEvenIntegers.asm
// 计算前n个偶数的和: z = ∑(i=0到n)2*i = n*(n+1)
// 输入: R0 = n
// 输出: R1 = 结果 (n<0→-1, 溢出→-2, 正常→n*(n+1))
// 约束: 不修改R0初始值 | 16位2补码溢出检查
// 复用Sum_to_n.asm的累加结构 + Multiply.asm的乘法逻辑 + 第5题的溢出检查

// 第一步：判断n是否为负数，负数直接置R1=-1
@R0
D=M
@NEGATIVE_CASE
D;JLT           // n<0 → 跳转到负数分支

// 第二步：初始化乘法参数（复用Multiply.asm的ACCUMULATOR/COUNTER命名）
@R0
D=M
@COUNTER        // 乘法循环计数器 = n
M=D
@R0
D=M
D=D+1
@MULTIPLIER     // 被乘数 = n+1
M=D
@ACCUMULATOR    // 累加器（存储乘法结果）初始化为0
M=0

// 第三步：乘法循环（复用Multiply.asm的循环逻辑）
(MULTIPLY_LOOP)
// 检查终止条件：COUNTER <= 0 则结束循环
@COUNTER
D=M
@END_MULTIPLY
D;JLE

// 溢出检查（复刻第5题AddWithOverflowCheck核心逻辑）
@ACCUMULATOR
D=M
@SIGN_ACC       // 暂存累加器符号
M=D
@MULTIPLIER
D=M
@SIGN_MUL       // 暂存被乘数符号
M=D

// 执行累加：ACCUMULATOR += MULTIPLIER
@MULTIPLIER
D=M
@ACCUMULATOR
M=D+M

// 判定溢出：同号相加结果异号则溢出
@SIGN_ACC
D=M
@SIGN_MUL
D=D&M
@SAME_SIGN
D;JLT           // 都为负→同号，无溢出
@SIGN_ACC
D=M
@OVERFLOW_CASE
D;JLT           // 累加器负、被乘数正→异号，无溢出
@SIGN_MUL
D=M
@OVERFLOW_CASE
D;JLT           // 累加器正、被乘数负→异号，无溢出
@SAME_SIGN
0;JMP           // 都为正→同号，无溢出

// 溢出分支：置R1=-2并结束
(OVERFLOW_CASE)
@R1
M=-2
@END
0;JMP

// 无溢出：计数器减1，继续循环
(SAME_SIGN)
@COUNTER
M=M-1
@MULTIPLY_LOOP
0;JMP

// 乘法完成：将累加器结果存入R1
(END_MULTIPLY)
@ACCUMULATOR
D=M
@R1
M=D
@END
0;JMP

// 负数分支：n<0 → R1=-1
(NEGATIVE_CASE)
@R1
M=-1
@END
0;JMP

// 程序结束（复用Sum_to_n.asm/Find_array_max系列的死循环结束方式）
(END)
@END
0;JMP