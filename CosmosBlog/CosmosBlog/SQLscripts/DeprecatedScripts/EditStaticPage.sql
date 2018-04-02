CREATE PROCEDURE EditStaticPage 
(
	@PageID int,
	@PageTitle varchar(50),
	@PageContent varchar(MAX)
	) AS

UPDATE StaticPages
	SET PageTitle = @PageTitle,
		PageContent = @PageContent
		WHERE PageID = @PageID
