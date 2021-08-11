# load required packages
suppressPackageStartupMessages(library(qqman))
source("Manhattan_plot.R") # function to generate Manhattan plot

# compute manhanttan and qq plots for each DaTSCAN feature
ds.ass = read.table(
  "../resultsGWAS/individualView/DaTscan_tates_results", 
  header = FALSE
)
colnames(ds.ass) <- c("CHR", "SNP", "PHENO", "P")
caudate.r <- read.table(
  "../resultsGWAS/individualView/DaTscan_results.CAUDATE_R_norm.assoc.linear",
  header = TRUE
)
ds.ass$BP <- caudate.r[complete.cases(caudate.r),]$BP
ds.out.fn <-    "../resultsGWAS/individualView/DaTscan_Manhattan.png"
pheno.ds <- "TATES DaTscan"

mri.ass <- read.table(
  "../resultsGWAS/individualView/MRI_tates_results",
  header = FALSE
)
colnames(mri.ass) <- c("CHR", "SNP", "PHENO", "P")
parahippo.area.r <- read.table(
  "../resultsGWAS/individualView/MRI_results.rh_parahippocampal_area_norm.assoc.linear",
  header = TRUE
)
mri.ass$BP <- parahippo.area.r[complete.cases(parahippo.area.r),]$BP
mri.out.fn <- "../resultsGWAS/individualView/MRI_Manhattan.png"
mri.out.fn.qq <- "MRI_QQ.png"
pheno.mri <- "TATES MRI"

# manhanttan plot 
ManhattanGenerator(ds.ass, ds.out.fn, pheno.ds)
ManhattanGenerator(mri.ass, mri.out.fn, pheno.mri)
