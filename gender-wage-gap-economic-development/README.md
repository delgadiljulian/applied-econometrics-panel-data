# Gender Wage Gap and Economic Development in Latin America

This project analyzes the relationship between gender wage gaps and economic development in Latin America using panel data and standard econometric methods.

The main research question addressed is whether gender wage gaps tend to increase or decrease as economies develop. The empirical analysis focuses on the role of GDP per capita and female labor force participation, controlling for unobserved country-specific and time-specific effects.

## Empirical Strategy

The analysis is based on the following panel data specification:

\[
bg_{ct} = \alpha + \beta \ln(GDPpc_{ct}) + \gamma FLFP_{ct} + \mu_c + \delta_t + u_{ct}
\]

where:
- \( bg_{ct} \) is the gender wage gap in country \( c \) and year \( t \),
- \( \ln(GDPpc_{ct}) \) is the logarithm of GDP per capita (constant USD),
- \( FLFP_{ct} \) is female labor force participation,
- \( \mu_c \) captures country fixed effects,
- \( \delta_t \) captures time fixed effects.

The model is estimated using:
- Ordinary Least Squares (OLS)
- Fixed Effects (Within estimator)
- Two-Way Fixed Effects (TWFE)

## Data

The project uses publicly available data from:

- **GenLAC**: gender wage gaps and labor force participation by country and year.
- **World Bank – World Development Indicators**: GDP per capita (constant USD).

Due to licensing and size considerations, raw and intermediate datasets (e.g. `.dta`, `.xlsx`) are not included in this repository.  
All datasets used in the analysis can be reproduced by running the Stata do-files provided in the `code/` directory.

## Repository Structure

gender-wage-gap-economic-development/
│
├── code/
│ ├── master_gender_wage_gap.do
│ ├── 01_worldbank_gdp_pc.do
│ ├── 02_genlac_wage_gap.do
│ ├── 03_genlac_female_lfp.do
│ └── 04_merge_and_analysis.do
│
├── data/
│ └── README.md
│
├── reports/
│ └── gender-wage-gap-economic-development-latin-america.pdf
│
└── README.md

- The `code/` directory contains all Stata scripts required to reproduce the analysis.
- The `master_gender_wage_gap.do` file orchestrates the full workflow.
- The `reports/` directory contains the final research report.

## Tools

- Stata (panel data econometrics)

## Notes

This project was originally developed as part of an applied econometrics assignment and has been curated here as a reproducible empirical research project. The focus is on clarity, transparency, and methodological rigor rather than on exploratory extensions beyond the original research question.
