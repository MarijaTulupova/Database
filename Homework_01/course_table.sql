CREATE TABLE IF NOT EXISTS course (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	credit INTEGER NOT NULL,
	academic_year VARCHAR(10),
	semester VARCHAR(20)
);

INSERT INTO course VALUES 
	(1,'Introduction to Programming', 6, '2023-2024', 'Fall'),
	(2,'Data Structures and Algorithms', 5, '2023-2024', 'Spring'),
	(3,'Database Management Systems', 6, '2023-2024', 'Fall');

SELECT * FROM course