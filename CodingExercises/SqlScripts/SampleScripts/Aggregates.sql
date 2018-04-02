
SELECT e.EmpID, FirstName, LastName, Sum(Amount) As TotalGrantAmount
FROM [Grant] g
	INNER JOIN Employee e ON g.EmpID = e.EmpID
WHERE e.EmpID IS NOT NULL
GROUP BY e.EmpID, e.FirstName, e.LastName
Order by TotalGrantAmount DESC


SELECT count(EmpID) FROM [Grant]
SELECT count(*) FROM [Grant]

SELECT l.City, count(EmpID)
FROM Employee e
 INNER JOIN Location l on l.LocationID = e.LocationID
WHERE l.City <> 'Boston'
Group By City
Having count(EmpID) > 2