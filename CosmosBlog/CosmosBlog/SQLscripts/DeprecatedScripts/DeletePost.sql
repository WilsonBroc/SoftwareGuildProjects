CREATE PROCEDURE DeletePost
(
	@ID [int]
)AS

DELETE FROM PostTags
WHERE PostTags.PostID = @ID

DELETE FROM Post
WHERE Post.PostID = @ID


