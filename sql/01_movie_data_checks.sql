SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT movie_id) AS unique_movie_ids,
    COUNT(*) - COUNT(movie_id) AS missing_movie_ids,
    COUNT(movie_id) - COUNT(DISTINCT movie_id) AS duplicate_movie_ids,
    COUNT(*) - COUNT(title) AS missing_titles,
    COUNT(*) - COUNT(year) AS missing_years,
    COUNT(*) - COUNT(runtime_min) AS missing_runtimes,
    COUNT(CASE WHEN runtime_min <= 0 THEN 1 END) AS invalid_runtimes
FROM movies;
