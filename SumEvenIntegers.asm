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
@COUNTER
M=D             // COUNTER = n (剩余要加的项数)
@R1
M=0             // R1 = 0 (结果累加器)
@CURRENT_EVEN
M=0             // CURRENT_EVEN = 0 (当前要加的偶数)

(CALC_LOOP)
@COUNTER
D=M
@CALC_DONE
D;JLE           // 当计数器 <= 0 时结束

// 计算 R1 + CURRENT_EVEN 的结果，检查溢出
@R1
D=M
@TEMP_SUM
M=D             // 临时保存当前和

@CURRENT_EVEN
D=M
@TEMP_SUM
D=D+M           // 计算 R1 + CURRENT_EVEN

// 溢出检查：当两个非负数相加结果为负数时发生溢出
// 由于我们从0开始加正偶数，R1和CURRENT_EVEN都应该是非负的
@R1
D=M
@CHECK_POS_ADD
D;JLT           // 如果R1已经是负数（可能由于溢出），则跳过检查

@CURRENT_EVEN
D=M
@CHECK_POS_ADD
D;JLT           // 如果CURRENT_EVEN是负数（不应该），也跳过检查

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

// 更新下一个偶数 (CURRENT_EVEN += 2)
@CURRENT_EVEN
M=M+1
@CURRENT_EVEN
M=M+1

// 计数器减1
@COUNTER
M=M-1
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
M=0             // n = 0, 设置 R1 = 0 (空和为0)
@END
0;JMP

(OVERFLOW_OCCURRED)
@R1
M=-2            // 溢出，设置 R1 = -2

(END)
@END
0;JMP