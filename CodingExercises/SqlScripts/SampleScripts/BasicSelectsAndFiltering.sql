USE Northwind
GO

SELECT *
FROM [Customers]


SELECT *
FROM Customers
WHERE Country = 'USA'

SELECT *
FROM Customers
WHERE Country != 'USA'

SELECT *
FROM Customers 
WHERE Country = 'USA' and Region = 'OR'

SELECT *
FROM Customers
WHERE Country = 'USA' OR Country = 'UK'

SELECT *
FROM Customers
WHERE Country IN ('USA', 'UK')

SELECT *
FROM Customers
WHERE Country NOT IN ('USA', 'UK')

-- Single line comment

/*
This is 
a 
paragraph
comment
*/

