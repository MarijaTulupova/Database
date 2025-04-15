SELECT 
    g.name AS genre,
    COUNT(m.movie_id) AS r_rated_movie_count
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
WHERE m.rating = 'R'
GROUP BY g.genre_id, g.name
HAVING 
    COUNT(m.movie_id) > 3;

SELECT 
	d.first_name || ' ' || d.last_name AS director_name,
	SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue,
	COUNT(m.movie_id) AS movie_count
FROM directors d
JOIN movies m ON m.director_id = d.director_id
JOIN movie_revenues mr ON mr.movie_id = m.movie_id
GROUP BY d.director_id, d.first_name, d.last_name
HAVING
	SUM(mr.domestic_revenue + mr.international_revenue) > 500000000 AND
	COUNT (m.movie_id) >= 2;

SELECT 
    a.first_name || ' ' || a.last_name AS actor_name,
    COUNT(DISTINCT g.genre_id) AS genre_count,
    COUNT(DISTINCT aw.award_id) AS award_count
FROM actors a
JOIN cast_members cm ON a.actor_id = cm.actor_id
JOIN movies m ON cm.movie_id = m.movie_id
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
JOIN actor_awards aa ON a.actor_id = aa.actor_id
JOIN awards aw ON aa.award_id = aw.award_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING 
    COUNT(DISTINCT g.genre_id) > 2 AND
    COUNT(DISTINCT aw.award_id) >= 1;

SELECT 
	m.title AS movie,
	COUNT(r.review_id) AS review_count,
	AVG(r.rating) AS average_rating
FROM movies m 
JOIN reviews r ON r.movie_id = m.movie_id
GROUP BY m.title
HAVING
	COUNT(r.review_id) > 3 AND
	AVG(r.rating) > 7;

SELECT
    pc.name AS production_company,
    SUM(mpc.investment_amount) AS total_investment
FROM movies m
JOIN movie_production_companies mpc ON m.movie_id = mpc.movie_id
JOIN production_companies pc ON mpc.company_id = pc.company_id
WHERE EXTRACT(YEAR FROM m.release_date) > 2015
GROUP BY pc.name
HAVING SUM(mpc.investment_amount) > 100000000;

SELECT 
    ml.country AS country,
    COUNT(DISTINCT m.movie_id) AS movie_count,
    SUM(m.budget) AS total_budget
FROM movie_locations ml
JOIN movies m ON ml.movie_id = m.movie_id
GROUP BY ml.country
HAVING 
    COUNT(DISTINCT m.movie_id) > 2 AND
    SUM(m.budget) > 150000000;

SELECT
	g.name,
	TRUNC(AVG(m.duration_minutes), 1) AS avg_duration_per_genre,
	a.award_type
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN movie_awards ma ON m.movie_id = ma.movie_id
JOIN awards a ON ma.award_id = a.award_id
WHERE a.award_type = 'Oscar'
GROUP BY g.name, a.award_type
HAVING 
	AVG(m.duration_minutes) > 120;

SELECT 
    EXTRACT(YEAR FROM m.release_date) AS released_year,
    COUNT(m.movie_id) AS movie_count,
    AVG(m.budget) AS avg_budget
FROM movies m
GROUP BY EXTRACT(YEAR FROM m.release_date)
HAVING 
    COUNT(m.movie_id) > 3 AND
    AVG(m.budget) > 50000000;

SELECT 
    a.first_name || ' ' || a.last_name AS actor,
    COUNT(m.movie_id) AS movie_count,
    SUM(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM actors a
JOIN cast_members cm ON cm.actor_id = a.actor_id
JOIN movies m ON cm.movie_id = m.movie_id
JOIN movie_revenues mr ON mr.movie_id = m.movie_id
WHERE cm.is_lead_role = true
GROUP BY a.first_name, a.last_name
HAVING 
    COUNT(m.movie_id) > 2 AND
    SUM(mr.domestic_revenue + mr.international_revenue) > 200000000;















