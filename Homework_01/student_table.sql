CREATE TABLE IF NOT EXISTS student (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	enrolled_date DATE,
	gender VARCHAR(10),
	national_id_number VARCHAR(20) UNIQUE NOT NULL,
	student_card_number VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO student VALUES
	(1,'Anna', 'Petrovska', '2002-04-15', '2021-09-01', 'Female', 'MK123456789', 'SC10001'),
	(2,'Marko', 'Jovanov', '2001-11-30', '2020-09-01', 'Male', 'MK987654321', 'SC10002'),
	(3,'Elena', 'Stojanova', '2003-06-22', '2022-09-01', 'Female', 'MK456789123', 'SC10003');

SELECT * FROM student
