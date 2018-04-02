CREATE PROCEDURE DeleteStaticPage (
@PageID int
) AS

DELETE StaticPages
WHERE PageID = @PageID