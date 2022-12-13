CREATE DATABASE Lab4

CREATE TABLE Publisher(
PublisherID nvarchar(50) NOT NULL PRIMARY KEY,
Name nvarchar(50),
Address nvarchar(50)
)

CREATE TABLE Book(
BookID nvarchar(50) NOT NULL PRIMARY KEY,
Name nvarchar(50),
Author nvarchar(50),
Price decimal(10,2),
PublishedDate date,
PublishedID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID)
)

INSERT INTO Publisher (PublisherID, Name, Address)
VALUES
('P01', 'Pearson', 'Bukit Jalil'),
('P02', 'Deitel', 'Puchong'),
('P03', 'Rainbow', 'Subang'),
('P04', 'Machill', 'Kuala Lumpur')

INSERT INTO Book (BookID, Name, Author, Price, PublishedDate, PublishedID)
VALUES
('B01', 'Maths', 'J.Wenton', 50.60, '10 Jan 2016', 'P01'),
('B02', 'Science', 'S.Hanson', 100, '10 Jan 2016', 'P01'),
('B03', 'English', 'K.Vince', 89.30, '10 Jan 2016', 'P02'),
('B04', 'Biology', 'K.Vince', 150.80, '10 Jan 2016', 'P03'),
('B05', 'Computing', 'J.Denzin', NULL, NULL, NULL)

SELECT * FROM Book
JOIN Publisher ON Book.PublishedID = Publisher.PublisherID

SELECT * FROM Publisher

SELECT * FROM Book

SELECT * FROM Publisher
SELECT Name, Author FROM BOOK

SELECT * FROM Book WHERE Author = 'K.Vince'
SELECT * FROM Book WHERE PublishedID = 'P01'
SELECT * FROM Book WHERE Price > 100
SELECT * FROM Book WHERE Price <= 100

SELECT * FROM Book WHERE Price BETWEEN 100 and 200
SELECT * FROM Book WHERE Price NOT BETWEEN 100 and 200

SELECT * FROM Book WHERE Author = 'S.Hanson' and Price = 100
SELECT * FROM Book WHERE Author = 'J.Wenton' and Price = 30
SELECT * FROM Book WHERE Author = 'K.Vince' and Price BETWEEN 50 and 100
SELECT * FROM Book WHERE Author = 'K.Vince' and Price NOT BETWEEN 50 and 100

SELECT * FROM Publisher ORDER BY Name
SELECT * FROM Book ORDER BY Name DESC
SELECT * FROM Book WHERE Author = 'K.Vince' ORDER BY Name DESC
SELECT * FROM Book WHERE Author != 'J.Wenton' and Price > 30 ORDER BY Price DESC
SELECT * FROM Book WHERE Name != 'Science' ORDER BY Name ASC, Price DESC
SELECT * FROM Book WHERE PublishedID != 'P01' ORDER BY Price DESC
SELECT * FROM Book WHERE Author != 'S.Hanson' or Price NOT BETWEEN 90 and 160 ORDER BY Price

