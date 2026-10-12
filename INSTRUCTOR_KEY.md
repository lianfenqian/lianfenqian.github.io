# Instructor Key — Break and Repair a Reproducible Pipeline

## Intended bugs and repairs

1. `R/01_clean.R`: `read.csv("housing_data.csv")` points to a nonexistent file.
   - Fix: use `read.csv("data/housing.csv")`, assuming execution from the project root.

2. `R/01_clean.R`: `housing$neighbourhood` is misspelled; the column is `neighborhood`.
   - Fix: use `housing$neighborhood`. Validate required columns before transformation.

3. The cleaning script writes to `results/housing_clean.csv`, but the analysis script reads `data/processed/housing_clean.csv`.
   - Fix: make the output/input paths consistent. Recommended: create `data/processed/` and write cleaned data there.

4. There are no explicit validation checks or checks that expected outputs exist.
   - Add checks for required columns, positive sale prices/areas, unique house IDs, nonempty data, and output existence.

## Example repair for R/01_clean.R

```r
dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)
housing <- read.csv("data/housing.csv", stringsAsFactors = FALSE)

required <- c("house_id", "sale_price", "area_sqft", "bedrooms", "neighborhood")
stopifnot(all(required %in% names(housing)))
stopifnot(!anyNA(housing$house_id))
stopifnot(!anyDuplicated(housing$house_id))
stopifnot(all(housing$sale_price > 0, na.rm = TRUE))
stopifnot(all(housing$area_sqft > 0, na.rm = TRUE))

housing$neighborhood <- tolower(trimws(housing$neighborhood))
housing <- subset(housing, !is.na(sale_price) & !is.na(area_sqft))
write.csv(housing, "data/processed/housing_clean.csv", row.names = FALSE)
```

Then make `R/02_analyze.R` read `data/processed/housing_clean.csv`. Ensure `results/` exists before writing files.

## Discussion points
- A pipeline can run but still be statistically invalid; execution is necessary, not sufficient.
- A deterministic pipeline depends on explicit inputs, documented assumptions, and controlled dependencies.
- Relative paths work when run from a documented project root.
- Students should not fix failures by editing the raw data or removing checks.
- Example commit message: `Repair input paths and validate housing data`.
