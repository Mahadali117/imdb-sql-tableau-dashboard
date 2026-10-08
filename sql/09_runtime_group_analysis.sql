-- Compares film counts and average IMDb ratings across runtime groups.
-- Produces runtime_analysis.csv to check the Tableau runtime chart.

WITH film_runtime AS (
    SELECT
        m.movie_id,
        m.runtime_min,
        r.imdb_score,
        CASE
            WHEN m.runtime_min IS NULL THEN 'Unknown'
            WHEN m.runtime_min <= 0 THEN 'Invalid'
            WHEN m.runtime_min < 90 THEN 'Under 90 min'
            WHEN m.runtime_min < 120 THEN '90-119 min'
            WHEN m.runtime_min < 150 THEN '120-149 min'
            ELSE '150+ min'
        END AS runtime_group
    FROM movies m
    JOIN ratings r
        ON m.movie_id = r.movie_id
)
SELECT
    runtime_group,
    COUNT(*) AS film_count,
    ROUND(AVG(imdb_score)::NUMERIC, 2) AS avg_score,
    MIN(runtime_min) AS min_runtime,
    MAX(runtime_min) AS max_runtime
FROM film_runtime
GROUP BY runtime_group
ORDER BY
    CASE runtime_group
        WHEN 'Under 90 min' THEN 1
        WHEN '90-119 min' THEN 2
        WHEN '120-149 min' THEN 3
        WHEN '150+ min' THEN 4
        WHEN 'Unknown' THEN 5
        ELSE 6
    END;
