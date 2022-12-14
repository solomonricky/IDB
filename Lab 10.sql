CREATE DATABASE Lab10

CREATE TABLE Course(
    CourseID nvarchar(50) PRIMARY KEY,
    Name nvarchar(50),
    EntryQualification nvarchar(50),
)

CREATE TABLE Student(
    StudentID nvarchar(50) PRIMARY KEY,
    Name nvarchar(50),
    Gender nvarchar(50),
    DOB	date,
    CourseID nvarchar(50) FOREIGN KEY REFERENCES Course(CourseID),
)

CREATE TABLE Subject(
    SubjectID nvarchar(50) PRIMARY KEY,
    Name nvarchar(50),
    CourseID nvarchar(50) FOREIGN KEY REFERENCES Course(CourseID),
)

INSERT INTO Course
(CourseID, Name, EntryQualification)
VALUES
('C01', 'Diploma', '3 credits in O Level'),
('C02', 'Degree', '3 credits in A Level'),
('C03', 'Master', 'Degree in any computing field'),
('C04', 'Foundation', '5 credits in O Level')

INSERT INTO Student
(StudentID, Name, Gender, DOB, CourseID)
VALUES
('ST01', 'Helen', 'Female', '1999-02-02', 'C01'),
('ST02', 'Karen', 'Female', '2000-09-15', 'C02'),
('ST03', 'Peter', 'Male', '1977-04-28', 'C02'),
('ST04', 'Shaun', 'Male', '2001-06-30', 'C03')

INSERT INTO Subject
(SubjectID, Name, CourseID)
VALUES
('SU01', 'SAD', 'C01'),
('SU02', 'IDB', 'C01'),
('SU03', 'ISWE', 'C02'),
('SU04', 'CPP', 'C02'),
('SU05', 'Java', 'C03'),
('SU06', 'NNT', 'C04'),
('SU07', 'DAS', 'C04')

-- Question 1(a)
SELECT * FROM Student WHERE Gender = 'Female' AND CourseID = (SELECT CourseID FROM Course WHERE Name = 'Degree') ORDER BY Name DESC

-- Question 1(b)
SELECT * FROM Student INNER JOIN Course ON Student.CourseID = Course.CourseID WHERE Student.Gender = 'Female' AND Course.Name = 'Degree' ORDER BY Name DESC

-- Question 2(a)
SELECT * FROM Subject WHERE CourseID = (SELECT CourseID FROM Course WHERE EntryQualification = '5 credits in O Level') ORDER BY Name ASC

-- Question 2(b)
SELECT * FROM Subject INNER JOIN Course ON Subject.CourseID = Course.CourseID WHERE Course.EntryQualification = '5 credits in O Level' ORDER BY Subject.Name ASC

-- Question 3(a)
SELECT * FROM Subject WHERE CourseID IN (SELECT CourseID FROM Course WHERE Name = 'Degree' OR NAME = 'Master')

-- Question 3(b)
SELECT * FROM Subject INNER JOIN Course ON Subject.CourseID = Course.CourseID WHERE Course.Name = 'Degree' OR Course.Name = 'Master'

-- Question 4
-- Calculate the total number of subjects for each course. (*Hint: use Count & Group by)
SELECT COUNT(*) FROM Subject WHERE CourseID = (SELECT CourseID FROM Course) GROUP BY CourseID
-- Answer
SELECT CourseID, COUNT(SubjectID) AS TotalNumOFSubject FROM Subject GROUP BY CourseID
SELECT Course.Name, COUNT(SubjectID) FROM Subject INNER JOIN Course ON Subject.CourseID = Course.CourseID GROUP BY Course.Name

-- Question 5s
-- Calculate the total number of students for each course. (*Hint: use Count & Group by)
SELECT COUNT(CourseID) FROM Student WHERE CourseID = (SELECT CourseID FROM Course)
-- Answer
SELECT Course.Name, COUNT(StudentID) AS TotalNumOfStudent FROM Student JOIN Course ON Course.CourseID = Student.CourseID GROUP BY Course.Name

-- Question 6
-- Show a list of students whose age is more than the average age of all students.
SELECT * FROM Student WHERE DATEDIFF(YEAR, DOB, GETDATE()) > (SELECT AVE(DATEDIFF(YEAR, DOB, GETDATE())) FROM Student)

-- Question 7
-- List all students in descending order of age.
SELECT * FROM Student ORDER BY DATEDIFF(YEAR, DOB, GETDATE()) DESC

-- Question 8
-- Show a list of course which has more than 1 student. (*Hint: use Count & Group by & Having)
SELECT Student.CourseID, COUNT(Student.StudentID) FROM Student INNER JOIN Course ON Student.CourseID = Course.CourseID GROUP BY Student.StudentID HAVING COUNT(Student.CourseID) > 1

-- Question 9
-- Show a list of course which has exactly 1 subject. (*Hint: use Count & Group by & Having)
SELECT Subject.CourseID, COUNT(Subject.SubjectID) FROM Subject INNER JOIN Course ON Subject.CourseID = Course.CourseID GROUP BY Subject.Name HAVING COUNT(Subject.SubjectID) = 1 
