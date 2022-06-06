--Find all Students  with FirstName = Antonio
SELECT * FROM
Student
WHERE FirstName = 'Antonio';

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM 
Student
WHERE DateOfBirth > '1999-01-01';

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *  FROM
Student
WHERE EnrolledDate between '1998-01-01' and '1998-02-01' and LastName like 'D%'

--List all Students ordered  by FirstName
SELECT * FROM	
Student
ORDER  BY FirstName;

--List all Teacher  Last Names and Student Last Names in single result set. Remove  duplicates
SELECT Teacher.LastName  FROM	
Teacher
UNION
SELECT Student.LastName  FROM
Student;

--Create  Foreign key constraints  from diagram or with script

ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT FK_Grade_CourseID
FOREIGN KEY (CourseID)
REFERENCES Course(Id);

ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT FK_Grade_StudentID
FOREIGN KEY (StudentID)
REFERENCES Student(Id);

ALTER TABLE Grade WITH NOCHECK
ADD CONSTRAINT FK_Grade_TeacherID
FOREIGN KEY (TeacherID)
REFERENCES Teacher(Id);

--List all possible combinations  of Courses  names and AchievementType names that can be passed  by student
SELECT C.Name, A.Name FROM Course AS C
CROSS JOIN AchievementType AS A

--List all Teachers  without exam Grade
SELECT * FROM Teacher AS T
LEFT JOIN Grade AS G
ON T.Id = G.Grade
WHERE G.Id IS NULL
