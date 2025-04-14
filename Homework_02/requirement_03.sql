SELECT 
    m.title AS movie,
	m.rating AS rating,
    d.first_name || ' ' || d.last_name AS director
FROM movies m
JOIN directors d ON m.director_id = d.director_id
WHERE m.rating = 'R';

SELECT
	m.title AS movie,
	m.release_date AS release_date,
	STRING_AGG(g.name, ', ') AS genres
FROM movie_genres mg
JOIN movies m ON mg.movie_id = m.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE EXTRACT(YEAR FROM m.release_date) = 2019
GROUP BY m.movie_id, m.title, m.release_date;

SELECT 
	a.first_name || ' ' || a.last_name AS actor,
	a.nationality AS nationality,
	STRING_AGG(m.title, ', ') AS movies
FROM cast_members cm
JOIN actors a ON cm.actor_id = a.actor_id
JOIN movies m ON cm.movie_id = m.movie_id
WHERE a.nationality = 'American'
GROUP BY a.actor_id, a.first_name, a.last_name, a.nationality

SELECT 
	m.title AS movies,
	m.budget AS budget,
	pc.name AS production_company
FROM movie_production_companies mps
JOIN movies m ON mps.movie_id = m.movie_id
JOIN production_companies pc ON mps.company_id = pc.company_id
WHERE m.budget > 100000000

SELECT 
    m.title AS movie,
	ml.city AS city_location,
    d.first_name || ' ' || d.last_name AS director
FROM movie_locations ml
JOIN movies m ON ml.movie_id = m.movie_id
JOIN directors d ON m.director_id = d.director_id
WHERE ml.city = 'London';
 
SELECT 
    m.title AS movie,
	g.name AS genre,
    STRING_AGG(a.first_name || ' ' || a.last_name, ', ') AS actors
FROM movie_genres mg
JOIN genres g ON mg.genre_id = g.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN cast_members cm ON m.movie_id = cm.movie_id
JOIN actors a ON cm.actor_id = a.actor_id
WHERE g.name = 'Horror'
GROUP BY m.title, g.name;

SELECT 
	m.title AS movie,
	r.rating AS rating,
	u.username AS reviewer
FROM reviews r
JOIN movies m ON r.movie_id = m.movie_id
JOIN users u ON r.user_id = u.user_id
WHERE r.rating = 5

SELECT 
	d.first_name || ' ' || d.last_name AS director,
	d.nationality AS nationality,
	m.title AS movie
FROM movies m
JOIN directors d ON m.director_id = d.director_id
WHERE d.nationality = 'British'
	
SELECT 
	m.title AS movie,
	m.duration_minutes AS duration,
	STRING_AGG(g.name, ', ') AS genres
FROM movie_genres mg
JOIN movies m ON mg.movie_id = m.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE m.duration_minutes > 180
GROUP BY m.movie_id, m.title, m.duration_minutes

SELECT 
	m.title AS movie,
	a.award_type AS award,
	d.first_name || ' ' || d.last_name AS director
FROM movie_awards ma
JOIN movies m ON ma.movie_id = m.movie_id
JOIN awards a ON ma.award_id = a.award_id
JOIN directors d ON m.director_id = d.director_id
WHERE a.award_type = 'Oscar'





























