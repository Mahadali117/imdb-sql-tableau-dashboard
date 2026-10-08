-- Produces top_actors.csv for actors appearing in at least four films.
-- Deduplicates actor-movie pairs before calculating counts and average ratings.

WITH unique_cast AS (
    SELECT DISTINCT
        person_id,
        movie_id
    FROM cast_members
)
SELECT
    p.person_id AS actor_id,
    p.name AS actor,
    COUNT(*) AS film_count,
    ROUND(AVG(r.imdb_score)::NUMERIC, 2) AS avg_score,
    MIN(m.year) AS first_film_year,
    MAX(m.year) AS latest_film_year
FROM unique_cast c
JOIN people p
    ON c.person_id = p.person_id
JOIN movies m
    ON c.movie_id = m.movie_id
JOIN ratings r
    ON m.movie_id = r.movie_id
GROUP BY p.person_id, p.name
HAVING COUNT(*) >= 4
ORDER BY film_count DESC, avg_score DESC, actor;
