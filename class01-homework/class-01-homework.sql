CREATE TABLE Student (
id serial PRIMARY KEY,
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
dateOfBirth DATE NOT NULl,
enrolledData DATE NOT NULL,
gender varchar(10) NOT NULL,
nationalIDNumber varchar(40) NOT NULL,
studentCardNumber varchar(40) NOT NULL
);


SELECT * FROM Student;


INSERT INTO Student (firstName, lastName, dateOfBirth, enrolledData, gender, nationalIDNumber, studentCardNumber)
VALUES 
('Histina', 'Bozhinova', '1993-12-11', '2022-09-01', 'female', '123456789', 'STU001'),
('Borsilav', 'Davchev', '1990-01-01', '2021-09-01', 'Male', '54664656789', 'STU002');

UPDATE Student SET lastName = 'Hristova'
WHERE id = 1

DELETE FROM Student 
WHERE id = 2

SELECT * FROM Student

SELECT s.id, s.firstName FROM Student s
WHERE  s.firstName = 'Borsilav' AND s.gender = 'Male'





CREATE TABLE Teacher (
id serial PRIMARY KEY,
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
dateOfBirth DATE NOT NULl,
academicRank varchar(50) NOT NULL,
hireDate DATE NOT NULL
);

SELECT * FROM Teacher;






CREATE TABLE gradeDetails (
id serial PRIMARY KEY,
gradeId integer NOT NULL,
achievementTypeID integer NOT NULL,
achievementPoints decimal(5,2) NOT NULL,
achievementMaxPoints decimal (5,2) NOT NULL,
achievementDate date NOT null
);


SELECT * FROM gradeDetails;




CREATE TABLE Course (
id serial PRIMARY KEY,
name varchar(50) NOT NULL,
credit integer NOT NULL,
academicYear integer NOT NULL,
semester integer NOT NULL
);


SELECT * FROM Course;



CREATE TABLE Grade (
id serial PRIMARY KEY,
studentID integer NOT NULL,
courseID integer NOT NULL,
teacherID integer NOT NULL,
grade decimal(5,2) NOT NULL,
comment varchar(500) NOT NULL,
createdDate date NOT NULL
);

SELECT * FROM Grade;






CREATE TABLE achievementType (
id serial PRIMARY KEY,
name varchar(50) NOT NULL,
description varchar(500) NOT NULL,
participationRate decimal (5,2) NOT NULL
);



SELECT * FROM achievementType;
