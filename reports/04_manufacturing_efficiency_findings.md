
# Manufacturing Efficiency Analysis — SQL Findings

## 1. Business Objective

Investigate operational efficiency in garment
manufacturing using SQL.

The analysis examines:
- Department productivity
- Workforce size
- Standard Minute Value (SMV)
- Production interruptions
- Overtime and productivity

## 2. Dataset

- Total observations: 1,197
- Sewing observations: 691
- Finishing observations: 506

## 3. Department Operational Performance

| KPI | Finishing | Sewing |
|---|---:|---:|
| Average productivity | 75.30% | 72.20% |
| Average workers | 10.25 | 52.45 |
| Average SMV | 3.89 | 23.25 |
| Average idle time | 0.00 | 1.26 |
| Interruption records | 0 | 18 |

## 4. Production Interruptions

Sewing observations with recorded interruptions
had an average productivity of 49.18%.

Sewing observations without recorded interruptions
had an average productivity of 72.82%.

The difference was 23.64 percentage points.

These results are descriptive and do not prove
that interruptions caused the productivity difference.

## 5. Overtime Analysis

Average sewing productivity by estimated
overtime-per-worker quartile:

| Overtime group | Records | Avg. productivity |
|---|---:|---:|
| 1 | 173 | 72.49% |
| 2 | 173 | 72.89% |
| 3 | 173 | 69.93% |
| 4 | 172 | 73.50% |

The relationship between overtime and productivity
was not consistently increasing across groups.

The overtime-per-worker measure is calculated by
dividing recorded team overtime by workforce size.
It does not represent verified individual overtime.

## 6. Business Recommendations

1. Monitor production interruptions and investigate
   their possible operational causes.
2. Compare workforce requirements across departments.
3. Evaluate overtime alongside productivity and
   other production factors.
4. Monitor SMV when comparing team performance.
5. Avoid assuming that additional overtime
   automatically increases productivity.

## 7. Limitations

The dataset contains historical observations
from garment manufacturing in Bangladesh.

The analysis is observational and does not
establish causal relationships.

Production teams may have different workloads,
targets, and operating conditions.

Overtime quartiles are descriptive comparisons,
not evidence of an optimal overtime level.
