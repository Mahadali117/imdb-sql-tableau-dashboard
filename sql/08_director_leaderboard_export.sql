-- Produces top_directors.csv for directors with at least three films.
-- Deduplicates director-movie pairs before calculating rating summaries.

WITH unique_directors AS (
    SELECT DISTINCT
        person_id,
        movie_id
    FROM directors
)
SELECT
    p.person_id AS director_id,
    p.name AS director,
    COUNT(*) AS film_count,
    ROUND(AVG(r.imdb_score)::NUMERIC, 2) AS avg_score,
    MAX(r.imdb_score) AS highest_score,
    MIN(r.imdb_score) AS lowest_score,
    MIN(m.year) AS first_film_year,
    MAX(m.year) AS latest_film_year
FROM unique_directors d
JOIN people p
    ON d.person_id = p.person_id
JOIN movies m
    ON d.movie_id = m.movie_id
JOIN ratings r
    ON m.movie_id = r.movie_id
GROUP BY p.person_id, p.name
HAVING COUNT(*) >= 3
ORDER BY avg_score DESC, film_count DESC, director;
