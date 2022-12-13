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


SELECT * FROM Course
SELECT * FROM Student
SELECT * FROM Subject