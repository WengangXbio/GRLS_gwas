.libPaths('~/schoenebeck_group/WENGANG/R_lib/') #the path of the R package should be modified accordingly
library(ggplot2) 
args <- commandArgs(T)
df= read.table(args[1], sep=" ", stringsAsFactors=FALSE, header=F)
plot1 <- ggplot(df, aes(x = V3, y = V4)) + geom_point() + labs(title = "PCA Plot", x = "PC1", y = "PC2")
plot2 <- ggplot(df, aes(x = V5, y = V6)) + geom_point() + labs(title = "PCA Plot", x = "PC3", y = "PC4")
combined_plot <- grid.arrange(plot1, plot2, ncol = 1)
ggsave("plot.png", combined_plot, width = 6, height = 12, dpi = 400)

