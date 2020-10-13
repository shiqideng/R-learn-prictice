## 基础语法（Grammar）
## 输出Hello world！

cat("Hello world") # 使用cat函数打印

print("Hello world") # 常用print函数打印

"Hello world" # 直接打印输出

## 从上面的例子可以看出R可以即时返回每一行命令的运行结果，这就是脚本语言的优势


## 基本运算（operators）

1+1 # 直接用符号进行运算，Console里可以直接输出计算结果

.4 - .7 + .3 # 理论上输出结果应该为0，但计算结果却是5.551115e-17

## 这是因为计算机浮点数计算的问题
## 计算机在保存一个浮点数a时，是由两个数m和e来表示：a = m x be^m是有位数限制的
## 这就决定了等号右边不可能完全等于等号左边的a。所以浮点数在计算机中的保存只是它的一个近似数
## 在计算机编程中，应该十分注意浮点数问题。

## 这里是两个例子，理论上计算结果应该一致，但实际输出却差了1 
floor(29/50*50) # 结果是28
floor(29*50/50) # 结果是29
## 实际使用过程中，先除再乘的结果是会产生偏差，所以应该尽量先乘再除，避免误差

## 给x赋值为10
x <- 10

## 求平方根
sqrt(x)

## 计算以e为底的指数函数的结果
y=exp(x)
y
## 计算对数
log(y) -> z;z
## 函数可以嵌套使用
exp(log(x))

## 保存一系列数字
a <- c(1, 2, 3, 4)


## 条件控制语句（Control structural）














































### 安装rlang0.7.8
### 需要先安装rtools

# 1、安装一些R包
## 这些特殊的包需要通过Bioconductor来安装
## 安装软件之前需要安装Bioconductor
# 数据包： ALL, CLL, pasilla, airway
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
### 安装命令
### BiocManager::install(“”)

BiocManager::install("ALL")
BiocManager::install("CLL")
BiocManager::install("pasilla")
BiocManager::install("airway")

# 软件包：limma，DESeq2，clusterProfiler

BiocManager::install("limma")
BiocManager::install("DESeq2")
BiocManager::install("clusterProfiler")

# 工具包：reshape2
BiocManager::install('reshape2')


# 绘图包：ggplot2
## ggplot2可以直接通过install.packages()命令安装
install.packages("ggplot2")


# 练习
# ExpressionSet 对象简单讲解
library(CLL)
data("sCLLex")
sCLLex ## 显示large ExpressionSet的内容，中间的“assayData”是表达矩阵
exprMatrix = exprs(sCLLex) ## 使用“exprs”函数取出表达矩阵
dim(exprMatrix) ## 可以看出探针数量和样本数量
meta = pData(sCLLex) ## 使用“pData”函数查看样本分组信息
table(meta$Disease) ##  可以看出所有样本的分组情况

## limma使用ExpressionSet的数据作为输入数据的练习
library(limma)
design = model.matrix(~factor(sCLLex$Disease))
fit = lmFit(sCLLex,design)
fit = eBayes(fit)
options(digits = 4)
topTable(fit,coef = 2,adjust = 'BH')
