DROP FUNCTION IF EXISTS get_movie_details(integer);


CREATE OR REPLACE FUNCTION get_movie_details(movie_id INTEGER)
RETURNS TABLE (
    title VARCHAR,
    release_date DATE,
    duration_minutes INTEGER,
    rating mpaa_rating,
    director_id INTEGER,
    plot_summary TEXT,
    language VARCHAR,
    budget DECIMAL(15,2),
    created_at TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY
    SELECT m.title, m.release_date, m.duration_minutes, m.rating, m.director_id, m.plot_summary, m.language, m.budget, m.created_at
    FROM movies m
    WHERE m.movie_id = get_movie_details.movie_id;
END;
$$ LANGUAGE plpgsql;



SELECT * FROM get_movie_details(1);

