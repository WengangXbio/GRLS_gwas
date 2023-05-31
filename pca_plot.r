.libPaths('~/schoenebeck_group/WENGANG/R_lib/') #the path of the R package should be modified accordingly
library(ggplot2) 
library(gridExtra)
args <- commandArgs(T)
df= read.table(args[1], sep=" ", stringsAsFactors=FALSE, header=F)
plot1 <- ggplot(df, aes(x = V3, y = V4)) + geom_point() + labs(title = "PCA Plot", x = "PC1", y = "PC2")
plot2 <- ggplot(df, aes(x = V5, y = V6)) + geom_point() + labs(title = "PCA Plot", x = "PC3", y = "PC4")
combined_plot <- grid.arrange(plot1, plot2, nrow = 1)
ggsave("pca_plot.png", combined_plot, width = 12, height = 6, dpi = 400)

