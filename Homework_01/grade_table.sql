CREATE TABLE IF NOT EXISTS grade (
	id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES student(id),
	course_id INTEGER NOT NULL REFERENCES course(id),
	teacher_id INTEGER NOT NULL REFERENCES teacher(id),
	grade INTEGER NOT NULL,
	comment VARCHAR(100),
	created_date DATE
);

INSERT INTO grade VALUES
	(1,1, 1, 1, 9, 'Good performance in class', '2023-06-10'),
	(2,2, 2, 2, 8, 'Needs improvement in problem-solving skills', '2023-06-12'),
	(3,3, 3, 3, 10, 'Excellent understanding of concepts', '2023-06-14');

SELECT * FROM grade