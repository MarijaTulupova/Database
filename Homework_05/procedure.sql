CREATE OR REPLACE PROCEDURE add_movie_with_genre(
    p_title VARCHAR, 
    p_release_date DATE, 
    p_duration_minutes INTEGER, 
    p_rating mpaa_rating, 
    p_director_id INTEGER, 
    p_plot_summary TEXT, 
    p_language VARCHAR, 
    p_budget DECIMAL(15,2), 
    p_genre_name VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_movie_id INTEGER;
    v_genre_id INTEGER;
BEGIN
    INSERT INTO movies (title, release_date, duration_minutes, rating, director_id, plot_summary, language, budget)
    VALUES (p_title, p_release_date, p_duration_minutes, p_rating, p_director_id, p_plot_summary, p_language, p_budget)
    RETURNING movie_id INTO v_movie_id;

    SELECT genre_id INTO v_genre_id
    FROM genres
    WHERE name = p_genre_name;

    IF NOT FOUND THEN
        INSERT INTO genres (name)
        VALUES (p_genre_name)
        RETURNING genre_id INTO v_genre_id;
    END IF;

    INSERT INTO movie_genres (movie_id, genre_id)
    VALUES (v_movie_id, v_genre_id);

    COMMIT;
END;
$$;


CALL add_movie_with_genre(
    'The Shawshank Redemption', 
    '1994-09-23', 
    142, 
    'R', 
    1,
    'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 
    'English', 
    25000000.00, 
    'Drama'
);


SELECT * FROM movies
WHERE title = 'The Shawshank Redemption';

