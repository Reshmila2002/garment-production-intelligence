
# Production Trends Analysis — SQL Findings

## 1. Business Objective

Analyse historical garment manufacturing
productivity trends using SQL.

The analysis examines monthly productivity,
target achievement rates and department-level
performance changes.

## 2. Dataset

- Total production observations: 1,197
- Analysis period: January–March 2015
- Departments: Sewing and Finishing

## 3. Monthly Productivity Performance

| KPI | January | February | March |
|---|---:|---:|---:|
| Observations | 542 | 443 | 212 |
| Observed days | 26 | 23 | 10 |
| Avg. target productivity | 73.35% | 72.97% | 71.96% |
| Avg. actual productivity | 75.54% | 71.79% | 71.90% |
| Productivity gap (pp) | +2.19 | -1.18 | -0.06 |
| Target achievement rate | 78.04% | 66.14% | 75.00% |

## 4. January vs February Department Comparison

| Department | January | February | Change (pp) |
|---|---:|---:|---:|
| Finishing | 78.20% | 73.21% | -5.00 |
| Sewing | 73.50% | 70.88% | -2.62 |

## 5. Key Findings

1. January recorded the highest average productivity
   and target achievement rate.

2. February recorded the lowest monthly target
   achievement rate at 66.14%.

3. Both sewing and finishing recorded lower average
   productivity in February than January.

4. Finishing experienced a larger decline in
   average productivity than sewing.

5. March contains fewer observed production days,
   so monthly comparisons require caution.

## 6. Business Recommendations

- Monitor productivity changes across months.
- Compare trends separately by department.
- Investigate February's lower target achievement rate.
- Examine operational factors such as SMV,
  workforce size, overtime and style changes.
- Use daily and monthly KPIs in management dashboards.

## 7. Limitations

The dataset contains historical garment manufacturing
observations from Bangladesh.

Monthly observations and production days differ.

The analysis is descriptive and does not identify
the causes of productivity changes.

The results do not represent actual records from
a Sri Lankan garment factory.
