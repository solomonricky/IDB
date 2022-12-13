CREATE DATABASE Lab5

CREATE TABLE Publisher(
PublisherID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
Address nvarchar(50),
)

CREATE TABLE Book(
BookID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
Author nvarchar(50),
Price decimal(10,2),
PublishedDate date,
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
)

INSERT INTO Publisher
(PublisherID, Name, Address)
VALUES
('P01', 'Pearson', 'Bukit Jalil'),
('P02', 'Deitel', 'Puchong'),
('P03', 'Rainbow', 'Subang'),
('P04', 'MacHill', 'Kuala Lumpur')

INSERT INTO Book
(BookID, Name, Author, Price, PublishedDate, PublisherID)
VALUES
('B01', 'Maths', 'J.Wenton', 50.60, '2016-01-10', 'P01'),
('B02', 'Science', 'S.Hanson', 100.00, '2016-02-12', 'P01'),
('B03', 'English', 'K.Vince', 89.30, '2016-03-09', 'P02'),
('B04', 'Biology', 'K.Vince', 150.80, '2016-04-24', 'P03'),
('B05', 'Computing', 'J.Denzin', NULL, NULL, NULL)

SELECT * FROM Publisher WHERE Name LIKE 'r%'
SELECT * FROM Publisher WHERE Name LIKE '%n'
SELECT * FROM Book WHERE Name LIKE '_a%'
SELECT * FROM Book WHERE Name LIKE 'b_%'
SELECT * FROM Book WHERE Name LIKE 'b%' AND LEN(Name) > 2
SELECT * FROM Book WHERE Name LIKE '%i%'
SELECT * FROM Book WHERE Name LIKE 'e%h'

SELECT * FROM Book WHERE Author LIKE '%n%' ORDER BY Author ASC, Price DESC
SELECT * FROM Book WHERE Author LIKE '%__e' ORDER BY Name DESC

SELECT * FROM Publisher WHERE Address IN ('Puchong', 'Subang')
SELECT * FROM Book WHERE Price IN (50, 100)
SELECT * FROM Book WHERE CAST(Price AS int) IN (50, 100)
SELECT * FROM Book WHERE Name IN ('Maths', 'Science', 'English') ORDER BY Price ASC

UPDATE Publisher SET Address = 'Serdang' WHERE Name = 'Pearson'
UPDATE Book SET Price = '99.30' WHERE Name = 'English' AND Author = 'K.Vince'
UPDATE Book SET PublishedDate = '2017-09-03' WHERE Name = 'Science' AND Author = 'S.Hanson'
UPDATE Book SET Price = '98', PublishedDate = '2019-04-29' WHERE Name = 'English'

ALTER TABLE Book ALTER COLUMN Name varchar(50)
ALTER TABLE Publisher ADD Telephone INT
EXEC sp_rename 'Publisher.Telephone', 'ContactNum'
ALTER TABLE Publisher DROP COLUMN ContactNum

DELETE FROM Book WHERE Author = 'K.Vince' AND Name = 'Biology'
DELETE FROM Book WHERE Author = 'J.Wenton' AND Name = 'Maths'

CREATE TABLE Customer (
ID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
)
DROP TABLE Customer

CREATE DATABASE MyDatabase
DROP DATABASE MyDatabase

SELECT * FROM Publisher
SELECT * FROM Book