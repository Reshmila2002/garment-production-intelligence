
# Dataset Documentation

## Dataset Name
Productivity Prediction of Garment Employees

## Source
UCI Machine Learning Repository

https://archive.ics.uci.edu/dataset/597/productivity

## Dataset Information
- Total Records: 1,197
- Total Columns: 15
- File Format: CSV
- Industry: Garment Manufacturing
- Country: Bangladesh
- License: CC BY 4.0

## Dataset Purpose

This dataset contains garment manufacturing production
information. It will be used to investigate employee
productivity, production efficiency and operational
performance.

## Main Variables

| Variable | Description |
|---|---|
| date | Production date |
| quarter | Portion of the month |
| department | Production department |
| day | Day of the week |
| team | Production team number |
| targeted_productivity | Expected productivity |
| smv | Standard Minute Value |
| wip | Work in Progress |
| over_time | Overtime in minutes |
| incentive | Financial incentive in BDT |
| idle_time | Production interruption time |
| idle_men | Number of idle workers |
| no_of_style_change | Number of garment style changes |
| no_of_workers | Number of workers |
| actual_productivity | Actual achieved productivity |

## Target Variable

actual_productivity

This variable represents the actual productivity
achieved by the production team.

## Missing Values

The original dataset contains missing values in
the wip column.

Missing values will be investigated during the
data cleaning phase.

## Data Storage

- raw/: Original downloaded dataset.
- processed/: Cleaned dataset generated during analysis.

## Data Attribution

Dataset provided by the UCI Machine Learning Repository.

DOI: https://doi.org/10.24432/C51S6D

Licensed under Creative Commons Attribution 4.0 (CC BY 4.0).
