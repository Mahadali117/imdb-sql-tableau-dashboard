-- Produces films.csv with one row per movie.
-- Includes ratings, runtime categories, directors, lead actor, and genre count.

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
    r.vote_count,
    (
        SELECT STRING_AGG(DISTINCT p.name, ', ' ORDER BY p.name)
        FROM directors d
        JOIN people p
            ON d.person_id = p.person_id
        WHERE d.movie_id = m.movie_id
    ) AS director,
    (
        SELECT p.name
        FROM cast_members c
        JOIN people p
            ON c.person_id = p.person_id
        WHERE c.movie_id = m.movie_id
        ORDER BY c.billing_order NULLS LAST, c.person_id
        LIMIT 1
    ) AS lead_actor,
    (
        SELECT COUNT(DISTINCT mg.genre_id)
        FROM movie_genres mg
        WHERE mg.movie_id = m.movie_id
    ) AS num_genres
FROM movies m
JOIN ratings r
    ON m.movie_id = r.movie_id
ORDER BY r.imdb_score DESC, r.vote_count DESC, m.movie_id;
