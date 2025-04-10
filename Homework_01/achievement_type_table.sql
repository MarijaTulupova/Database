CREATE TABLE IF NOT EXISTS achievement_type(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(100),
	participation_rate DECIMAL(5,2)
);

INSERT INTO achievement_type VALUES
	(1,'Excellent Performance', 'Awarded for achieving outstanding results in exams and projects', 95.00),
	(2,'Good Participation', 'Awarded for consistent participation in class activities', 85.00),
	(3,'Perfect Attendance', 'Awarded for perfect attendance throughout the semester', 100.00);

SELECT * FROM achievement_type