CREATE TABLE IF NOT EXISTS teacher (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	academic_rank VARCHAR(50),
	hire_date DATE
);

INSERT INTO teacher VALUES
	(1,'Ivana', 'Trajkovska', '1980-05-12', 'Associate Professor', '2010-09-01'),
	(2,'Nikola', 'Stefanov', '1975-08-23', 'Professor', '2005-09-01'),
	(3,'Marija', 'Koleva', '1985-02-18', 'Assistant Professor', '2015-09-01');

SELECT * FROM teacher