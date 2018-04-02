USE Cosmos
GO

CREATE PROCEDURE DeleteUser
(
	@ID [int]
)
AS
DELETE FROM [User]
WHERE [User].UserID = @ID