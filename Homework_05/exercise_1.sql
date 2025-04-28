BEGIN;

INSERT INTO movies (title, release_date, duration_minutes, rating, director_id, plot_summary, language, budget)
VALUES ('New Movie Title', '2025-12-15', 120, 'PG-13', 1, 'An exciting plot summary.', 'English', 50000000.00)
RETURNING movie_id;

INSERT INTO movie_revenues (movie_id, domestic_revenue, international_revenue)
VALUES (CURRVAL(pg_get_serial_sequence('movies', 'movie_id')), 30000000.00, 45000000.00);

--ROLLBACK manually, if needed
COMMIT;
