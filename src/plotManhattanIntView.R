# load required packages
suppressPackageStartupMessages(library(qqman))
source("Manhattan_plot.R") # function to generate Manhattan plot

# compute manhanttan and qq plots for each DaTSCAN feature
ds.ass = read.table(
  "../resultsGWAS/integratedView/DaTscan_results.DPS_DaTscan.assoc.linear", 
  header = TRUE
)
ds.ass <- ds.ass[complete.cases(ds.ass),]
ds.out.fn <-    "../resultsGWAS/integratedView/DaTscan_Manhattan.png"
pheno.ds <- "GRACE DaTscan"

mri.ass <- read.table(
  "../resultsGWAS/integratedView/MRI_results.DPS_MRI.assoc.linear",
  header = TRUE
)
mri.ass <- mri.ass[complete.cases(mri.ass),]
mri.out.fn <- "../resultsGWAS/integratedView/MRI_Manhattan.png"
pheno.mri <- "GRACE MRI"

# manhanttan plot 
ManhattanGenerator(ds.ass, ds.out.fn, pheno.ds)
ManhattanGenerator(mri.ass, mri.out.fn, pheno.mri)
