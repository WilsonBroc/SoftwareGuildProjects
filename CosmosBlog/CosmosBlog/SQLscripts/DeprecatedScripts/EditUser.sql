USE Cosmos	
GO

CREATE PROCEDURE EditUser
(
	@ID [int],
	@UserName [varchar](50)
)AS
UPDATE [User]
SET UserName = @UserName
WHERE [user].UserID = @ID