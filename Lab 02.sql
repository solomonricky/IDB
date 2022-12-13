CREATE DATABASE Fruit

CREATE TABLE Fruit(
FruitID nvarchar(50) NOT NULL PRIMARY KEY,
Fruit nvarchar(50),
Price decimal(18,2),
)

CREATE TABLE OrderTable(
OrderID nvarchar(50) NOT NULL PRIMARY KEY,
CustomerName nvarchar(50),
Quantity int,
FruitID nvarchar(50) FOREIGN KEY REFERENCES Fruit(FruitID),
)

INSERT INTO Fruit(FruitID, Fruit, Price)
VALUES
('F01', 'Apple', 1.50),
('F02', 'Orange', 1.50),
('F03', 'Banana', 4.50),
('F04', 'Kiwi', 4.00)

SELECT * FROM Fruit

INSERT INTO OrderTable(OrderID, CustomerName, Quantity, FruitID)
VALUES
('O01', 'James', 10, 'F02'),
('O02', 'William', 15, 'F02'),
('O03', 'Ben', 3, 'F03'),
('O04', 'Ali', 5, 'F04')

SELECT * FROM OrderTable
JOIN Fruit ON OrderTable.FruitID = Fruit.FruitID

SELECT OrderID, CustomerName, Quantity, Fruit, Price FROM OrderTable
JOIN Fruit ON OrderTable.FruitID = Fruit.FruitID

CREATE DATABASE Lab2

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

DROP TABLE Publisher