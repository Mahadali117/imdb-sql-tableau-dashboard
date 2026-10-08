-- Produces film_genres.csv with one row per movie-genre combination.
-- Connects to films.csv through movie_id in Tableau.

SELECT DISTINCT
    m.movie_id,
    m.title,
    m.year,
    m.year - (m.year % 10) AS decade,
    g.genre_id,
    g.name AS genre,
    r.imdb_score,
    r.vote_count
FROM movies m
JOIN ratings r
    ON m.movie_id = r.movie_id
JOIN movie_genres mg
    ON m.movie_id = mg.movie_id
JOIN genres g
    ON mg.genre_id = g.genre_id
ORDER BY m.title, m.movie_id, g.name;
