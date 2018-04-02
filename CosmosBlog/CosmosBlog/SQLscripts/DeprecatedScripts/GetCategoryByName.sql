USE Cosmos
GO

CREATE PROCEDURE GetCategoryByName
(
	@CategoryName [varchar](50)
)AS
SELECT *
FROM Category as c
WHERE c.CategoryName = @CategoryName