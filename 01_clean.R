# BROKEN SCRIPT 1: Data cleaning
# Intended input: data/housing.csv
# Intended output: data/processed/housing_clean.csv

housing <- read.csv("housing_data.csv")  # BUG 1: wrong path/name

# Standardize neighborhood labels
housing$neighborhood <- tolower(trimws(housing$neighbourhood)) # BUG 2: misspelled column

# Keep observations with positive prices and areas
housing <- subset(housing, sale_price > 0 & area_sqft > 0)

# Save cleaned data
write.csv(housing, "results/housing_clean.csv", row.names = FALSE)
