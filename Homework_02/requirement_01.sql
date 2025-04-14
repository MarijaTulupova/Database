SELECT title, release_date
FROM movies
WHERE EXTRACT(YEAR FROM release_date) = 2019;

SELECT first_name, last_name, nationality
FROM actors
WHERE nationality = 'British';

SELECT title, rating
FROM movies
WHERE rating= 'PG-13'

SELECT first_name, last_name, nationality
FROM directors
WHERE nationality = 'American'

SELECT title, duration_minutes
FROM movies
WHERE duration_minutes > 150

SELECT first_name, last_name
FROM actors
WHERE last_name = 'Pitt'

SELECT title, budget
FROM movies
WHERE budget > 100000000

SELECT *
FROM reviews
WHERE rating = 5

SELECT title, language
FROM movies
WHERE language = 'English'

SELECT name, headquarters
FROM production_companies
WHERE headquarters LIKE '%California%';

























