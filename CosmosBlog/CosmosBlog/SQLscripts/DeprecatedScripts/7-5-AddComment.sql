
CREATE PROCEDURE [dbo].[AddComment] (
	@Comment varchar(250),
	@PostID int
) AS

INSERT Into Comments (CommentContent, PostID)
VALUES (@Comment, @PostID)
