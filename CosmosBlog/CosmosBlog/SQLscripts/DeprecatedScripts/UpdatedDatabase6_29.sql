USE [master]
GO
/****** Object:  Database [Cosmos]    Script Date: 6/29/2016 2:14:10 PM ******/
CREATE DATABASE [Cosmos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cosmos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Cosmos.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cosmos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Cosmos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cosmos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cosmos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cosmos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cosmos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cosmos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cosmos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cosmos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cosmos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cosmos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cosmos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cosmos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cosmos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cosmos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cosmos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cosmos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cosmos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cosmos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cosmos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cosmos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cosmos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cosmos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cosmos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cosmos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cosmos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cosmos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cosmos] SET  MULTI_USER 
GO
ALTER DATABASE [Cosmos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cosmos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cosmos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cosmos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Cosmos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Cosmos]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [varchar](max) NOT NULL,
	[PostID] [int] NOT NULL,
	[CommenterName] [varchar](40) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[PostContent] [varchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ExpirationDate] [date] NULL,
	[Critique] [varchar](max) NULL,
	[PostImage] [varchar](250) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__Post__AA126038243B21B5] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPages]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaticPages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageTitle] [varchar](50) NOT NULL,
	[PageContent] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](40) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Black Holes')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'General2')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Solar System')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'General')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'General')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [CommentContent], [PostID], [CommenterName]) VALUES (1, N'This blog post really stinks!', 3, N'MrAntiScience')
INSERT [dbo].[Comments] ([CommentID], [CommentContent], [PostID], [CommenterName]) VALUES (2, N'Science Rules!!', 3, N'BillNye')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (3, N'Test Post', N'This is a test of the content of the post', 1, CAST(N'2016-06-20' AS Date), 1, NULL, NULL, N'http://www.unoosa.org/res/timeline/index_html/space-2.jpg', N'First Test Post', 5)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (5, N'Scientists Make Pluto A Planet Again', N'Today NASA Scientists admitted they made a grave error in 2006 when they demoted Pluto. They rectified that error by upgrading Pluto back to planetary status.', 1, CAST(N'2016-06-23' AS Date), 1, NULL, NULL, N'https://source.wustl.edu/wp-content/uploads/newsroom-archive/newsroom-publishing-images-archive/475px20150603.jpg', N'Pluto is a Planet Again!', 5)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (6, N'Giant Pyramid Found On Mars', N'An amateur astronomer found what appears to be a giant pyramid on Mars today.', 1, CAST(N'2016-06-22' AS Date), 2, NULL, NULL, N'https://source.wustl.edu/wp-content/uploads/newsroom-archive/newsroom-publishing-images-archive/475px20150603.jpg', N'Discovery On Mars', 5)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (7, N'Some fake space story', N'This is just another fake space story for test data in our database', 1, CAST(N'2016-06-22' AS Date), 2, NULL, NULL, N'https://source.wustl.edu/wp-content/uploads/newsroom-archive/newsroom-publishing-images-archive/475px20150603.jpg', N'Fake test data', 5)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (8, N'Space Rocks!', N'<p><span style="color: rgb(91, 91, 91); font-family: FreeSans, Arimo, &quot;Droid Sans&quot;, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 22px;">Jupiter is lo<u>cated about fi</u>ve times farth</span><span style="color: rgb(91, 91, 91); font-size: 16px; line-height: 22px;"><font face="Arial Black">er from the sun than </font></span><span style="color: rgb(91, 91, 91); font-family: FreeSans, Arimo, &quot;Droid Sans&quot;, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 22px;">Earth and receives about 25 times less sunlight. But because of Juno''s extremely low power consumption, the probe can stay alive by collecting sunlight using three large solar arrays th<b>at extend from the spacecraft''s </b>hexagonal body. [</span><a href="http://www.space.com/12495-jupiter-juno-mission-photos-gallery.html" style="margin: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 22px; font-family: FreeSans, Arimo, &quot;Droid Sans&quot;, Helvetica, Arial, sans-serif; font-size: 16px; vertical-align: baseline; color: rgb(51, 102, 204);">Photos: NASA''s Juno Mission to Jupiter</a><span style="color: rgb(91, 91, 91); font-family: FreeSans, Arimo, &quot;Droid Sans&quot;, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 22px;">]</span><br></p>', 1, CAST(N'2016-06-29' AS Date), 1, NULL, NULL, N'http://weknowyourdreams.com/images/space/space-04.jpg', N'roking space', 5)
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (3, 3)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (5, 3)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (7, 3)
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Approved')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Not Approved')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Incomplete')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (5, N'Revisions Needed')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (3, N'Universe')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (4, N'NASA')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (6, N'SpaceRocks ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (7, N'ilovetheuniverse')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (9, N'thecosmos')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (10, N'happyspace')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName]) VALUES (1, N'Testuser')
INSERT [dbo].[User] ([UserID], [UserName]) VALUES (2, N'Dr. Steven Hawking')
INSERT [dbo].[User] ([UserID], [UserName]) VALUES (3, N'Marketing Manager')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Status]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Post]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags]
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPost]
(
	@Title varchar(50),
	@PostContent varchar(max),
	@UserID int,
	@CategoryID int,
	@StatusID int,
	@DateCreated date,
	@ExpirationDate date,
	@Critique varchar(max),
	@PostImage varchar(250),
	@Description varchar(50),
	@PostID int output
)
AS
Insert Into Post (Title, PostContent, UserID, CategoryID, StatusID, DateCreated, ExpirationDate, Critique, PostImage, [Description])
Values (@Title, @PostContent, @UserID, @CategoryID, @StatusID, @DateCreated, @ExpirationDate, @Critique, @PostImage, @Description)
Set @PostID = SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [dbo].[AddTags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddTags]
( 
	@TagName varchar(30)
)
AS
Insert Into Tags (TagName)
Values (@TagName)

GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
(
	@UserName [varchar](40)
)
AS
INSERT INTO [User] (UserName)
VALUES (@UserName)
GO
/****** Object:  StoredProcedure [dbo].[AssignTagsToPost]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AssignTagsToPost]
(
	@PostID int,
	@TagID int
)
AS
Insert Into PostTags (PostID, TagID)
Values (@PostID, @TagID)

GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteCategory]
(
	@ID [int]
)AS
DELETE FROM Category
WHERE Category.CategoryID = @ID
GO
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePost]
(
	@ID [int]
)AS

DELETE FROM PostTags
WHERE PostTags.PostID = @ID

DELETE FROM Post
WHERE Post.PostID = @ID



GO
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteTag]
(
	@ID [int]
)
AS

DELETE FROM PostTags
WHERE PostTags.TagID = @ID

DELETE FROM Tags
WHERE Tags.TagID = @ID

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
(
	@ID [int]
)
AS
DELETE FROM [User]
WHERE [User].UserID = @ID
GO
/****** Object:  StoredProcedure [dbo].[EditCategory]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditCategory]
(
	@ID [int],
	@CategoryName [varchar](50)
)AS
UPDATE Category
SET CategoryName = @CategoryName
WHERE Category.CategoryID = @ID
GO
/****** Object:  StoredProcedure [dbo].[EditPost]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditPost]
(
	@ID [int],
	@Title [varchar](50),
	@Content [varchar](MAX),
	@UserID [int],
	@CategoryID [int],
	@StatusID [int],
	@DateCreated [date],
	@DateExpired [date],
	@Critique [varchar](MAX),
	@Image [varchar](250),
	@Description [varchar](50)
)AS
UPDATE Post
SET Title = @Title, 
	PostContent = @Content,
	UserID = @UserID,
	CategoryID = @CategoryID,
	StatusID = @StatusID,
	DateCreated = @DateCreated,
	ExpirationDate = @DateExpired,
	Critique = @Critique,
	PostImage = @Image,
	[Description] = @Description
WHERE Post.PostID = @ID
GO
/****** Object:  StoredProcedure [dbo].[EditTag]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditTag]
(
	@ID [int],
	@TagName [varchar](50)
)AS
UPDATE Tags
SET TagName = @TagName
WHERE Tags.TagID = @ID
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditUser]
(
	@ID [int],
	@UserName [varchar](50)
)AS
UPDATE [User]
SET UserName = @UserName
WHERE [user].UserID = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCategories]
AS
SELECT * 
FROM Category
GO
/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPosts]
AS
SELECT * 
FROM Post 

GO
/****** Object:  StoredProcedure [dbo].[GetAllPostsWithTags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPostsWithTags]
AS
SELECT * 
FROM Post AS p 
INNER JOIN PostTags AS pt ON p.PostID = pt.PostID
INNER JOIN Tags AS t ON pt.TagID = t.TagID
GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllTags]
AS
SELECT *
FROM Tags
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByName]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCategoryByName]
(
	@CategoryName [varchar](50)
)AS
SELECT *
FROM Category as c
WHERE c.CategoryName = @CategoryName
GO
/****** Object:  StoredProcedure [dbo].[GetOneCategory]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOneCategory]
(
	@ID [int]
) AS
SELECT * 
FROM Category AS c
WHERE c.CategoryID = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetOneTag]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOneTag]
(
	@ID [int]
)
AS
SELECT *
FROM Tags AS t
WHERE t.TagID = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetPostComments]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPostComments]
(
	@ID [int]
)

AS
SELECT *
FROM Comments as c
WHERE c.PostID = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetPostTags]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPostTags]
(
	@ID [int]
)
AS
SELECT *
FROM Tags as t
INNER JOIN PostTags AS pt ON t.TagID = pt.TagID
WHERE pt.PostID = @ID

GO
/****** Object:  StoredProcedure [dbo].[WriteNewCategory]    Script Date: 6/29/2016 2:14:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WriteNewCategory]
(
	@CategoryName [varchar](50)
) AS
INSERT INTO Category (CategoryName)
VALUES (@CategoryName)
GO
USE [master]
GO
ALTER DATABASE [Cosmos] SET  READ_WRITE 
GO
