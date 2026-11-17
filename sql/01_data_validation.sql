
-- Garment Production Intelligence
-- Phase 7: SQL Data Validation

-- Query 1: Count total production records

SELECT COUNT(*) AS total_records
FROM garment_production;


-- Query 2: Check department distribution

SELECT
    department,
    COUNT(*) AS total_records
FROM garment_production
GROUP BY department
ORDER BY department;


-- Query 3: Calculate average productivity

SELECT
    ROUND(AVG(actual_productivity) * 100, 2)
        AS avg_productivity_percentage
FROM garment_production;


-- Query 4: Compare productivity by department

SELECT
    department,
    COUNT(*) AS total_records,
    ROUND(AVG(targeted_productivity) * 100, 2)
        AS avg_target_percentage,
    ROUND(AVG(actual_productivity) * 100, 2)
        AS avg_actual_percentage
FROM garment_production
GROUP BY department
ORDER BY department;
