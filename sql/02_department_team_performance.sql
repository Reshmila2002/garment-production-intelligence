
-- Garment Production Intelligence
-- Phase 7: Department and Team Performance

-- Query 1: Department Productivity Performance

SELECT
    department,

    COUNT(*) AS total_records,

    ROUND(
        AVG(targeted_productivity) * 100, 2
    ) AS avg_target_percentage,

    ROUND(
        AVG(actual_productivity) * 100, 2
    ) AS avg_actual_percentage,

    ROUND(
        AVG(
            actual_productivity - targeted_productivity
        ) * 100, 2
    ) AS productivity_gap_pp,

    SUM(
        CASE
            WHEN actual_productivity >= targeted_productivity
            THEN 1
            ELSE 0
        END
    ) AS achieved_records,

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

GROUP BY department

ORDER BY avg_actual_percentage DESC;



-- Query 2: Rank production teams by target achievement

WITH team_performance AS (
    SELECT
        department,
        team,

        COUNT(*) AS total_records,

        ROUND(
            AVG(targeted_productivity) * 100, 2
        ) AS avg_target_percentage,

        ROUND(
            AVG(actual_productivity) * 100, 2
        ) AS avg_actual_percentage,

        SUM(
            CASE
                WHEN actual_productivity >= targeted_productivity
                THEN 1
                ELSE 0
            END
        ) AS achieved_records,

        ROUND(
            100.0 * SUM(
                CASE
                    WHEN actual_productivity >= targeted_productivity
                    THEN 1
                    ELSE 0
                END
            ) / COUNT(*), 2
        ) AS achievement_rate

    FROM garment_production

    GROUP BY department, team
),

team_ranking AS (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY department
            ORDER BY achievement_rate DESC
        ) AS department_rank

    FROM team_performance
)

SELECT
    department,
    team,
    total_records,
    avg_target_percentage,
    avg_actual_percentage,
    achieved_records,
    achievement_rate,
    department_rank

FROM team_ranking

ORDER BY department, department_rank, team;


-- Query 3: Identify the five lowest-achieving teams

WITH team_performance AS (
    SELECT
        department,
        team,

        COUNT(*) AS total_records,

        ROUND(
            AVG(targeted_productivity) * 100, 2
        ) AS avg_target_percentage,

        ROUND(
            AVG(actual_productivity) * 100, 2
        ) AS avg_actual_percentage,

        SUM(
            CASE
                WHEN actual_productivity >= targeted_productivity
                THEN 1 ELSE 0
            END
        ) AS achieved_records,

        ROUND(
            100.0 * SUM(
                CASE
                    WHEN actual_productivity >= targeted_productivity
                    THEN 1 ELSE 0
                END
            ) / COUNT(*), 2
        ) AS achievement_rate

    FROM garment_production

    GROUP BY department, team
)

SELECT
    department,
    team,
    total_records,
    avg_target_percentage,
    avg_actual_percentage,
    achieved_records,
    achievement_rate,

    ROUND(
        avg_actual_percentage - avg_target_percentage,
        2
    ) AS productivity_gap_pp

FROM team_performance

ORDER BY achievement_rate ASC, department, team

LIMIT 5;
