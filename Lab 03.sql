CREATE DATABASE Lab3

Create TABLE Supplier(
SupplierID nvarchar(50) NOT NULL PRIMARY KEY,
Name nvarchar(50),
Address nvarchar(50),
)

CREATE TABLE Product(
ProductID nvarchar(50) NOT NULL PRIMARY KEY,
Name nvarchar(50),
Price_RM decimal(10,2),
QuantityInStock int,
)

CREATE TABLE Supplies(
SuppliesID nvarchar(50),
SupplierID nvarchar(50) FOREIGN KEY REFERENCES Supplier(SupplierID),
ProductID nvarchar(50) FOREIGN KEY REFERENCES Product(ProductID),
SuppliedDate date,
QuantitySupplied int,
)

INSERT INTO Supplier
(SupplierID, Name, Address)
VALUES
('S01', 'ABC Company', 'Penang'),
('S02', 'XYZ Company', 'Johor'),
('S03', 'HJK Company', 'Selangor'),
('S04', 'PQR Company', 'Selangor')

INSERT INTO Product
(ProductID, Name, Price_RM, QuantityInStock)
VALUES
('P01', 'Keyboard', 103.55, 60),
('P02', 'Mouse', 30.90, 70),
('P03', 'Monitor', 200, 80),
('P04', 'Pendrive', 40.30, 90)

INSERT INTO Supplies
(SuppliesID, SupplierID, ProductID, SuppliedDate, QuantitySupplied)
VALUES
('001', 'S01', 'P01', '20170111', 100),
('002', 'S01', 'P02', '20170222', 200),
('003', 'S01', 'P03', NULL, 300),
('004', 'S02', 'P03', '20170430', 400)

SELECT * FROM Product
SELECT * FROM Supplier
SELECT * FROM Supplies