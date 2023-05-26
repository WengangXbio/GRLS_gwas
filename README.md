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

## GWAS-in-preparation 
cut -f1 sample_sheet.txt | tail -n +2 > phen_id.list

cut -d' ' -f1 AxiomGT1v2.merge.filtered.fam > geno_id.list

cat geno_id.list phen_id.list |sort |uniq -c |awk 'BEGIN{OFS="\t"} $1==2 {print $2,$2}' > gp_ind.list

plink --bfile qced --keep gp_ind.list --make-bed --out test --chr-set 42

file1_col=6

file2_col=2

awk 'BEGIN{OFS="\t"} FNR==NR{arr[$1]=$'$file1_col'; next} {print $0, arr[$1]} ' sample_sheet.txt gp_ind.list

