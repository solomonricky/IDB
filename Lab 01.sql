CREATE DATABASE Lab1

CREATE Table Student(
StudentID nvarchar(50),
Name nvarchar(50),
Gender nvarchar(50),
DOB date,
Address nvarchar(50),
)

INSERT INTO Student
(StudentID, Name, Gender, DOB, Address)
VALUES
('S01', 'Ali', 'Male', '2 Feb 1996', 'Kuala Lumpur'),
('S02', 'Nancy', 'Female', '16 May 1997', 'Bukit Jalil'),
('S03', 'Melvin', 'Male', '20 Nov 1998', NULL),
('S04', 'Angeline', 'Female', '30 Dec 1995', 'Sri Petaling')

SELECT * from Student