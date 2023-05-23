plink --bfile $1 --geno $2 --make-bed --out temp1 --chr-set 42
plink --bfile temp1 --mind $3 --make-bed --out temp2 --chr-set 42
plink --bfile temp2 --maf $4 --make-bed --out $5 --chr-set 42
grep "missing genotype data" temp1.log > Quality-control.log
grep "missing genotype data" temp2.log |cat Quality-control.log - > Quality-control-temp.log
grep "minor allele threshold" $5.log |cat Quality-control-temp.log - > Quality-control.log
rm *temp* $5.log 
