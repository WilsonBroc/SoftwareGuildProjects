
CREATE PROCEDURE DeleteTag
(
	@ID int
)AS

DELETE FROM PostTags
WHERE PostTags.TagID = @ID

DELETE FROM Tags
WHERE Tags.TagID = @ID


