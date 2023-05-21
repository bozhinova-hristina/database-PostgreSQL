SELECT * FROM employee e 

SELECT count(*) AS total FROM employee

SELECT Gender, COUNT(*) as Total FROM Employee
GROUP BY Gender

--Homework requirement 1/3
--• Pre-requisites: database from Homework 1 with some dummy data
--inserted
--• Calculate the count of all grades in the system

SELECT COUNT(*) FROM Grades 


--• Calculate the count of all grades per Teacher in the system


SELECT g.teacherid, COUNT(*) FROM grade g
GROUP BY g.teacherid

--• Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT g.teacherid, COUNT(*) FROM grade g
WHERE g.studentid < 100
GROUP BY g.teacherid


--• Find the Maximal Grade, and the Average Grade per Student on all
--grades in the system

SELECT g.studentid max(g.grade) AS max_grade, avg(g.grade) AS avg_grade FROM grade g
GROUP BY g.studentid





--Homework requirement 2/3
--• Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT g.teacherid, COUNT(*) FROM grade g
GROUP BY g.teacherid
HAVING count(*) > 200

--• Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT g.teacherid, COUNT(*) FROM grade g
WHERE g.studentid < 100
GROUP BY g.teacherid
HAVING count(*) > 50




--• Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT g.studentid count(*), max(g.grade) AS max_grade, avg(g.grade) AS avg_grade FROM grade g
GROUP BY g.studentid
HAVING max(g.grade) = avg(g.grade)


--• List Student First Name and Last Name next to the other details from previous query

SELECT g.studentid, s.firstname, s.lastname, count(*), max(g.grade) AS max_grade, avg(g.grade) AS avg_grade FROM grade g
JOIN student s 
ON s.id = g.studentid
GROUP BY g.studentid
HAVING max(g.grade) = avg(g.grade)


