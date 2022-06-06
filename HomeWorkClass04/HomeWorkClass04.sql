--?Declare scalar variable for storing FirstName values
--•Assign value ‘Antonio’ to the FirstName variable
--•Find all Students having FirstName same as the variable

Declare @FirstName nvarchar(100)
Set @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName;

--?Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @StudentTableVariable TABLE(StudentId int, StudentName nvarchar(100), DateOfBirth date);
--•Fill the table variable with all Female students
INSERT INTO @StudentTableVariable
SELECT Id, FirstName + ' ' + LastName as FullName, DateOfBirth
FROM Student
WHERE Gender = 'F';

SELECT * FROM
@StudentTableVariable;

--?Declare temp table that will contain LastName and EnrolledDate columns
DECLARE @StudentTableVariableSecondTask TABLE(LastName nvarchar(100), EnrolledDate date);
--•Fill the temp table with all Male students having First Name starting with ‘A’
INSERT INTO @StudentTableVariableSecondTask
SELECT LastName,EnrolledDate
FROM Student
WHERE Gender = 'M' and FirstName like 'A%';
--•Retrieve the students from the table which last name is with 7 characters
SELECT *
FROM @StudentTableVariableSecondTask
WHERE LEN(LastName) = 7;

--?Find all teachers whose FirstName length is less than 5 and
--•the first 3 characters of their FirstName and LastName are the same

SELECT * FROM
Teacher
WHERE LEN(FirstName) = 7 and SUBSTRING(FirstName, 0,3) = SUBSTRING(LastName,0,3);
