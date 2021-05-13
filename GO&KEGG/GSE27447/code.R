rm(list=ls())
options(stringsAsFactors = F)
source('http://raw.githubusercontent.com/jmzeng1314/GEOmirror/master/R/geoChina.R')

# 安装所有包包
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
BiocManager::install('GEOquery')
library(devtools)
install_github('jmzeng1314/AnnoProbe')
system('defaults write org.T-project.R force.LANG en_US.UTF-8')


# 加载包
library(AnnoProbe)
library(GEOquery)
library(Biobase)