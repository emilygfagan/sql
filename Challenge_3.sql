-- create tables teachers and students

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT NOT NULL,
	department VARCHAR(50) NOT NULL,
	email VARCHAR(200) NOT NULL,
	phone TEXT NOT NULL
);

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT NOT NULL,
	phone TEXT NOT NULL UNIQUE, 
	email VARCHAR(200) NOT NULL UNIQUE,
	graduation_year SMALLINT NOT NULL
);

INSERT INTO students (
	first_name, last_name, homeroom_number,
	phone, email, graduation_year)
VALUES ('Mark', 'Watney',
	   5, '777-555-1234', 'N/A', 2035);
	   
SELECT * FROM students;

INSERT INTO teachers(
	first_name, last_name, homeroom_number, 
	department, email, phone)
VALUES ('Jonas', 'Salk', 5, 'Biology',
	   'jsalk@school.org', '777-555-4321');
	   
SELECT * FROM teachers;