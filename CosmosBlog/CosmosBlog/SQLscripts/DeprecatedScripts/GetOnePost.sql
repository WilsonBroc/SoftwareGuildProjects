USE Cosmos
GO

CREATE PROCEDURE GetOnePost
(
	@ID [int]
)AS
SELECT *
FROM Post as p
WHERE p.PostID = @ID