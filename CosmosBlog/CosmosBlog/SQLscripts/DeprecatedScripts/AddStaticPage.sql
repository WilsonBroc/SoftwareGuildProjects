

CREATE PROCEDURE [dbo].[AddNewStaticPage]
(
	@PageTitle varchar(50),
	@PageContent varchar(max)
)
AS
Insert Into StaticPages(PageTitle, PageContent)
Values (@PageTitle, @PageContent)