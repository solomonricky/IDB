CREATE DATABASE Lab8

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

-- Question 04
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID

-- Question 05
SELECT * FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID ORDER BY Publisher.Name

-- Question 06
SELECT * FROM Publisher RIGHT JOIN Book ON Publisher.PublisherID = Book.PublisherID ORDER BY Book.Name

-- Question 07
SELECT * FROM Publisher FULL OUTER JOIN Book ON Publisher.PublisherID = Book.PublisherID

-- Question 08
SELECT PublisherID, Name FROM Publisher UNION SELECT BookID, Name FROM Book

-- Question 09
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Deitel'

-- Question 10
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.Author = 'S.Hanson'

-- Question 11
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.Author = 'J.Wenton' AND Price BETWEEN 30 AND 70

-- Question 12
SELECT * FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Address = 'Bukit Jalil' 

-- Question 13
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Book.PublishedDate BETWEEN '1/1/2016' AND '3/1/2016'

-- Question 14
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Book.Author != 'K.Vince'

-- Question 15
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Book.PublishedDate > '1/1/2016'

SELECT * FROM Book
SELECT * FROM Publisher