BEGIN;

UPDATE movies
SET budget = 60000000.00
WHERE movie_id = 1;

UPDATE movie_revenues
SET domestic_revenue = 35000000.00,
    international_revenue = 50000000.00
WHERE movie_id = 1;

--ROLLBACK manually, if needed
COMMIT;
