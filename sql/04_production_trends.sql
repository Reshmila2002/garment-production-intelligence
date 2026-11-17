
-- Phase 7: Production Trends Analysis
-- Query 1: Validate production dates

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT date) AS unique_dates,
    MIN(date) AS first_date_text,
    MAX(date) AS last_date_text
FROM garment_production;

-- Query 2: Inspect sample date values

SELECT DISTINCT
    date
FROM garment_production
ORDER BY date
LIMIT 15;

-- Query 3: Check SQLite date conversion

SELECT
    date AS original_date,
    DATE(date) AS converted_date
FROM garment_production
LIMIT 10;


-- Query 4: Daily Production Productivity Trends

SELECT
    date AS production_date,

    COUNT(*) AS total_records,

    ROUND(
        AVG(targeted_productivity) * 100, 2
    ) AS avg_target_pct,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_actual_pct,

    ROUND(
        AVG(actual_productivity - targeted_productivity) * 100, 2
    ) AS productivity_gap_pp,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN actual_productivity >= targeted_productivity
                THEN 1
                ELSE 0
            END
        ) / COUNT(*), 2
    ) AS target_achievement_rate

FROM garment_production

GROUP BY date

ORDER BY date;


-- Query 5: Monthly Production Productivity Trends

SELECT
    strftime('%Y-%m', date) AS production_month,

    COUNT(*) AS total_records,

    COUNT(DISTINCT date) AS observed_days,

    ROUND(
        AVG(targeted_productivity) * 100, 2
    ) AS avg_target_pct,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_actual_pct,

    ROUND(
        AVG(actual_productivity - targeted_productivity) * 100, 2
    ) AS productivity_gap_pp,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN actual_productivity >= targeted_productivity
                THEN 1
                ELSE 0
            END
        ) / COUNT(*), 2
    ) AS target_achievement_rate

FROM garment_production

GROUP BY strftime('%Y-%m', date)

ORDER BY production_month;


-- Query 6: Monthly Department Productivity Analysis

SELECT
    strftime('%Y-%m', date) AS production_month,
    department,

    COUNT(*) AS total_records,

    COUNT(DISTINCT date) AS observed_days,

    ROUND(
        AVG(targeted_productivity) * 100, 2
    ) AS avg_target_pct,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_actual_pct,

    ROUND(
        AVG(
            actual_productivity - targeted_productivity
        ) * 100, 2
    ) AS productivity_gap_pp,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN actual_productivity >= targeted_productivity
                THEN 1
                ELSE 0
            END
        ) / COUNT(*), 2
    ) AS target_achievement_rate

FROM garment_production

GROUP BY
    strftime('%Y-%m', date),
    department

ORDER BY
    production_month,
    department;


-- Query 7: January vs February Department Comparison

WITH monthly_performance AS (
    SELECT
        department,
        strftime('%Y-%m', date) AS month,
        AVG(actual_productivity) * 100
            AS avg_productivity
    FROM garment_production
    WHERE strftime('%Y-%m', date)
        IN ('2015-01', '2015-02')
    GROUP BY department, strftime('%Y-%m', date)
)

SELECT
    department,

    ROUND(
        MAX(CASE WHEN month = '2015-01'
            THEN avg_productivity END), 2
    ) AS january_pct,

    ROUND(
        MAX(CASE WHEN month = '2015-02'
            THEN avg_productivity END), 2
    ) AS february_pct,

    ROUND(
        MAX(CASE WHEN month = '2015-02'
            THEN avg_productivity END)
        -
        MAX(CASE WHEN month = '2015-01'
            THEN avg_productivity END), 2
    ) AS change_pp

FROM monthly_performance
GROUP BY department
ORDER BY change_pp ASC;

