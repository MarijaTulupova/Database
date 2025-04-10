CREATE TABLE IF NOT EXISTS grade_details (
	id SERIAL PRIMARY KEY,
	grade_id INTEGER NOT NULL REFERENCES grade(id) ,
	achievement_type_id INTEGER NOT NULL REFERENCES achievement_type(id),
	achievement_points INTEGER NOT NULL,
	achievement_max_points INTEGER,
	achievement_date DATE
);

INSERT INTO grade_details VALUES
	(1,1, 1, 18, 20, '2023-06-05'),
	(2,2, 2, 15, 15, '2023-06-08'),
	(3,3, 1, 20, 20, '2023-06-10');

SELECT * FROM grade_details