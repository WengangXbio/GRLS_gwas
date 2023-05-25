# GRLS_gwas

## Quality control
sh g_qc.sh [input name] [geno] [mind] [maf] [output name]

[geno]     filters out all variants over the missing call rates value (recommend 0.1)

[mind]     filters out all samples over the missing call rates value (recommend 0.1)

[maf]      filters out all variants lower than the minor allele frequency value (recommend 0.05)

## PCA analysis
sh PCA.sh [input name] [HW] [ld]

[HW]       remove variants that failed the Hardy-Weinberg test (recommend 0.001)

[ld]       remove variants with LD geater than this value (recommend 0.5)

## PCA plot 
#install R >=3.6.0 with the 'ggplot' package before running the command

Rscript pca_plot.r qced.eigenvec


