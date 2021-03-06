USE [master]
GO
/****** Object:  Database [Cosmos]    Script Date: 6/30/2016 3:34:00 PM ******/
DROP DATABASE IF EXISTS [Cosmos]
CREATE DATABASE [Cosmos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cosmos', FILENAME = N'C:\Users\23601\Desktop\MyStuff\softwareguildprojects\CosmosBlog\CosmosBlog\CosmosBlog\App_Data\Cosmos.mdf' , SIZE = 12032KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cosmos_log', FILENAME = N'C:\Users\23601\Desktop\MyStuff\softwareguildprojects\CosmosBlog\CosmosBlog\CosmosBlog\App_Data\Cosmos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
EXEC sys.sp_db_vardecimal_storage_format N'Cosmos', N'ON'
GO
USE [Cosmos]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[StaticPages]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/30/2016 3:34:01 PM ******/
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

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'General')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'News')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Interviews')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (13, N'Theory')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (14, N'Rumors')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (15, N'Bizarre')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (16, N'NSFW')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (9, N'Dog Graduates From NASA Academy', N'<p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut hendrerit varius pharetra. Nam pulvinar convallis diam vitae tristique. <b>Duis ultrices quis nibh quis cursus</b>. Vestibulum id pretium massa. In iaculis dolor in efficitur elementum. Curabitur ornare volutpat enim non sollicitudin. Morbi venenatis neque at dictum lacinia. Nam malesuada, nulla vel semper mattis, nunc tellus mattis orci, vitae tempor velit nisi at velit. Aliquam tristique lectus dignissim, aliquam ligula ac, facilisis nisl. Cras sollicitudin volutpat nisl quis rhoncus. Duis euismod bibendum luctus. In volutpat nisi sed efficitur feugiat. Proin neque elit, rhoncus a massa id, viverra rutrum velit. Vestibulum eget nisl pulvinar, ultricies nisl a, commodo dui.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Praesent augue sem, eleifend viverra sem nec, placerat sagittis est. Aenean iaculis ligula et nisi euismod semper. Donec tempor viverra tortor sed euismod. Aliquam et urna arcu. Vivamus massa tortor, suscipit eu vestibulum ac, vulputate quis neque. Praesent blandit tellus vel eros aliquet ullamcorper. Aenean bibendum nunc et ante sagittis, vel tristique augue bibendum. <span style="background-color: rgb(255, 255, 0);">Fusce sollicitudin tellus lacus</span>, vehicula scelerisque diam aliquet at. Sed ut enim ac odio consequat efficitur nec placerat dui. Cras convallis lorem ac nisl placerat, vitae mollis mauris scelerisque. Nulla interdum laoreet justo, ac ultrices ligula vehicula ut. Phasellus volutpat sollicitudin nunc, eu porta nunc volutpat eu.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Praesent neque neque, condimentum nec feugiat et, convallis in magna. Quisque non leo accumsan, dapibus ipsum et, pellentesque nibh. Nulla id pellentesque nisi, vitae egestas lorem. Nullam quis sapien fermentum, eleifend lorem eget, hendrerit tortor. Nulla bibendum mauris ante. Proin risus lectus, dignissim eget purus et, posuere aliquam nulla. Aenean eu interdum neque. <u>Fusce varius nibh augue, sit amet finibus nibh rhoncus vitae. Integer nec varius arcu. Curabitur eu magna vulputate, semper sem sed, consectetur neque.</u></p>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'http://1.bp.blogspot.com/_wvcCE9jbIg0/TS-SL7r8-iI/AAAAAAAAHtI/6yiAVo4xqoY/s1600/space%2Bdog%2B2.jpg', N'K-9 graduates from NASA Academy with honors', 15)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (10, N'Do we finally have proof?', N'<div style="margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: &quot;Open Sans&quot;, Arial, sans-serif;"><h2 style="margin-right: 0px; margin-left: 0px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px;">What is Lorem Ipsum?</h2><p style="margin-bottom: 15px; padding: 0px; text-align: justify;"><strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style="margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: &quot;Open Sans&quot;, Arial, sans-serif;"><h2 style="margin-right: 0px; margin-left: 0px; padding: 0px; font-weight: 400; line-height: 24px; font-family: DauphinPlain; font-size: 24px;">Why do we use it?</h2><p style="margin-bottom: 15px; padding: 0px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div></div>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'https://www.thesun.co.uk/wp-content/uploads/2016/03/2399938.main_image.jpg', N'Scientists find 300 year old photo of alien on sur', 11)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (11, N'Aliens in North Dakota?', N'<h1 style="text-align: left; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 70px; line-height: 90px;">Lorem Ipsum</h1><h4 style="text-align: left; margin: 10px 10px 5px; padding: 0px; font-weight: 400; line-height: 18px; font-size: 14px; font-style: italic; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."</h4><h5 style="text-align: left; margin: 5px 10px 20px; padding: 0px; font-weight: 400; font-size: 12px; line-height: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</h5><hr style="text-align: left; margin: 0px; padding: 0px; clear: both; border-top-width: 0px; height: 1px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.74902), rgba(0, 0, 0, 0));"><div class="boxed" style="margin: 10px 28.7969px; padding: 0px; clear: both; font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: center;"><div id="lipsum" style="margin: 0px; padding: 0px; text-align: justify;"><p style="text-align: left; margin-bottom: 15px; padding: 0px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean accumsan nulla lectus, nec blandit est egestas nec. Curabitur et ipsum dignissim, feugiat velit iaculis, convallis dolor. Integer mauris elit, laoreet ac nulla nec, bibendum aliquam est. Ut eget ullamcorper enim. Donec dictum gravida purus. Maecenas eget posuere orci, vel vulputate justo. Nulla consequat mauris imperdiet odio consequat vulputate. Cras eget sem quis urna consectetur rhoncus. In faucibus turpis vitae nisi euismod bibendum.</p><p style="text-align: left; margin-bottom: 15px; padding: 0px;">Aliquam congue vel sem id fringilla. Donec ac ullamcorper odio. Sed eu nisi ligula. Aliquam porttitor lacinia nisl ac fringilla. Maecenas dolor ligula, lobortis nec lacus id, varius placerat nisl. Donec facilisis fermentum tortor eu venenatis. Aenean turpis ex, lobortis at tristique ac, sodales at sapien. Nunc ut gravida turpis. Ut consectetur enim vitae mauris molestie, vel mollis nibh efficitur.</p><p style="text-align: left; margin-bottom: 15px; padding: 0px;">Donec eleifend ac turpis at venenatis. Nullam tincidunt erat non quam laoreet vestibulum. Vivamus porta sit amet leo ac fermentum. Quisque fringilla enim vitae ante consectetur suscipit. Pellentesque semper lacus lectus, a tempor nulla malesuada vitae. Nulla quis viverra ex, at eleifend libero. Nunc arcu ligula, volutpat sit amet libero in, accumsan sodales arcu. Cras lacinia magna at magna volutpat pellentesque. Mauris et purus vulputate, tempus dui a, vulputate turpis. Cras iaculis dictum tristique.</p></div></div>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'http://i.dailymail.co.uk/i/pix/2011/11/18/article-2063486-0EDB769600000578-564_634x644.jpg', N'Farmer in North Dakota claims to have uncovered a', 15)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (12, N'Orion''s Belt??', N'<p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">In congue turpis eget venenatis aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hendrerit pharetra neque eget ornare. Aliquam rhoncus dolor nec nibh cursus viverra. Vestibulum venenatis ipsum nec neque posuere volutpat vel tempus ante. Aliquam eu ligula eget nisl dapibus rutrum. Pellentesque vehicula orci sagittis gravida scelerisque. Maecenas pulvinar vitae purus sit amet vulputate. Fusce nulla ex, accumsan non dolor nec, finibus pellentesque diam. Morbi eros risus, egestas et nulla id, venenatis elementum nunc. Mauris ut ipsum non nulla facilisis dictum eget quis eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce finibus, dui vel consequat eleifend, purus felis vestibulum ipsum, et viverra eros turpis et dolor. In euismod vestibulum consectetur. Phasellus eu scelerisque sapien, vitae fermentum urna.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Curabitur porta risus vel enim varius mattis. Ut a nibh massa. Quisque in nunc non augue consectetur ornare non eu metus. Sed ac eros semper, posuere diam vitae, tempor quam. Aliquam aliquam venenatis nibh, eu volutpat dui dapibus vitae. Duis id dolor a leo malesuada volutpat. Pellentesque eleifend metus leo, ut convallis sem viverra placerat. Integer mollis eros cursus lorem dapibus, vel accumsan turpis luctus. Phasellus convallis neque quis posuere lacinia.</p>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/galaxy-cat-universe-kitten-launch-------------johnnie-art.jpg', N'CONFIRMED: Kittens are the key to the universe...', 11)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (13, N'No more pluto??', N'<p><img src="https://media.giphy.com/media/3o6gb3VMYospm2e96U/giphy.gif" style="width: 873.913px; height: 491.333px;"><br></p>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'https://steilacoomsentinel.org/wp-content/uploads/2017/03/funny-talking-planet-animation.gif', N'Pluto will be renamed "Spongebob" in 2038', 14)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (14, N'Want a New Pet?', N'<p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean accumsan nulla lectus, nec blandit est egestas nec. Curabitur et ipsum dignissim, feugiat velit iaculis, convallis dolor. Integer mauris elit, laoreet ac nulla nec, bibendum aliquam est. Ut eget ullamcorper enim. Donec dictum gravida purus. Maecenas eget posuere orci, vel vulputate justo. Nulla consequat mauris imperdiet odio consequat vulputate. Cras eget sem quis urna consectetur rhoncus. In faucibus turpis vitae nisi euismod bibendum.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Aliquam congue vel sem id fringilla. Donec ac ullamcorper odio. Sed eu nisi ligula. Aliquam porttitor lacinia nisl ac fringilla. Maecenas dolor ligula, lobortis nec lacus id, varius placerat nisl. Donec facilisis fermentum tortor eu venenatis. Aenean turpis ex, lobortis at tristique ac, sodales at sapien. Nunc ut gravida turpis. Ut consectetur enim vitae mauris molestie, vel mollis nibh efficitur.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;">Donec eleifend ac turpis at venenatis. Nullam tincidunt erat non quam laoreet vestibulum. Vivamus porta sit amet leo ac fermentum. Quisque fringilla enim vitae ante consectetur suscipit. Pellentesque semper lacus lectus, a tempor nulla malesuada vitae. Nulla quis viverra ex, at eleifend libero. Nunc arcu ligula, volutpat sit amet libero in, accumsan sodales arcu. Cras lacinia magna at magna volutpat pellentesque. Mauris et purus vulputate, tempus dui a, vulputate turpis. Cras iaculis dictum tristique.</p><div><br></div>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'http://65.media.tumblr.com/b04a9600db9ff4f52adcc3e5d12a2500/tumblr_nnq1n25je41upbn1no1_1280.jpg', N'Website claims to have real aliens for sale?', 10)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (15, N'Mixed Breed?', N'<p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-size: 10px;"><font face="Courier New">Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules.</font></p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-size: 10px;"><font face="Courier New">Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues.</font></p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-size: 10px;"><font face="Courier New">Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie.</font></p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-size: 10px;"><font face="Courier New">Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.</font></p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-size: 10px;"><font face="Courier New">At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</font></p>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'http://media.galaxant.com/000/195/024/desktop-1434382829.jpg', N'Is it possible to cross-breed cats and aliens?', 15)
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (16, N'Free Trip to the Sun!', N'<p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px;">Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules.</p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px;">Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues.</p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px;">Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es. Li Europan lingues es membres del sam familie.</p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px;">Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.</p><p style="padding: 0px; line-height: normal; color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px;">At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental.</p>', 1, CAST(N'2016-06-30' AS Date), 2, NULL, NULL, N'http://i.dailymail.co.uk/i/pix/2015/02/28/262C8CF000000578-0-image-a-2_1425143421179.jpg', N'Homeless man wins trip to Sun for 90th Birthday', 11)
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (9, 4)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (9, 12)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (9, 17)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (9, 20)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (10, 17)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (10, 24)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (10, 28)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (11, 17)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (11, 23)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (11, 29)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 12)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 30)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 33)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 38)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (15, 42)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 43)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 44)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 45)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 46)
SET IDENTITY_INSERT [dbo].[StaticPages] ON 

INSERT [dbo].[StaticPages] ([PageID], [PageTitle], [PageContent]) VALUES (1, N'About Us', N'<p style="text-align: left;"><img src="http://images2.onionstatic.com/clickhole/1012/6/16x9/800.jpg" style="width: 929.798px; height: 679.333px;"><br></p><p><br></p><h3 style="text-align: left;"><font style="font-weight: normal;" face="Helvetica">Hello, we are astronauts. We also have a blog. Take care...</font></h3>')
INSERT [dbo].[StaticPages] ([PageID], [PageTitle], [PageContent]) VALUES (2, N'Disclaimer', N'<p><span style="color: rgb(51, 51, 51); font-family: Overlock, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; font-size: 15px; line-height: 23.4375px;">This blog contains links to other websites.&nbsp; All external links contain content which is not endorsed, administered, or controlled by this blog.&nbsp; We are not responsible for the information found on the sites linked to and/or actions taken by these companies. All information that you submit on other websites is done so at your own risk.&nbsp; We encourage you to read the “Privacy Policy” of each website you visit before submitting any information in order to get a free sample or take advantage of a promotion.</span><br></p>')
INSERT [dbo].[StaticPages] ([PageID], [PageTitle], [PageContent]) VALUES (5, N'Dog goes to space', N'<p><img src="http://1.bp.blogspot.com/_wvcCE9jbIg0/TS-SL7r8-iI/AAAAAAAAHtI/6yiAVo4xqoY/s1600/space%2Bdog%2B2.jpg"><br></p>')
SET IDENTITY_INSERT [dbo].[StaticPages] OFF
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
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (11, N'dog  ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (12, N'nasa ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (13, N'unreal ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (14, N'k9 ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (15, N' news ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (16, N'news ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (17, N'vintage ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (18, N'cover-up ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (19, N'usa ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (20, N'alien ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (21, N' fossil ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (22, N' bizarre ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (23, N'farmer ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (24, N'weird ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (25, N'unreal')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (26, N'kitten ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (27, N'cute ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (28, N'universe ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (29, N'cat ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (30, N'science ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (31, N'facts')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (32, N'pluto ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (33, N'spongebob ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (34, N'planets ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (35, N'random ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (36, N'unbelievable ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (37, N'no-way')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (38, N'pets ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (39, N'buy ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (40, N'cats ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (41, N'kittens ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (42, N'theory')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (43, N'space ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (44, N'astronaut ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (45, N'oldman ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (46, N'homeless')
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
/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewStaticPage]
(
	@PageTitle varchar(50),
	@PageContent varchar(max)
)
AS
Insert Into StaticPages(PageTitle, PageContent)
Values (@PageTitle, @PageContent)
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddTags]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AssignTagsToPost]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteStaticPage]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStaticPage] (
@PageID int
) AS

DELETE StaticPages
WHERE PageID = @PageID
GO
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditCategory]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditPost]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditStaticPage]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditStaticPage] (
 @PageID int,
 @PageTitle varchar(100),
 @PageContent varchar(MAX)
) AS

UPDATE StaticPages
SET PageTitle = @PageTitle,
PageContent = @PageContent
WHERE PageID = @PageID
GO
/****** Object:  StoredProcedure [dbo].[EditTag]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCategories]
AS
SELECT * 
FROM Category

GO
/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPosts]
AS
SELECT * 
FROM Post 


GO
/****** Object:  StoredProcedure [dbo].[GetAllPostsWithTags]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStaticPages] AS

select *
FROM StaticPages
GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllTags]
AS
SELECT *
FROM Tags

GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByName]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOneCategory]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOneStaticPage]    Script Date: 6/30/2016 3:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOneStaticPage] (
 @PageID int
) AS

SELECT *
FROM StaticPages
WHERE PageID = @PageID
GO
/****** Object:  StoredProcedure [dbo].[GetOneTag]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPostComments]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPostTags]    Script Date: 6/30/2016 3:34:01 PM ******/
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
/****** Object:  StoredProcedure [dbo].[WriteNewCategory]    Script Date: 6/30/2016 3:34:01 PM ******/
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
