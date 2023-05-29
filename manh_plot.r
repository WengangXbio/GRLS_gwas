setwd("dropbox")
trait='test'
library(qqman)
test=read.table(paste(trait,".mlma.manh",sep=""),head=T)
colnames(test)=c("SNP","CHR","BP","P")
snpsOfInterest=test$SNP[which(test$P<=1e-08)]
tiff(paste(trait,".mlma.manh.tif",sep=""),units="in", width=30, height=10, res=100)
manhattan(test,suggestiveline = F,genomewideline = 8,highlight = snpsOfInterest)
dev.off() 
tiff(paste(paste(trait,".qqplot.tif",sep=""),sep=""),units="in", width=10, height=10, res=100)
qq(test$P)
dev.off() 
