# GRLS_gwas

## Quality control
sh g_qc.sh [input name] [geno] [mind] [maf] [output name]
### geno     filters out all variants over the missing call rates value
### mind     filters out all samples over the missing call rates value
### maf      filters out all variants lower than the minor allele frequency value

#PCA analysis
sh PCA.sh [input name] [ld]
#ld       remove variants with LD geater than this value

#PCA plot 
#install R >=3.6.0 with the 'ggplot' package before running the command
Rscript pca_plot.r qced.eigenvec


