CREATE PROCEDURE [dbo].[AdminUpdateStatus] (
	@PostID int,
	@StatusID int
) AS
UPDATE Post
SET StatusID = @StatusID
WHERE PostID = @PostID