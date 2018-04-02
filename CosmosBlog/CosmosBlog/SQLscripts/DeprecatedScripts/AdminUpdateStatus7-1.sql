CREATE PROCEDURE AdminUpdateStatus (
	@StatusID int
) AS
UPDATE Post
SET StatusID = @StatusID