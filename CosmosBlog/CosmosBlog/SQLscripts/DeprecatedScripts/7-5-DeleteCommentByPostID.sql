CREATE PROCEDURE DeleteCommentByPostID (
 @POstID int
 )
 AS

 DELETE Comments
 WHERE PostID = @PostId