Create Procedure NumberOfPostsPerCategory
(
	@CategoryId int
)
As
Begin
select count(p.PostID) as NumberOfPosts from Post p
	Full Outer Join Category c
	On p.CategoryID = c.CategoryID
	Group By c.CategoryID
	Having c.CategoryID = @CategoryId
End