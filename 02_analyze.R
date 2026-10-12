# BROKEN SCRIPT 2: Analysis
# Intended input: data/processed/housing_clean.csv
# Intended outputs: results/model_summary.txt and results/price_area.png

housing <- read.csv("data/processed/housing_clean.csv") # BUG 3: path does not match cleaning output
fit <- lm(sale_price ~ area_sqft, data = housing)

summary_lines <- capture.output({
  cat("N =", nrow(housing), "\n")
  print(summary(fit))
})
writeLines(summary_lines, "results/model_summary.txt")

png("results/price_area.png", width = 800, height = 600)
plot(housing$area_sqft, housing$sale_price,
     main = "Sale price vs area",
     xlab = "Area (sq ft)", ylab = "Sale price ($)")
abline(fit, lwd = 2)
dev.off()
