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
a + 5

c <- (a + sqrt(a))/exp(a)
a*c

b <- sort(a,decreasing = TRUE)

max(a)


mean(a) # 求平均值

fivenum(a) # 返回五个值，最小值、下四分位数、中位数、上四分位数、最大值


## 运算逻辑符（logical operator）
## !, &, &&, |, ||, xor, isTRUE等等。&与&&, |与||
## 在R中将&和|称为短逻辑符
## &&及||称为长逻辑符
## 长逻辑符只比较左边和右边的第一个元素，而短逻辑符会一一比较所有的元素。
a<-c(TRUE, FALSE, TRUE, FALSE)
b<-c(FALSE, FALSE, TRUE, TRUE)
c<-c(TRUE, FALSE, FALSE, FALSE)

a & b
a && b
a | c
a || c

## ****R中可以在使用过程中定义变量，为了使已经定义的不被覆盖，可以使用ls()函数来查看当前workspace下的所有变量名


## 条件控制语句（Control structural）

## 基础语句
## if 
## ifelse
## switch
## for
## while
## next
## break

## 用R控制输出“待我长发及腰，少年娶我可好？ ——语出: 何晓道 《十里红妆女儿梦》”
hairLength <- 25
waistHeight <- 110
height <- 168
marryMe <- FALSE
if(hairLength >= height - waistHeight){ marryMe <- TRUE}
ifelse(marryMe, "YES", "NO")

day <- 0
if(!marryMe){
  while(hairLength < height - waistHeight){
    day <- day + 1
    hairLength <- hairLength + .1
  }
  marryMe <- TRUE
}
day

hairLength <- 25
marryMe <- FALSE
wait <- 100 * 365
for(day in 1:wait){
  if(hairLength >= height - waistHeight){
    marryMe <- TRUE
    break
  }else{
    if(runif(1) < 0.5){
      next
    }
    hairLength <- hairLength + .1
  }
}
day


## R软件包（Packages）
## 安装函数 install.packages()
## 使用软件包之前需要加载包，使用library()函数加载包
## 使用sessionInfo()函数可以查看当前运行环境


## Bioconductor包
## Bioconductor本质上就是基于R的用于生物学研究的软件包的大集合

## 安装
install.packages("BiocManager",repos = "https://cloud.r-project.org") # 国内可以换成别的源

## 调用BiocManager
library(BiocManager)

## 通过BiocManager安装软件
BiocManager::install("trackViewer")

## 加载trackVier
library(trackViewer)

## 一些镜像地址
##  BioCsoft 
## "https://bioconductor.org/packages/3.10/bioc" 
##  BioCann 
## "https://bioconductor.org/packages/3.10/data/annotation" 
##  BioCexp 
## "https://bioconductor.org/packages/3.10/data/experiment" 
##  BioCworkflows 
## "https://bioconductor.org/packages/3.10/workflows" 
##  CRAN 
## "https://cloud.r-project.org"


## 在BiocManager软件包中，也提供了选择镜像安装的办法
repositories()
chooseBioCmirror()
chooseCRANmirror()

## 获取R/Bioconductor帮助

## 已知函数名，获取帮助
help(solve)
### 对于某些关键词，要用''或“”括起来
?`[`

## 未知函数名，通过关键词搜索
??motif
help.search("motif")

## 使用Vignettes获取对软件包功能及范例的整体印象
vignette("motifStack")























