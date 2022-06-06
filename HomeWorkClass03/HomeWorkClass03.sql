
--Calculate the count of all grades per Teacher in the system

SELECT TeacherID, Teacher.FirstName, COUNT(Grade) as TotalGrades
FROM Grade
INNER JOIN Teacher on TeacherID = Teacher.Id
GROUP BY TeacherID, Teacher.FirstName;

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT TeacherID, Teacher.FirstName,StudentID, COUNT(Grade) as TotalGrades
FROM Grade
INNER JOIN Teacher on TeacherID = Teacher.Id
Where StudentID < 100
GROUP BY TeacherID, Teacher.FirstName, StudentID;

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT Student.Id, Student.FirstName + ' ' + Student.LastName as FullName, MAX(Grade) as Maximum, AVG(Grade) as Average
FROM Grade
INNER JOIN Student on StudentID = Student.Id
GROUP BY Student.Id, Student.FirstName,Student.LastName;

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT TeacherID, Teacher.FirstName, COUNT(Grade) as TotalGrades
FROM Grade
INNER JOIN Teacher on TeacherID = Teacher.Id
GROUP BY TeacherID, Teacher.FirstName
HAVING COUNT(Grade) > 200;

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade
SELECT Student.Id, Student.FirstName + ' ' + Student.LastName as FullName, COUNT(Grade) as TotalCount, MAX(Grade) as Maximum, AVG(Grade) as Average
FROM Grade
INNER JOIN Student on StudentID = Student.Id
GROUP BY Student.Id, Student.FirstName,Student.LastName
HAVING MAX(Grade) = AVG(Grade);

--List Student First Name and Last Name next to the other details from previous query
			--- I WAS AHEAD OF TIME ON THIS ONE :)


--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
GO;
CREATE VIEW vw_StudentGrades AS (

	SELECT StudentID, COUNT(Grade) as TotalCountOfGradesPerStudent
	FROM Grade
	GROUP BY StudentID
);
GO;

SELECT * FROM vw_StudentGrades;

--Change the view to show Student First and Last Names instead of StudentID
GO;
ALTER VIEW vw_StudentGrades AS(
	SELECT Student.FirstName, Student.LastName, COUNT(Grade) as TotalGradesPerStudent
	FROM Grade
	INNER JOIN Student on StudentID = Student.Id
	GROUP BY Student.FirstName,Student.LastName

);
GO;

SELECT * FROM vw_StudentGrades;

--List all rows from view ordered by biggest Grade Count

GO;
ALTER VIEW vw_StudentGrades AS(
	SELECT TOP 1000 Student.FirstName, Student.LastName, COUNT(Grade) as TotalGradesPerStudent
	FROM Grade
	INNER JOIN Student on StudentID = Student.Id
	GROUP BY Student.FirstName,Student.LastName
	ORDER BY COUNT(Grade) DESC

);
GO;

SELECT * FROM vw_StudentGrades;