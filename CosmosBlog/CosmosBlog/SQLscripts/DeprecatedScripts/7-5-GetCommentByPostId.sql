
CREATE PROCEDURE [dbo].[GetCommentByPostId](
@PostID int
) AS

SELECT CommentContent FROM Comments
WHERE PostID = @PostID