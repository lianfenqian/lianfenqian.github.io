# BROKEN MASTER SCRIPT
# Run from the project root with: Rscript run_pipeline.R

source("R/01_clean.R")
source("R/02_analyze.R")

cat("Pipeline completed successfully.\n")
# BUG 4: no explicit validation checks or confirmation that expected outputs exist.
