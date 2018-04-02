SELECT *
From Customers 
WHERE CompanyName LIKE 'A%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%Z%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '_A%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '[ABD]%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '[A-K]%'

select * from customers
where companyname like 'A[^N]%'

select *
from Customers
where CompanyName like 'a[^n-z]%'