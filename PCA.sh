awk '$1>38 {print}' $1.bim > non-auto.bim
plink --bfile $1 --exclude non-auto.bim --make-bed --out temp1 --chr-set 42
plink --bfile temp1 --indep-pairwise 100 20 $2 --chr-set 42 --out ld
plink --bfile temp1 --exclude ld.prune.out --make-bed --out temp2 --chr-set 42
plink --bfile temp2 --pca --out $1 --chr-set 42
rm temp* ld* non-auto.bim
