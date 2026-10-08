# IMDb Movie Explorer | SQL & Tableau

An analysis of 250 top-rated IMDb films using SQL and Tableau. This project explores ratings, voting activity, genres, release decades, runtimes, and recurring actors and directors.


## Project Questions

- Which decades contain the most films in this dataset?
- How do average ratings vary across genres and runtime groups?
- How does voting activity relate to IMDb ratings?
- Which actors appear most frequently?
- Which directors have the highest average ratings?

## Tools Used

- SQL — data validation, joins, grouping, subqueries, and derived fields
- QueryCase — SQL sandbox and source dataset
- Tableau Public — data modeling and dashboard visualization
- GitHub — project documentation and SQL storage

## Process

1. Checked movie IDs, missing values, runtimes, and movie-to-rating matches.
2. Joined movie details with ratings and voting counts.
3. Created decade and runtime classifications.
4. Prepared film, genre, actor, and director datasets for Tableau.
5. Related films and genres using movie IDs, keeping actor and director summaries as separate data sources.
6. Built a dashboard with summary metrics and six charts.

## Dashboard Features

- Movie count, average rating, average runtime, and total votes
- Films by decade
- IMDb rating versus vote count
- Average rating by genre
- Average rating by runtime group
- Recurring actors with at least six films in the dataset
- Five highest-rated directors from those with at least three films

## Key Findings

- The dataset contains 250 films with an average IMDb rating of 8.34.
- The 2010s contain the most films: 52, followed by the 2000s with 44.
- Films lasting 150 minutes or more have the highest average rating among the runtime groups, at 8.42.
- Robert De Niro appears in nine films, the most among qualifying actors.
- Peter Jackson has the highest average rating among directors with at least three films, at 8.90.

## Repository Contents

- `sql/` — validation, preparation, and analysis queries
- Tableau packaged workbook (`.twbx`) — dashboard and included data extracts

## Limitations

- This is a selected sample of top-rated films, so findings do not represent all IMDb movies.
- Movies can belong to multiple genres, so genre counts overlap.
- Vote counts measure IMDb voting activity rather than revenue or total viewership.
- Ratings and votes reflect the supplied dataset snapshot.
- Differences in average ratings do not establish that runtime, genre, actors, or directors cause higher ratings.
- Actor and director summaries describe the full dataset.

## Source and Acknowledgment

Dataset: QueryCase IMDb Ratings sandbox.

Inspired by QueryCase’s tutorial, “Build an IMDb Movie Dashboard with SQL and Tableau,” and extended with data validation, decade and runtime analysis, director comparisons, and additional dashboard charts.

## Author

Mahad Ali
