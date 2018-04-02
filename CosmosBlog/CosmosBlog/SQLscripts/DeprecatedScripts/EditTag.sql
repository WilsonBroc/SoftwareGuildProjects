USE Cosmos
GO

CREATE PROCEDURE EditTag
(
	@ID [int],
	@TagName [varchar](50)
)AS
UPDATE Tags
SET TagName = @TagName
WHERE Tags.TagID = @ID