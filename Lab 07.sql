CREATE DATABASE Lab7

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
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Deitel')
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Deitel'

-- Question 5
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson') ORDER BY Name DESC
SELECT * FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' ORDER BY Book.Name DESC

-- Question 6
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson') AND Author = 'S.Hanson'
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.Author = 'S.Hanson'

-- Question 7
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson') AND Price > 80
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.Price > 80

-- Question 8
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson') AND Price BETWEEN 30 AND 70 AND Author = 'J.Wenton'
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.Price BETWEEN 30 AND 70 AND Book.Author = 'J.Wenton'

-- Question 9
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Deitel') AND PublishedDate > '1/3/2016'
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Deitel' AND Book.PublishedDate > '1/3/2016'

-- Question 10
SELECT COUNT(*) AS NumOfBook FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Deitel') 
SELECT COUNT(*) AS NumOfBook FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Deitel'

-- Question 11
SELECT SUM(Price) AS TotalPrice FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson')
SELECT SUM(Book.Price) AS TotalPrice FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson'

-- Question 12
SELECT AVG(Price) AS AvgPrice FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson')
SELECT AVG(Book.Price) AS AvgPrice FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson'

-- Question 13
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Address = 'Bukit Jalil') ORDER BY Name ASC
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Address = 'Bukit Jalil' ORDER BY Book.Name ASC

-- Question 14
SELECT COUNT(*) AS PublisherLocatedAtPuchong FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Address = 'Puchong')
SELECT COUNT(*) AS PublisherLocatedAtPuchong FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Address = 'Puchong'

-- Question 15
SELECT * FROM Book WHERE PublisherID = (SELECT PublisherID FROM Publisher WHERE Name = 'Pearson') AND PublishedDate > '1/31/2016'
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Publisher.Name = 'Pearson' AND Book.PublishedDate > '1/31/2016'

-- Question 16
-- Use 'in' instead of '=' when have multiple value
SELECT * FROM Publisher WHERE PublisherID IN (SELECT PublisherID FROM Book WHERE Author = 'K.Vince')
SELECT * FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Author = 'K.Vince'

-- Question 17
UPDATE Publisher SET Address = 'Shah Alam' WHERE PublisherID = (SELECT PublisherID FROM Book WHERE Name = 'Biology')
UPDATE Publisher SET Address = 'Shah Alam' FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE Book.Name = 'Biology'

-- Question 18
SELECT * FROM Publisher WHERE PublisherID NOT IN (SELECT PublisherID FROM Book WHERE PublisherID IS NOT NULL)
SELECT * FROM Publisher LEFT JOIN Book ON Publisher.PublisherID = Book.PublisherID WHERE BookID IS NULL

-- Question 19
SELECT * FROM Publisher WHERE PublisherID IN (SELECT PublisherID FROM Book WHERE PublisherID IS NOT NULL GROUP BY PublisherID HAVING COUNT(*) > 1)
SELECT COUNT(*), Publisher.PublisherID, Publisher.Name FROM Publisher INNER JOIN Book ON Publisher.PublisherID = Book.PublisherID GROUP BY Publisher.PublisherID, Publisher.Name HAVING COUNT(*) > 1

SELECT * FROM Book
SELECT * FROM Publisher