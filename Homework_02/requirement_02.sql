SELECT 
    m.title AS movie_title, 
    d.first_name || ' ' || d.last_name AS director_name
FROM movies m
JOIN directors d ON m.director_id = d.director_id;

SELECT 
    a.first_name || ' ' || a.last_name AS actors,
    m.title AS movie_title,
    cm.character_name
FROM 
    cast_members cm
JOIN actors a ON cm.actor_id = a.actor_id
JOIN movies m ON cm.movie_id = m.movie_id


SELECT 
	m.title AS movie_title,
	STRING_AGG(g.name, ', ') AS genre
FROM 
	movie_genres mg
JOIN movies m ON mg.movie_id = m.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY m.title

SELECT 
	u.username AS user,
	r.review_text AS review
FROM users u
JOIN reviews r ON r.user_id = u.user_id

SELECT 
	m.title AS movie,
	ml.specific_location AS location
FROM movie_locations ml
JOIN movies m ON ml.movie_id = m.movie_id

SELECT 
	m.title AS movie,
	pc.name AS production_company
FROM movie_production_companies mps
JOIN movies m ON mps.movie_id = m.movie_id
JOIN production_companies pc ON mps.company_id = pc.company_id

SELECT
	a.first_name || ' ' || a.last_name AS actor_name,
	aw.name AS award
FROM actor_awards aa
JOIN actors a ON aa.actor_id = a.actor_id
JOIN awards aw ON aa.award_id = aw.award_id

SELECT
	m.title AS movie,
	a.name AS award
FROM movie_awards ma
JOIN movies m ON ma.movie_id = m.movie_id
JOIN awards a ON ma.award_id = a.award_id

SELECT 
	u.username AS user,
	STRING_AGG(m.title, ', ' ) AS movie
FROM user_watchlist uw
JOIN users u ON uw.user_id = u.user_id
JOIN movies m ON uw.movie_id = m.movie_id
GROUP BY u.username

SELECT 
	m.title AS movie,
	mr.domestic_revenue AS domestic_revenue,
	mr.international_revenue AS international_revenue,
	(mr.domestic_revenue + mr.international_revenue) AS total_revenue
FROM movies m
JOIN movie_revenues mr ON mr.movie_id = m.movie_id






























