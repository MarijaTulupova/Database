DROP FUNCTION get_movies_by_rating(TEXT);

CREATE OR REPLACE FUNCTION get_movies_by_rating(p_rating mpaa_rating)
RETURNS TABLE (
    title VARCHAR,
    rating mpaa_rating
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.title,
        m.rating
    FROM movies m
    WHERE m.rating = p_rating;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_movies_by_rating('PG-13');





DROP FUNCTION get_director_filmography(INTEGER);

CREATE OR REPLACE FUNCTION get_director_filmography(p_director_id INTEGER)
RETURNS TABLE (
    director_name VARCHAR,
    movie_title VARCHAR
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT
        (d.first_name || ' ' || d.last_name)::VARCHAR AS director_name,
        m.title AS movie_title
    FROM movies m
    JOIN directors d ON m.director_id = d.director_id
    WHERE m.director_id = p_director_id;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM get_director_filmography(1);





DROP FUNCTION calculate_actor_age(DATE);

CREATE OR REPLACE FUNCTION calculate_actor_age(p_birth_date DATE)
RETURNS INTEGER AS
$$
BEGIN
    RETURN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', p_birth_date)
           - CASE
                 WHEN EXTRACT(MONTH FROM CURRENT_DATE) < EXTRACT(MONTH FROM p_birth_date)
                      OR (EXTRACT(MONTH FROM CURRENT_DATE) = EXTRACT(MONTH FROM p_birth_date)
                          AND EXTRACT(DAY FROM CURRENT_DATE) < EXTRACT(DAY FROM p_birth_date))
                 THEN 1
                 ELSE 0
             END;
END;
$$
LANGUAGE plpgsql;

SELECT 
    first_name || ' ' || last_name AS actor_name,
    calculate_actor_age(birth_date) AS age
FROM actors
WHERE birth_date IS NOT NULL;





DROP FUNCTION has_won_awards(INTEGER);

CREATE OR REPLACE FUNCTION has_won_awards(p_actor_id INTEGER)
RETURNS BOOLEAN AS
$$
DECLARE
    award_exists BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM actor_awards
        WHERE actor_id = p_actor_id
    ) INTO award_exists;

    RETURN award_exists;
END;
$$
LANGUAGE plpgsql;

SELECT 
    first_name || ' ' || last_name AS actor_name,
    has_won_awards(actor_id) AS has_awards
FROM actors;






















