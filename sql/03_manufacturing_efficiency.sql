
-- Smart Garment Production Intelligence
-- Phase 7: Manufacturing Efficiency Analysis

-- Query 1: Department Operational Efficiency

SELECT
    department,

    COUNT(*) AS total_records,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_productivity_pct,

    ROUND(
        AVG(over_time), 2
    ) AS avg_overtime_minutes,

    ROUND(
        AVG(no_of_workers), 2
    ) AS avg_workers,

    ROUND(
        AVG(smv), 2
    ) AS avg_smv,

    ROUND(
        AVG(idle_time), 2
    ) AS avg_idle_time_minutes,

    SUM(
        CASE
            WHEN idle_time > 0 THEN 1
            ELSE 0
        END
    ) AS interruption_records

FROM garment_production

GROUP BY department

ORDER BY avg_productivity_pct DESC;


-- Query 2: Production Interruptions vs Productivity

WITH interruption_data AS (
    SELECT
        department,
        actual_productivity,
        idle_time,

        CASE
            WHEN idle_time > 0 THEN 'Interruption'
            ELSE 'No Interruption'
        END AS interruption_status

    FROM garment_production
)

SELECT
    department,
    interruption_status,

    COUNT(*) AS total_records,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_productivity_pct,

    ROUND(
        AVG(idle_time), 2
    ) AS avg_idle_time_minutes

FROM interruption_data

GROUP BY
    department,
    interruption_status

ORDER BY
    department,
    interruption_status;


-- Query 3: Overtime vs Productivity by Department

WITH overtime_groups AS (
    SELECT
        department,
        team,
        over_time,
        no_of_workers,
        actual_productivity,
        targeted_productivity,

        -- Estimated overtime minutes per worker
        CASE
            WHEN no_of_workers > 0
            THEN over_time * 1.0 / no_of_workers
            ELSE NULL
        END AS overtime_per_worker

    FROM garment_production
),

overtime_ranked AS (
    SELECT
        *,

        NTILE(4) OVER (
            PARTITION BY department
            ORDER BY overtime_per_worker
        ) AS overtime_group

    FROM overtime_groups
    WHERE overtime_per_worker IS NOT NULL
)

SELECT
    department,
    overtime_group,

    COUNT(*) AS total_records,

    ROUND(
        AVG(overtime_per_worker), 2
    ) AS avg_overtime_per_worker,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_productivity_pct,

    ROUND(
        AVG(targeted_productivity) * 100, 2
    ) AS avg_target_pct

FROM overtime_ranked

GROUP BY department, overtime_group

ORDER BY department, overtime_group;

