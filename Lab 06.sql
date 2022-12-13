-- Comments

-- Create Database
-- Syntax CREATE DATABASE $NAME
CREATE DATABASE Lab6

-- Create Table
-- Select the following database first
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

-- Question 4
SELECT TOP(2) * FROM Publisher

-- Question 5
SELECT TOP(3) * FROM Book WHERE Price < 130

-- Question 6
SELECT MIN(Price) AS LowestPrice FROM Book

-- Question 7
-- First query (But this is fix value that we retrived from Question 6)
SELECT * FROM Book WHERE Price = 50.60
-- Second query (Combine Question 6's query into 'Price' query)
-- Only Name and Price (Rename as LowestPrice) will be printed out
SELECT Name, Price AS LowestPrice FROM Book WHERE Price = (SELECT MIN(Price) FROM Book)

-- Question 8
-- It will show 'Biology'. Use MIN function in STRING it will be based on the first alphabet

-- Question 9
SELECT MAX(Price) AS HighestPrice FROM Book

-- Question 10
SELECT Name, Price AS HighestPrice FROM Book WHERE Price = (SELECT MAX(Price) FROM Book)

-- Question 11
-- It will show 'Science'. Use MIN function in STRING it will be based on the first alphabet

-- Question 12
SELECT SUM(Price) AS TotalPrice FROM Book 

-- Question 13
SELECT AVG(Price) AS AveragePrice FROM Book

-- Question 14
SELECT Name, Price FROM Book WHERE Price > (SELECT AVG(Price) FROM Book)

-- Question 15
SELECT COUNT(*) AS TotalBooks FROM Book

-- Question 16
SELECT COUNT(*) FROM Book WHERE Author = 'K.Vince'

-- Question 17
SELECT COUNT(*) AS BooksCostMoreThanRM60 FROM Book WHERE Price > 60

-- Question 18
SELECT COUNT(*) AS BooksCostMoreThanAverage FROM Book WHERE Price > (SELECT AVG(Price) FROM Book)

-- Question 19
SELECT Author, COUNT(*) AS TotalBooksByAuthor FROM Book GROUP BY Author

-- Question 20
SELECT PublisherID, COUNT(*) AS TotalBooksByPublisher FROM Book WHERE PublisherID IS NOT NULL GROUP BY PublisherID

-- Question 21
SELECT SUM(Price) AS BookPriceByAuthor FROM Book GROUP BY Author 

-- Question 22
SELECT SUM(Price) AS BookPriceByPublisher FROM Book WHERE PublisherID IS NOT NULL GROUP BY PublisherID

-- Question 23
UPDATE Book SET Price = Price + 10 WHERE Name = 'Maths'

-- Question 24
UPDATE Book SET Price = Price - 20 WHERE Name = 'Biology'

-- Question 25
UPDATE Book SET Price = (Price + (Price * 10/100)) WHERE Name = 'English'

-- Question 26
UPDATE Book SET Price = (Price / 2) WHERE Name = 'Science'

SELECT * FROM Publisher
SELECT * FROM Book