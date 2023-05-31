library(qqman)
input_name='trait1'
test=read.table(paste(input_name,".mlma.manh",sep=""),head=T)
colnames(test)=c("SNP","CHR","BP","P")
snpsOfInterest=test$SNP[which(test$P<=1e-08)]
jpeg(paste(input_name,".mlma.manh.jpg",sep=""),units="in", width=30, height=10, res=100)
manhattan(test,suggestiveline = F,genomewideline = 8,highlight = snpsOfInterest)
dev.off() 
jpeg(paste(paste(input_name,".qqplot.jpg",sep=""),sep=""),units="in", width=10, height=10, res=100)
qq(test$P)
dev.off()
