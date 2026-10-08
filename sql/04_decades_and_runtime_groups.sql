-- Creates decade and runtime categories for dashboard comparisons.
-- Labels missing and invalid runtimes separately.

SELECT
    m.movie_id,
    m.title,
    m.year,
    m.year - (m.year % 10) AS decade,
    m.runtime_min,
    CASE
        WHEN m.runtime_min IS NULL THEN 'Unknown'
        WHEN m.runtime_min <= 0 THEN 'Invalid'
        WHEN m.runtime_min < 90 THEN 'Under 90 min'
        WHEN m.runtime_min < 120 THEN '90-119 min'
        WHEN m.runtime_min < 150 THEN '120-149 min'
        ELSE '150+ min'
    END AS runtime_group,
    r.imdb_score,
    r.vote_count
FROM movies m
JOIN ratings r
    ON m.movie_id = r.movie_id
ORDER BY r.imdb_score DESC, r.vote_count DESC;
