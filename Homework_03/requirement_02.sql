CREATE VIEW top_rated_movies AS
SELECT 
    m.title AS movie_title,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(r.review_id) AS review_count,
    d.first_name || ' ' || d.last_name AS director_name
FROM movies m
JOIN reviews r ON r.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
GROUP BY m.movie_id, m.title, d.first_name, d.last_name
ORDER BY average_rating DESC;

SELECT * FROM top_rated_movies;

CREATE VIEW movie_financial_performance AS
SELECT 
	m.title AS movie_title,
	m.budget AS movie_budget,
	SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue,
	(SUM(mr.domestic_revenue + mr.international_revenue) - m.budget) AS profit,
	(SUM(mr.domestic_revenue + mr.international_revenue) - m.budget) / m.budget * 100 AS roi
FROM movies m
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY m.title, m.budget;

SELECT * FROM movie_financial_performance;

CREATE VIEW actor_filmography AS
SELECT
	a.first_name || ' ' || a.last_name AS actor_name,
	COUNT(DISTINCT m.movie_id) AS movie_count,
	STRING_AGG(DISTINCT g.name, ', ') AS genre_list,
	SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM actors a
JOIN cast_members cm ON cm.actor_id = a.actor_id
JOIN movies m ON cm.movie_id = m.movie_id
JOIN movie_revenues mr ON mr.movie_id = m.movie_id
JOIN movie_genres mg ON mg.movie_id = m.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY a.first_name, a.last_name;

SELECT * FROM actor_filmography;

CREATE VIEW genre_statistics AS
SELECT
	g.name AS genre_name,
	COUNT(DISTINCT m.movie_id) AS movie_count,
	ROUND(AVG(r.rating), 2) AS average_rating,
	SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM genres g
JOIN movie_genres mg ON mg.genre_id = g.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN movie_revenues mr ON mr.movie_id = m.movie_id
JOIN reviews r ON r.movie_id = m.movie_id
GROUP BY g.name;

SELECT * FROM genre_statistics;

CREATE VIEW production_company_performance AS
SELECT 
	pc.name AS company_name,
	COUNT(DISTINCT m.movie_id) AS movie_count,
	SUM(mpc.investment_amount) AS total_investment,
	SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM production_companies pc
JOIN movie_production_companies mpc ON mpc.company_id = pc.company_id
JOIN movies m ON mpc.movie_id = m.movie_id
JOIN movie_revenues mr ON m.movie_id = mr.movie_id
GROUP BY pc.name;

SELECT * FROM production_company_performance;



















