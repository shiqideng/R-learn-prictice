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
