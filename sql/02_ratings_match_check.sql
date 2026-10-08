-- Finds movies with no matching rating or more than one rating row.
-- Expected result: zero rows.

SELECT
    m.movie_id,
    m.title,
    COUNT(r.movie_id) AS rating_rows
FROM movies m
LEFT JOIN ratings r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(r.movie_id) <> 1
ORDER BY m.movie_id;
