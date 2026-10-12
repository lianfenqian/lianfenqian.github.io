# Break and Repair a Reproducible Pipeline — Student Instructions

## Scenario
You inherited an R project that should read raw housing data, clean it, fit a regression model, and create a report artifact. The pipeline is broken in several places.

## Learning goals
- Diagnose path and variable-name failures.
- Check data assumptions before modeling.
- Ensure pipeline inputs and outputs agree.
- Add assertions and verify generated artifacts.
- Use Git to record a meaningful repair.

## Project structure
- `data/housing.csv`: original synthetic dataset; do not edit it.
- `R/01_clean.R`: cleaning step.
- `R/02_analyze.R`: modeling and figure step.
- `run_pipeline.R`: master script.

## Your task (20–25 minutes)
1. Run from the project root: `Rscript run_pipeline.R`.
2. Read the first error carefully. Fix it, then rerun.
3. Continue until the pipeline runs end-to-end.
4. Add at least two assertions (e.g., required columns exist, prices are positive, IDs are unique, data are nonempty).
5. Confirm the final outputs are created; inspect the regression summary and plot.
6. If Git is available, commit your repair with a meaningful message.

## Constraints
- Do not edit `data/housing.csv`.
- Do not hard-code an absolute path to your computer.
- Do not simply remove the failing lines.
- Keep the pipeline rerunnable from a clean R session.
- Document any assumptions you make.

## Deliverables
- Repaired scripts.
- Generated files in `results/` (and `data/processed/`, if used).
- A short note listing each bug, its fix, and how you verified the fix.
- One Git commit, if Git is available.

## Exit questions
1. Which bug was a coding error, and which was a workflow/design inconsistency?
2. Why should raw data remain unchanged?
3. What checks could detect an incorrect join or duplicated observations?
4. Does a successful pipeline prove that the regression model is appropriate? Explain.
