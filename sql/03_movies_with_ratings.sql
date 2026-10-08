-- Joins movie details with IMDb ratings and vote counts.
-- Sorts films by rating, then by vote count.

SELECT
    m.movie_id,
    m.title,
    m.year,
    m.runtime_min,
    r.imdb_score,
    r.vote_count
FROM movies m
JOIN ratings r
    ON m.movie_id = r.movie_id
ORDER BY r.imdb_score DESC, r.vote_count DESC;
