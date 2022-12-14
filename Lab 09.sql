CREATE DATABASE Lab9

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

-- Question 5
-- DATEDIFF (Interval [YEAR/MONTH/DAY], CURRENTDATE ,GETDATE())
SELECT StudentID, Name, DATEDIFF(YEAR, Student.DOB, GETDATE()) AS Age FROM Student 

-- Question 6
SELECT *, DATEDIFF(YEAR, Student.DOB, GETDATE()) AS Age FROM Student WHERE DATEDIFF(YEAR, Student.DOB, GETDATE()) > 18

-- Add 'Age' column that auto update data
ALTER TABLE Student ADD Age AS (DATEDIFF(YEAR, Student.DOB, GETDATE()))

-- Question 7
SELECT * FROM COURSE INNER JOIN Student ON COURSE.CourseID = Student.CourseID INNER JOIN Subject ON Course.CourseID = Subject.CourseID

-- Question 8
SELECT * FROM Course, Subject WHERE Course.CourseID = Subject.CourseID

-- Question 9
SELECT * FROM Course, Student, Subject WHERE Course.CourseID = Subject.CourseID AND Course.CourseID = Student.CourseID

-- Question 10
SELECT * FROM Course LEFT JOIN Student ON Course.CourseID = Student.CourseID ORDER BY Course.Name 

-- Question 11
SELECT * FROM Course RIGHT JOIN Student ON Course.CourseID = Student.CourseID ORDER BY Student.Name

SELECT * FROM Course
SELECT * FROM Student
SELECT * FROM Subject
