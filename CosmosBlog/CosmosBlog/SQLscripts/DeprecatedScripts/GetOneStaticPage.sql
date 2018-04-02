CREATE PROCEDURE GetOneStaticPage (
 @PageID int
) AS

SELECT *
FROM StaticPages
WHERE PageID = @PageID