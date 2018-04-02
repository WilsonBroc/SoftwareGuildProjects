USE Cosmos
GO

CREATE PROCEDURE GetOneTag
(
	@ID [int]
)
AS
SELECT *
FROM Tags AS t
WHERE t.TagID = @ID