
# Garment Production Data Quality Report

## 1. Dataset Overview

Dataset: Productivity Prediction of Garment Employees

Source: UCI Machine Learning Repository

Total records: 1,197
Total columns: 15

## 2. Missing Values

The dataset contains 506 missing WIP values.

Missing WIP percentage: 42.27%

Missing values by department:

| Department | Records | Missing WIP |
|------------|---------|-------------|
| Sewing     | 691     | 0           |
| Finishing  | 506     | 506         |

All missing WIP values occur in the finishing department.

Decision:
Keep the missing WIP values unchanged until further
investigation. Do not automatically replace them with zero.

## 3. Duplicate Records

Total fully duplicated records: 0

Decision:
No duplicate records need to be removed.

## 4. Department Standardization

The original dataset contained inconsistent department
labels caused by whitespace.

Standardized department categories:
- Sewing: 691 records
- Finishing: 506 records

Cleaning method:
Remove leading and trailing whitespace and convert
department names to lowercase.

## 5. Productivity Investigation

Average targeted productivity: 72.96%
Average actual productivity: 73.51%

Records above 100% actual productivity: 37
Percentage of observations: 3.09%

High-productivity records:
- Sewing: 25
- Finishing: 12

Decision:
Retain these records because productivity above 100%
may represent performance exceeding the standard.

## 6. Data Quality Decisions

- Preserve the original CSV file.
- Standardize department labels in a working copy.
- Keep missing WIP values for further investigation.
- Retain actual productivity values above 100%.
- Do not remove any observations at this stage.

## 7. Dataset Limitations

The data represents historical garment manufacturing
observations from Bangladesh.

It does not represent actual Sri Lankan factory
production records.

Statistical relationships should not automatically
be interpreted as causal relationships.

## 8. Next Steps

- Validate numerical and date columns.
- Create a reproducible cleaning script.
- Prepare the processed dataset.
- Calculate manufacturing KPIs.
- Develop production performance visualizations.
