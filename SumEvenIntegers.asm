// SumEvenIntegers.asm
// 计算前n个偶数的和: 0 + 2 + 4 + ... + 2*(n-1)
// 输入: R0 = n
// 输出: R1 = 结果
// 约束: 不得修改 R0 的初始值
// 如果 n < 0, R1 = -1
// 如果溢出, R1 = -2

// 检查 n 是否为负数
@R0
D=M
@CHECK_NEGATIVE
D;JLT

// 检查 n 是否为 0
@R0
D=M
@CHECK_ZERO
D;JEQ

// n > 0 的情况，开始计算
@R0
D=M
@COUNT
M=D             // COUNT = n (循环次数)
@R1
M=0             // R1 = 0 (结果累加器)
@CURRENT_I
M=0             // CURRENT_I = 0 (当前 i 值)

(CALC_LOOP)
@CURRENT_I
D=M
@COUNT
D=D-M           // 比较当前 i 和 n
@CALC_DONE
D;JGE           // 如果 i >= n，结束循环

// 计算 2*i
@CURRENT_I
D=M
@TEMP_DOUBLE
M=D
@TEMP_DOUBLE
M=M+D           // TEMP_DOUBLE = 2 * CURRENT_I

// 计算 R1 + 2*i 的结果，检查溢出
@R1
D=M
@TEMP_SUM
M=D             // 临时保存当前和

@TEMP_DOUBLE
D=M
@TEMP_SUM
D=D+M           // 计算 R1 + 2*i

// 溢出检查：当两个非负数相加结果为负数时发生溢出
// R1 (当前和) 应该非负，TEMP_DOUBLE (2*i) 也应该非负
@R1
D=M
@CHECK_POS_ADD
D;JLT           // 如果R1是负数（可能由于之前溢出），跳过检查

@TEMP_DOUBLE
D=M
@CHECK_POS_ADD
D;JLT           // 如果2*i是负数（不太可能，但检查一下）

// 两个操作数都非负，检查结果是否为负（溢出）
@TEMP_SUM
D=M
@OVERFLOW_OCCURRED
D;JLT           // 如果结果 < 0，发生溢出

(CHECK_POS_ADD)
// 没有溢出，将结果存回R1
@TEMP_SUM
D=M
@R1
M=D

// i++
@CURRENT_I
M=M+1

@CALC_LOOP
0;JMP

(CALC_DONE)
@END
0;JMP

(CHECK_NEGATIVE)
@R1
M=-1            // n < 0, 设置 R1 = -1
@END
0;JMP

(CHECK_ZERO)
@R1
M=0             // n = 0, 设置 R1 = 0 (0+2*0=0)
@END
0;JMP

(OVERFLOW_OCCURRED)
@R1
M=-2            // 溢出，设置 R1 = -2

(END)
@END
0;JMP