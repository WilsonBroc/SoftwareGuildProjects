USE [master]
GO
/****** Object:  Database [Cosmos]    Script Date: 7/5/2016 10:06:02 AM ******/
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
USE [Cosmos]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[StaticPages]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 7/5/2016 10:06:02 AM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201607011453306_InitialCreate', N'CosmosBlog.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB45EA245BB0E6823A2DF656D012ED0895484DA4D204C37ED91EF693F617464AD48D175D6CC5768A01432D1E7E3C3CFC481E1E1EE6BF7FFE1DBF7D0803EB1EC6C4C768621F8CF66D0B22177B3E5A4EEC842E5EBCB6DFBEF9FEBBF199173E589F72B9232EC76A2232B1EF288D8E1D87B87730046414FA6E8C095ED0918B430778D839DCDFFFC53938702083B01996658D3F2488FA214C7FB09F538C5C18D1040497D8830111DF59C92C45B5AE400849045C38B1A7988498BC0BF0729409DBD649E003A6C80C060BDB0208610A2853F3F82381331A63B49C45EC03086E1F23C8E416202050A87F5C8A77EDC9FE21EF895356CCA1DC84501CF6043C3812A671E4EA2B19D82E4CC78C77C68C4C1F79AF53034EEC0B0FA69F3EE08019406EF0781AC45C78625F164D9C90E80AD2515E7194419EC70CEE2B8EBF8CAA887B56E77A7B05950E47FBFCBF3D6B9A043489E104C184C620D8B36E9279E0BBBFC3C75BFC05A2C9D1C17C71F4FAE52BE01DBDFA191EBDACF694F595C9D53EB04F37318E60CC74838BA2FFB6E5D4EB3972C5A25AA54E6615C625362B6CEB123CBC876849EFD87C397C6D5BE7FE03F4F22F825C1F91CF2611AB44E384FDBC4A8200CC0358943B8D6DF2FF37B47AF8F2D520AD5E817B7F990EBDD43E9B38319B571F609096923B3FCAA6576DBC3F0BB1F31887FC779D5F59E9E7194E629777061B456E41BC84B4AEDDD829C9DB89D21C6A785AE7A8BB4F6DAEA94A6FAD28EFD02A33216F62D3B321D7F769DBEDCCB89328628397528B5BA48970CA5E35922A336E142225710EBA1207B10E7DCBEBE05908FC608085B0432BCC0559F871088B5EBEC38C7600F5D6F90610C2D601EF3740EE1A5467FF1C40F519749398D1734641183D796B377718C1AB249C73D66FAEADC186E6F62B3E072EC5F119E2B5D6C67B8FDD2F38A167C83B05147EA46E0EC87FDEFA61778041D439715D48C8392333F4A69879D839E005A24787BDE1F8FAB46D47641A003FD47B22D24AFA39172DBD11BD84E29118C4745E4993AAEFF1D247DD54CD45CDAA6612ADAA0AB1BEAA72B06E9A0A49B3A2A940AB9E99D4607E5E3A42C33B7A29ECEE7B7AEB6DDEA6B5A062C6195B21E1AF10C1982D63DE0DA014C6A81C812EEBC6369C8574F878A34FBE37A52D7D02413274532BCD867411187E36A4B0BB3F1B5235D9E77BDFE35E4987E34F2ECCE03BC9EB4F56ED734ED26CD3D3A1D6CD4D37BE9935C0345D4E08C1AE9FCE024DE04B842DEAFA331FCE6A8F6164BD91E320AC638CE83EDFF2D817D6375B26D5353A8501A4D03A71B3C0E014101778AA195987BC1E8AE53BAA46B1321E5257EE27A54DC67418F34A801F82089BA93EA2EAB4F091EB472068B59254B3E316C6FB5EB421979CC20822DE60AB25BA34AE0F7F70058A76A44169B3D0D8A930AE998806AFD534E66D2E6C39EE4A5462239C6CF19D0DBC14FEDB9310B3D9621B2067B349BA28600CE56D83A0E2ACD29500F2C165D7082A9D980C04152ED546085AB7D816085A37C9B323687644ED3AFED27975D7E8593F286F7E5B6F34D716B859B3C78E5133F33D591DCA6AC058A5E7E99C17C207AA399C313DC5F98C085757A608079F415A0FD994FEAED60F759A416412350196446B011597800A9032A17A2897C7F21AB5135E440FD83CEED6082BD67E09B6C20115BB7A195A11345F99CAE4EC74FA287A56B0412179A7C3420547430879F1AA77BC83514C7159D5305D7CE13EDE70A56362301A0CD4E2B91A8C947766702BE5D46CB792CE21EBE392AD6525C97D325829EFCCE056121C6D3792C629E8E116AC65A2FA163ED064CB231DC56E53948D9D2C454A7C183B865CAAF12588221F2D2BB955E28B351389552F66FD538EC20CC3718926F3A8D0B66889E2182CA154CAEFC93D78EEC7849E020AE680C779A65EA88869F756C3F29F3759DD3ED541CCF7815C9AFF5BC47895ABFBDA56ABFA2202E29C7530E40E4D1A45D70CBFBEBAC553DD4000624DE07E8A83244466FFCA5C3BBBBEABD6CFBEA8086347D25FF19F1463295E6EDDF29DC6459D13C38C51E1BDAC3E4E660893B573DFB36A6F933F6A46C9C353551453C86A6BE3667263FA8C95EC20F61FAA5684A79955222BA50A203EF5C4A82436286095B2EEA8F5DC932A66BDA43BA294605285948A7A68594D23A929592D5809CF6051BD44F716D4C4912ABA5ADA1D5993425285D614AF80ADD1592EEB8EAAC932A9026B8ABB63972927F21ABAC3FB96F1D8B2EAC6951D6CD7DBB90C184FB3200EB3F155EEEFAB4095CF3DB1C40DBD0226BEEF24998CA7BB55C9948533D6239301C3BCEED42EBEEBCB4EE36DBD19B3769B5D5BDA9B6EF3CD78FD28FBA4C450CE76B248D17A71C693CE726371AEEAF278463A686522B6959B916DEB8F84C270C40546B33F8369E043BE88E7029700F90B486896C1611FEE1F1C4A0F7076E7318C43881768CEA5A61731F531DB403216BA07B17B07623535628D072325A81275BE401E7C98D87FA5B58ED30006FF57FA79CFBA201F91FF67C20A6EE3045A7FABA99EC324D0379FB076F4B94377AB5EFCF139ABBA675DC76CC61C5BFB922D5719E1FA23885EDA6455D7D066E5A711CF7742D55E1E6851A509B1FA4383B94F077964906BF943081E7EECAB9AF621C15A889AC70243E10D6242D3638055B08C0F013CF693A60F01FA7556FF306015D58C8F027CD41F4C7E12D07D19CA6B6E71ABD11C8936B124A5766E4DA95E2BBF72DB7B939279BDD64457B3AB7BC0AD9141BD02339E59F2F160BBA326B77830EC6D52FBC9138A772587B8CCEED86EEAF026B3851BEE84BEA924E11D486BD3A4E96C3F1578D35C338571773C9FB25FC2EF8E914D246F6D3FAD77D364338579779C6CBD9277778C6BDBDA3FB7CCB4CE5BE8D65371D5AC22C3758C2E16DC966A9B05CED9097F8E1909328F327B21A9CFED6ACA4B6D69B01431376A4E2A931B56268ED2AE22D1DC6CBFBE8A0DBFB1B342A6B959432A6653DB62FD6F6C5BC834B76D4870DC4692B036C55097B8DDB28E3565403DA7A4E05A4F5A72D0DB7CD6C6BBF5E794033C88516AB3C77047FC7C527E0731C99053A7478AAF7ADDCBF6CECA5F5464FB37F1972504FFFB8A08BAB55DB390B9400B9C6FDE9246B98814A1B98414786C4B3D89A9BF002E65C53CC69C3EF14EE376FCA6630EBD0B749DD028A1ACCB309C07B5801777029ADA4FF398EB3A8FAFA3F4AF950CD105A6A6CF63F3D7E85DE2075EA1F7B926266480E0DE8588E8F2B1A43CB2BB7C2C90AE30EA0824CC573845B7308C020646AED10CDCC3557463F47B0F97C07D2C23802690F681A89B7D7CEA83650C422230CAFAEC27E3B0173EBCF91FF206CECA58540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Guest')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c35e92e9-bf6a-4adb-892c-10c04af0c27a', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12d138de-f552-4a22-890f-499ad32d1a58', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c04059af-b474-4f8e-a4b7-6751862a5d48', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12d138de-f552-4a22-890f-499ad32d1a58', N'Manager@cosmosblog.com', 0, N'AHZe0ujSQMntcvQeDlrY9MSA0bt6aOIgqMftj2+gT8qSTgAs/TiyonrjSc+rELbTdw==', N'95a54ba8-d8fc-458e-861d-a23621e33dd7', NULL, 0, 0, NULL, 1, 0, N'Manager@cosmosblog.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c04059af-b474-4f8e-a4b7-6751862a5d48', N'none1@none.com', 0, N'AHZe0ujSQMntcvQeDlrY9MSA0bt6aOIgqMftj2+gT8qSTgAs/TiyonrjSc+rELbTdw==', N'ee58daac-ecdc-4271-9b44-4977df9be76f', NULL, 0, 0, NULL, 1, 0, N'none1@none.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c35e92e9-bf6a-4adb-892c-10c04af0c27a', N'Admin@cosmosblog.com', 0, N'AHZe0ujSQMntcvQeDlrY9MSA0bt6aOIgqMftj2+gT8qSTgAs/TiyonrjSc+rELbTdw==', N'4c29973c-ecc2-48e3-b093-7b520c646268', NULL, 0, 0, NULL, 1, 0, N'Admin@cosmosblog.com')
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
INSERT [dbo].[Post] ([PostID], [Title], [PostContent], [UserID], [DateCreated], [StatusID], [ExpirationDate], [Critique], [PostImage], [Description], [CategoryID]) VALUES (17, N'Finally Proof?', N'<h2 style="margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; font-size: 1.2em; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Elit Inceptos Torquent</h2><p style="margin-bottom: 1em; padding: 0px; font-size: 12.16px; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Platea nam habitant proin facilisi elit urna cubilia. Ac pede duis facilisi&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">montes</strong>aptent hendrerit leo vitae lectus et&nbsp;<em style="margin: 0px; padding: 0px; font-size: 12.16px;">montes</em>&nbsp;non dui vitae. Aliquet mollis nostra nam urna felis est. Inceptos bibendum magna faucibus maecenas lectus montes cubilia sit nonummy nisi tellus massa, habitasse Posuere auctor mauris quis sollicitudin bibendum semper sit lacinia quam fringilla. Ac viverra in ultricies parturient proin ante tristique diam ac tempor sed placerat class. Malesuada convallis, odio dis. Pede magna&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">dictum</strong>&nbsp;erat est. Rhoncus. Dis sapien aptent suscipit potenti vivamus, aliquet fames suscipit etiam, cubilia et fusce vestibulum ridiculus A fermentum varius morbi Porttitor dictumst egestas elit fringilla ridiculus.<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">Amet</strong>&nbsp;ad. Tortor aliquet nam ac cras.</p><h3 style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 12.16px; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Dolor Consequat Suscipit Tempor Laoreet Dolor Sem Tempor</h3><p style="margin-bottom: 1em; padding: 0px; font-size: 12.16px; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Ultricies. Sociis Elit hendrerit ultricies ultrices urna est,&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">facilisi</strong>&nbsp;risus malesuada praesent rhoncus sagittis.&nbsp;<em style="margin: 0px; padding: 0px; font-size: 12.16px;">Cum</em>&nbsp;dictumst venenatis etiam. Senectus. Ut elementum nullam sapien sem accumsan facilisis eros facilisi penatibus lacus ad, pretium cubilia&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">consequat</strong>&nbsp;et ornare nisl mattis tempus lectus quam nibh imperdiet. Egestas taciti senectus&nbsp;<em style="margin: 0px; padding: 0px; font-size: 12.16px;">egestas</em>&nbsp;bibendum vulputate quisque. Placerat eleifend aptent egestas porta imperdiet vehicula est.&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">Suspendisse</strong>&nbsp;<em style="margin: 0px; padding: 0px; font-size: 12.16px;">nonummy</em>consequat imperdiet magna elit. Netus cum accumsan hendrerit maecenas. Risus justo quis suspendisse non amet auctor.</p><h3 style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 12.16px; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Feugiat Ullamcorper Fusce Metus At Per</h3><p style="margin-bottom: 1em; padding: 0px; font-size: 12.16px; color: rgb(85, 85, 85); font-family: Arial, sans-serif; line-height: 21.888px;">Pulvinar molestie taciti eget lacinia&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">dapibus</strong>&nbsp;metus fusce vestibulum integer odio id aptent, ridiculus lobortis sagittis habitant commodo augue iaculis. Pulvinar lacinia scelerisque. Conubia lacinia&nbsp;<em style="margin: 0px; padding: 0px; font-size: 12.16px;">pharetra</em>&nbsp;molestie, pretium placerat Sem sociosqu, hendrerit pharetra mattis euismod nostra tortor amet class Mollis eu lectus. Donec. Fringilla, ornare nisi curae; orci dictum. Conubia lacinia. Taciti euismod. Vitae magnis semper pretium sit&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">dictumst</strong>&nbsp;sodales libero dapibus nibh. Duis aliquam lacinia, platea turpis auctor ut erat curae; cum commodo. Diam. Libero, tempus sit iaculis laoreet nec sodales rutrum tempor Nullam. Habitant tortor&nbsp;<strong style="margin: 0px; padding: 0px; font-size: 12.16px;">ac</strong>&nbsp;nulla penatibus gravida magna vivamus, est et sociis Dolor dignissim inceptos. Phasellus cubilia praesent commodo porttitor dapibus per ipsum molestie dui habitasse penatibus tellus at.<span style="color: rgb(85, 85, 85); font-family: Arial, sans-serif; font-size: 12.16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.888px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">sociis Dolor dignissim inceptos.</span><span style="color: rgb(85, 85, 85); font-family: Arial, sans-serif; font-size: 12.16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.888px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">&nbsp;</span><strong style="box-sizing: border-box; font-weight: bold; color: rgb(85, 85, 85); font-family: Arial, sans-serif; font-size: 12.16px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 21.888px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);">Phasellus</strong><span style="color: rgb(85, 85, 85); font-family: Arial, sans-serif; font-size: 12.16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.888px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">&nbsp;</span><span style="color: rgb(85, 85, 85); font-family: Arial, sans-serif; font-size: 12.16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 21.888px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">cubilia praesent commodo porttitor dapibus per ipsum molestie dui habitasse penatibus tellus at.</span></p>', 1, CAST(N'2016-07-01' AS Date), 2, NULL, NULL, N'http://i4.mirror.co.uk/incoming/article7981629.ece/ALTERNATES/s615b/VID-UFO-spotted-over-residential-housing-in-England.jpg', N'Possible UFO soars over Moscow...', 10)
SET IDENTITY_INSERT [dbo].[Post] OFF

SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [CommentContent], [PostID], [CommenterName]) VALUES (8, N'This is ridiculous.

Why do you keep making this ridiculous content???', 9, NULL)
INSERT [dbo].[Comments] ([CommentID], [CommentContent], [PostID], [CommenterName]) VALUES (9, N'This post sucks!!

Try again!', 10, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF

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
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 47)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 48)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 49)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 50)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 51)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 52)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 53)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (12, 54)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (15, 42)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 43)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 44)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 45)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (16, 46)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (17, 31)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (17, 43)
INSERT [dbo].[PostTags] ([PostID], [TagID]) VALUES (17, 55)
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
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (47, N'nasa  ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (48, N'science  ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (49, N'spongebob  ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (50, N'pets  ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (51, N'nasa   ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (52, N'science   ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (53, N'spongebob   ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (54, N'pets   ')
INSERT [dbo].[Tags] ([TagID], [TagName]) VALUES (55, N'ufo ')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName]) VALUES (1, N'Testuser')
INSERT [dbo].[User] ([UserID], [UserName]) VALUES (2, N'Admin')
INSERT [dbo].[User] ([UserID], [UserName]) VALUES (3, N'Manager')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/5/2016 10:06:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
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
/****** Object:  StoredProcedure [dbo].[AddNewStaticPage]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddTags]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AssignTagsToPost]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteStaticPage]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditCategory]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditPost]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditStaticPage]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditTag]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCategories]
AS
SELECT * 
FROM Category


GO
/****** Object:  StoredProcedure [dbo].[GetAllPosts]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPosts]
AS
SELECT * 
FROM Post 



GO
/****** Object:  StoredProcedure [dbo].[GetAllPostsWithTags]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStaticPages] AS

select *
FROM StaticPages

GO
/****** Object:  StoredProcedure [dbo].[GetAllTags]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllTags]
AS
SELECT *
FROM Tags


GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByName]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOneCategory]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOnePost]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOnePost]
(
	@ID [int]
)AS
SELECT *
FROM Post as p
WHERE p.PostID = @ID
GO
/****** Object:  StoredProcedure [dbo].[GetOneStaticPage]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOneTag]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPostComments]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCommentByPostId]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCommentByPostId](
@PostID int
) AS

SELECT CommentContent FROM Comments
WHERE PostID = @PostID

GO
/****** Object:  StoredProcedure [dbo].[DeleteCommentByPostId]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE DeleteCommentByPostID (
 @POstID int
 )
 AS

DELETE Comments
WHERE PostID = @PostId

GO
/****** Object:  StoredProcedure [dbo].[AddComment]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddComment] (
	@Comment varchar(250),
	@PostID int
) AS

INSERT Into Comments (CommentContent, PostID)
VALUES (@Comment, @PostID)

GO
/****** Object:  StoredProcedure [dbo].[AdminUpdateStatus]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdminUpdateStatus] (
	@PostID int,
	@StatusID int
) AS
UPDATE Post
SET StatusID = @StatusID
WHERE PostID = @PostID

GO
/****** Object:  StoredProcedure [dbo].[GetPostTags]    Script Date: 7/5/2016 10:06:02 AM ******/
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
/****** Object:  StoredProcedure [dbo].[NumberOfPostsPerCategory]    Script Date: 7/5/2016 10:06:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[NumberOfPostsPerCategory]
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
GO
/****** Object:  StoredProcedure [dbo].[WriteNewCategory]    Script Date: 7/5/2016 10:06:02 AM ******/
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
