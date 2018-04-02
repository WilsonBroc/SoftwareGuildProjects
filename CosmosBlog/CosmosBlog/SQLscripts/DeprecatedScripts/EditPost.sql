USE Cosmos
GO

CREATE PROCEDURE EditPost
(
	@ID [int],
	@Title [varchar](50),
	@Content [varchar](MAX),
	@UserID [int],
	@CategoryID [int],
	@StatusID [int],
	@DateCreated [date],
	@DateExpired [date],
	@Critique [varchar](MAX),
	@Image [varchar](250),
	@Description [varchar](50)
)AS
UPDATE Post
SET Title = @Title, 
	PostContent = @Content,
	UserID = @UserID,
	CategoryID = @CategoryID,
	StatusID = @StatusID,
	DateCreated = @DateCreated,
	ExpirationDate = @DateExpired,
	Critique = @Critique,
	PostImage = @Image,
	[Description] = @Description
WHERE Post.PostID = @ID