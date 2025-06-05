SELECT * 
FROM netflix;

SELECT type, COUNT(*) AS total_count
FROM netflix
GROUP BY type;

SELECT TOP 10 country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC;

SELECT rating, COUNT(*) AS count_rating
FROM netflix
WHERE type = 'Movie'
GROUP BY rating
ORDER BY count_rating DESC;

SELECT TOP 5 director, COUNT(*) AS total_directed
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_directed DESC;

SELECT YEAR(CAST(date_added AS DATE)) AS year_added, COUNT(*) AS total_titles
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY YEAR(CAST(date_added AS DATE))
ORDER BY year_added;

SELECT title, date_added
FROM netflix
WHERE YEAR(CAST(date_added AS DATE)) = 2024;

SELECT AVG(CAST(REPLACE(duration, ' min', '') AS INT)) AS avg_duration_minutes
FROM netflix
WHERE type = 'Movie' AND duration LIKE '%min%';

SELECT release_year, 
       AVG(CAST(REPLACE(duration, ' min', '') AS INT)) AS avg_duration
FROM netflix
WHERE type = 'Movie' AND duration LIKE '%min%'
GROUP BY release_year
ORDER BY release_year;

SELECT value AS genre, COUNT(*) AS total
FROM (
    SELECT TRIM(value) AS value
    FROM netflix
    CROSS APPLY STRING_SPLIT(listed_in, ',')
) AS genres
GROUP BY value
ORDER BY total DESC;

SELECT 
  SUM(CASE WHEN show_id IS NULL THEN 1 ELSE 0 END) AS missing_show_id,
  SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS missing_type,
  SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS missing_title,
  SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN cast IS NULL THEN 1 ELSE 0 END) AS missing_cast,
  SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS missing_date_added,
  SUM(CASE WHEN release_year IS NULL THEN 1 ELSE 0 END) AS missing_release_year,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
  SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS missing_duration,
  SUM(CASE WHEN listed_in IS NULL THEN 1 ELSE 0 END) AS missing_listed_in,
  SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS missing_description
FROM netflix;

UPDATE netflix
SET director = 'Unknown'
WHERE director IS NULL;

UPDATE netflix
SET cast = 'Not listed'
WHERE cast IS NULL;

UPDATE netflix
SET country = 'Unknown'
WHERE country IS NULL;

UPDATE netflix
SET rating = 'Unrated'
WHERE rating IS NULL;

DELETE FROM netflix
WHERE duration IS NULL;

SELECT 
  SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN cast IS NULL THEN 1 ELSE 0 END) AS missing_cast,
  SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS missing_date_added,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating,
  SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS missing_duration
FROM netflix;

SELECT TOP 10 title, director, cast, country, date_added, rating, duration
FROM netflix;

SELECT DISTINCT duration
FROM netflix
WHERE duration IS NOT NULL;

SELECT 
    title,
    duration,
    TRY_CAST(LEFT(duration, CHARINDEX(' ', duration + ' ') - 1) AS INT) AS duration_minutes
FROM netflix
WHERE type = 'Movie' AND duration IS NOT NULL;

SELECT 
    listed_in,
    COUNT(*) AS total_titles
FROM netflix
GROUP BY listed_in
ORDER BY total_titles DESC;

SELECT 
    type, 
    COUNT(*) AS total_count
FROM 
    netflix
GROUP BY 
    type;

	SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT rating, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie' AND rating IS NOT NULL
GROUP BY rating
ORDER BY total_movies DESC;

SELECT director, COUNT(*) AS total_titles
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT 
    YEAR(CAST(date_added AS DATE)) AS year_added,
    COUNT(*) AS total_titles
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY YEAR(CAST(date_added AS DATE))
ORDER BY year_added;

SELECT 
    AVG(CAST(REPLACE(duration, ' min', '') AS INT)) AS avg_movie_duration
FROM netflix
WHERE type = 'Movie' AND duration LIKE '%min%';

SELECT title, date_added
FROM netflix
WHERE YEAR(CONVERT(DATE, date_added)) = 2020;


































