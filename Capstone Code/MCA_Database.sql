USE [master]
GO
/****** Object:  Database [AMCATestDB]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE DATABASE [AMCATestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AMCATestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.COPIATEK\MSSQL\DATA\AMCATestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AMCATestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.COPIATEK\MSSQL\DATA\AMCATestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AMCATestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AMCATestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AMCATestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AMCATestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AMCATestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AMCATestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AMCATestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AMCATestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AMCATestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AMCATestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AMCATestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AMCATestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AMCATestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AMCATestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AMCATestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AMCATestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AMCATestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AMCATestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AMCATestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AMCATestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AMCATestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AMCATestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AMCATestDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AMCATestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AMCATestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AMCATestDB] SET  MULTI_USER 
GO
ALTER DATABASE [AMCATestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AMCATestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AMCATestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AMCATestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AMCATestDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AMCATestDB', N'ON'
GO
ALTER DATABASE [AMCATestDB] SET QUERY_STORE = OFF
GO
USE [AMCATestDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Artist]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_Artist_ArtistID] UNIQUE NONCLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/14/2019 4:23:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/14/2019 4:23:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/14/2019 4:23:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/14/2019 4:23:47 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/14/2019 4:23:47 PM ******/
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
/****** Object:  Table [dbo].[Business]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessName] [nvarchar](150) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[AddressLIne1] [nvarchar](50) NOT NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[City] [nvarchar](80) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[Zip] [nvarchar](10) NOT NULL,
	[Website] [nvarchar](60) NULL,
	[ContactTelephone] [nvarchar](50) NULL,
	[BusinessTelephone] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_Business_BusinessID] UNIQUE NONCLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[NumberSubmissions] [int] NOT NULL,
	[BusinessID] [int] NOT NULL,
	[CStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Campaigns] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignStatus]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignStatus](
	[CStatusID] [int] IDENTITY(1,1) NOT NULL,
	[CSStatusType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CampaignStatus] PRIMARY KEY CLUSTERED 
(
	[CStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_CampaignStatus_CStatusID] UNIQUE NONCLUSTERED 
(
	[CStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Submissions]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submissions](
	[SubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[CampaignID] [int] NOT NULL,
	[VideoID] [int] NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [PK_Submissions] PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_Submissions_SubmissionID] UNIQUE NONCLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Active] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_User_UserID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Ind_UserID] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DateAdded] [datetime] NOT NULL,
	[YouTubeLink] [nvarchar](max) NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DF_Videos_VideoID] UNIQUE NONCLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_User_Artist]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_User_Artist] ON [dbo].[Artist]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_User_Business]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_User_Business] ON [dbo].[Business]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Business_Campaign]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Business_Campaign] ON [dbo].[Campaigns]
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Campaign_Status]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Campaign_Status] ON [dbo].[Campaigns]
(
	[CStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Artist_Submission]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Artist_Submission] ON [dbo].[Submissions]
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Campaign_Submission]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Campaign_Submission] ON [dbo].[Submissions]
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Video_Submission]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Video_Submission] ON [dbo].[Submissions]
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fkIdx_AspNU_User]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_AspNU_User] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_Artist_Video]    Script Date: 10/14/2019 4:23:47 PM ******/
CREATE NONCLUSTERED INDEX [fkIdx_Artist_Video] ON [dbo].[Videos]
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_User_Artist] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_User_Artist]
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
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_User_Business] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_User_Business]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Business_Campaign] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([BusinessID])
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [FK_Business_Campaign]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Status] FOREIGN KEY([CStatusID])
REFERENCES [dbo].[CampaignStatus] ([CStatusID])
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [FK_Campaign_Status]
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Submission] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Submissions] CHECK CONSTRAINT [FK_Artist_Submission]
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Submission] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaigns] ([CampaignID])
GO
ALTER TABLE [dbo].[Submissions] CHECK CONSTRAINT [FK_Campaign_Submission]
GO
ALTER TABLE [dbo].[Submissions]  WITH CHECK ADD  CONSTRAINT [FK_Video_Submission] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([VideoID])
GO
ALTER TABLE [dbo].[Submissions] CHECK CONSTRAINT [FK_Video_Submission]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_AspNU_User] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_AspNU_User]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Video] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Artist_Video]
GO
/****** Object:  StoredProcedure [dbo].[Artist_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_Add]
	@ArtistID INT OUTPUT,
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@NickName NVARCHAR(50),
	@Telephone NVARCHAR(50),
	@UserID INT
AS
BEGIN
	INSERT INTO [Artist]
	(
		[FirstName],
		[LastName],
		[NickName],
		[Telephone],
		[UserID]
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@NickName,
		@Telephone,
		@UserID
	);

	SET @ArtistID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[Artist_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_Delete]
	@ArtistID INT
AS
BEGIN
	DELETE	FROM [Artist]
	WHERE	[ArtistID] = @ArtistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Artist_Get_AID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_Get_AID]
	@ArtistID INT
AS
BEGIN
	SELECT	[ArtistID],
			[FirstName],
			[LastName],
			[NickName],
			[Telephone],
			[UserID]
	FROM	[Artist]
	WHERE	[ArtistID] = @ArtistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Artist_Get_UID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_Get_UID]
	@UserID INT
AS
BEGIN
	SELECT	[ArtistID],
			[FirstName],
			[LastName],
			[NickName],
			[Telephone],
			[UserID]
	FROM	[Artist]
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Artist_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_GetAll]
AS
BEGIN
	SELECT	[ArtistID],
			[FirstName],
			[LastName],
			[NickName],
			[Telephone],
			[UserID]
	FROM	[Artist];
END;

GO
/****** Object:  StoredProcedure [dbo].[Artist_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Artist_Update]
	@ArtistID INT,
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@NickName NVARCHAR(50),
	@Telephone NVARCHAR(50),
	@UserID INT
AS
BEGIN
	UPDATE	[Artist]
	SET		[FirstName] = @FirstName,
			[LastName] = @LastName,
			[NickName] = @NickName,
			[Telephone] = @Telephone,
			[UserID] = @UserID
	WHERE	[ArtistID] = @ArtistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_Add]
	@BusinessID INT OUTPUT,
	@BusinessName NVARCHAR(150),
	@ContactFirstName NVARCHAR(50),
	@ContactLastName NVARCHAR(50),
	@AddressLIne1 NVARCHAR(50),
	@AddressLine2 NVARCHAR(50),
	@City NVARCHAR(80),
	@State NCHAR(2),
	@Zip NVARCHAR(10),
	@Website NVARCHAR(60),
	@ContactTelephone NVARCHAR(50),
	@BusinessTelephone NVARCHAR(50),
	@UserID INT
AS
BEGIN
	INSERT INTO [Business]
	(
		[BusinessName],
		[ContactFirstName],
		[ContactLastName],
		[AddressLIne1],
		[AddressLine2],
		[City],
		[State],
		[Zip],
		[Website],
		[ContactTelephone],
		[BusinessTelephone],
		[UserID]
	)
	VALUES
	(
		@BusinessName,
		@ContactFirstName,
		@ContactLastName,
		@AddressLIne1,
		@AddressLine2,
		@City,
		@State,
		@Zip,
		@Website,
		@ContactTelephone,
		@BusinessTelephone,
		@UserID
	);

	SET @BusinessID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_Delete]
	@BusinessID INT
AS
BEGIN
	DELETE	FROM [Business]
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_Get_BID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_Get_BID]
	@BusinessID INT
AS
BEGIN
	SELECT	[BusinessID],
			[BusinessName],
			[ContactFirstName],
			[ContactLastName],
			[AddressLIne1],
			[AddressLine2],
			[City],
			[State],
			[Zip],
			[Website],
			[ContactTelephone],
			[BusinessTelephone],
			[UserID]
	FROM	[Business]
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_Get_UID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_Get_UID]
	@BusinessID INT
AS
BEGIN
	SELECT	[BusinessID],
			[BusinessName],
			[ContactFirstName],
			[ContactLastName],
			[AddressLIne1],
			[AddressLine2],
			[City],
			[State],
			[Zip],
			[Website],
			[ContactTelephone],
			[BusinessTelephone],
			[UserID]
	FROM	[Business]
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_GetAll]
AS
BEGIN
	SELECT	[BusinessID],
			[BusinessName],
			[ContactFirstName],
			[ContactLastName],
			[AddressLIne1],
			[AddressLine2],
			[City],
			[State],
			[Zip],
			[Website],
			[ContactTelephone],
			[BusinessTelephone],
			[UserID]
	FROM	[Business];
END;

GO
/****** Object:  StoredProcedure [dbo].[Business_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Business_Update]
	@BusinessID INT,
	@BusinessName NVARCHAR(150),
	@ContactFirstName NVARCHAR(50),
	@ContactLastName NVARCHAR(50),
	@AddressLIne1 NVARCHAR(50),
	@AddressLine2 NVARCHAR(50),
	@City NVARCHAR(80),
	@State NCHAR(2),
	@Zip NVARCHAR(10),
	@Website NVARCHAR(60),
	@ContactTelephone NVARCHAR(50),
	@BusinessTelephone NVARCHAR(50),
	@UserID INT
AS
BEGIN
	UPDATE	[Business]
	SET		[BusinessName] = @BusinessName,
			[ContactFirstName] = @ContactFirstName,
			[ContactLastName] = @ContactLastName,
			[AddressLIne1] = @AddressLIne1,
			[AddressLine2] = @AddressLine2,
			[City] = @City,
			[State] = @State,
			[Zip] = @Zip,
			[Website] = @Website,
			[ContactTelephone] = @ContactTelephone,
			[BusinessTelephone] = @BusinessTelephone,
			[UserID] = @UserID
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Add]
	@CampaignID INT OUTPUT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@StartDate DATETIME,
	@EndDate DATETIME,
	@NumberSubmissions INT,
	@BusinessID INT,
	@CStatusID INT
AS
BEGIN
	INSERT INTO [Campaigns]
	(
		[Title],
		[Description],
		[AddDate],
		[StartDate],
		[EndDate],
		[NumberSubmissions],
		[BusinessID],
		[CStatusID]
	)
	VALUES
	(
		@Title,
		@Description,
		GETDATE(),
		@StartDate,
		@EndDate,
		@NumberSubmissions,
		@BusinessID,
		@CStatusID
	);

	SET @CampaignID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Delete]
	@CampaignID INT
AS
BEGIN
	DELETE	FROM [Campaigns]
	WHERE	[CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Get_BID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Get_BID]
	@BusinessID INT
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns]
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Get_BIDStatus]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Get_BIDStatus]
	@BusinessID INT,
	@CStatusID INT
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns]
	WHERE	[BusinessID] = @BusinessID AND
	        [CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Get_CID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Get_CID]
	@CampaignID INT
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns]
	WHERE	[CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Get_Status]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Get_Status]
	@CStatusID INT
AS
BEGIN
	SELECT	c.[CampaignID],
			c.[Title],
			c.[Description],
			c.[AddDate],
			c.[StartDate],
			c.[EndDate],
			c.[NumberSubmissions],
			b.BusinessName,
			s.[CSStatusType],
			c.BusinessID
	FROM	[Campaigns] c
	INNER JOIN [CampaignStatus] s ON s.CStatusID = c.CStatusID
	INNER JOIN [Business] b ON b.BusinessID = c.BusinessID
	WHERE	c.[CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaigns_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_GetAll]
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaigns_GetAll_ByStart]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_GetAll_ByStart]
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns]
	ORDER BY [StartDate], [Title];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaigns_GetAll_ByTitle]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_GetAll_ByTitle]
AS
BEGIN
	SELECT	[CampaignID],
			[Title],
			[Description],
			[AddDate],
			[StartDate],
			[EndDate],
			[NumberSubmissions],
			[BusinessID],
			[CStatusID]
	FROM	[Campaigns]
	ORDER BY [Title], [StartDate];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaigns_GetAllInfo]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_GetAllInfo]
AS
BEGIN
	SELECT	c.[CampaignID],
			c.[Title],
			c.[Description],
			c.[AddDate],
			c.[StartDate],
			c.[EndDate],
			c.[NumberSubmissions],
			b.BusinessName,
			s.[CSStatusType]
	FROM	[Campaigns] c
	INNER JOIN [CampaignStatus] s ON s.CStatusID = c.CStatusID
	INNER JOIN [Business] b ON b.BusinessID = c.BusinessID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaigns_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaigns_Update]
	@CampaignID INT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@AddDate DATETIME,
	@StartDate DATETIME,
	@EndDate DATETIME,
	@NumberSubmissions INT,
	@BusinessID INT,
	@CStatusID INT
AS
BEGIN
	UPDATE	[Campaigns]
	SET		[Title] = @Title,
			[Description] = @Description,
			[AddDate] = @AddDate,
			[StartDate] = @StartDate,
			[EndDate] = @EndDate,
			[NumberSubmissions] = @NumberSubmissions,
			[BusinessID] = @BusinessID,
			[CStatusID] = @CStatusID
	WHERE	[CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CampaignStatus_Add]
	@CStatusID INT OUTPUT,
	@CSStatusType NVARCHAR(50)
AS
BEGIN
	INSERT INTO [CampaignStatus]
	(
		[CSStatusType]
	)
	VALUES
	(
		@CSStatusType
	);

	SET @CStatusID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CampaignStatus_Delete]
	@CStatusID INT
AS
BEGIN
	DELETE	FROM [CampaignStatus]
	WHERE	[CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Get]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CampaignStatus_Get]
	@CStatusID INT
AS
BEGIN
	SELECT	[CStatusID],
			[CSStatusType]
	FROM	[CampaignStatus]
	WHERE	[CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[CampaignStatus_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CampaignStatus_GetAll]
AS
BEGIN
	SELECT	[CStatusID],
			[CSStatusType]
	FROM	[CampaignStatus];
END;

GO
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CampaignStatus_Update]
	@CStatusID INT,
	@CSStatusType NVARCHAR(50)
AS
BEGIN
	UPDATE	[CampaignStatus]
	SET		[CSStatusType] = @CSStatusType
	WHERE	[CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Add]
	@SubmissionID INT OUTPUT,
	@CampaignID INT,
	@VideoID INT,
	@ArtistID INT
AS
BEGIN
	INSERT INTO [Submissions]
	(
		[DateAdded],
		[CampaignID],
		[VideoID],
		[ArtistID]
	)
	VALUES
	(
		GETDATE(),
		@CampaignID,
		@VideoID,
		@ArtistID
	);

	SET @SubmissionID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Delete]
	@SubmissionID INT
AS
BEGIN
	DELETE	FROM [Submissions]
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Get_AID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Get_AID]
	@ArtistID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submissions]
	WHERE	[ArtistID] = @ArtistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Get_AID_CID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Get_AID_CID]
	@ArtistID INT,
	@CampaignID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submissions]
	WHERE	[ArtistID] = @ArtistID AND
	        [CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Get_ArtistSubmission]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Get_ArtistSubmission]
	@ArtistID INT
AS
BEGIN
	SELECT	c.[Title],
			s.[DateAdded],
			v.[Title],
			s.[CampaignID],
			s.[VideoID],
			s.[ArtistID]
	FROM	[Submissions] s
	INNER JOIN [Campaigns] c ON c.CampaignID = s.CampaignID
    INNER JOIN [Videos] v ON v.VideoID = s.VideoID
	WHERE	s.[ArtistID] = @ArtistID
	ORDER BY s.[DateAdded];
END;
GO
/****** Object:  StoredProcedure [dbo].[Submissions_Get_CampaignSubmissions]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Get_CampaignSubmissions]
	@CampaignID INT
AS
BEGIN
	SELECT	a.[FirstName],
			a.[LastName],
			s.[DateAdded],
			v.[Title],
			v.[Description],
			v.[YouTubeLink],			
			s.[VideoID],
			s.[ArtistID]
	FROM	[Submissions] s
	INNER JOIN [Artist] a ON a.ArtistID = s.ArtistID
    INNER JOIN [Videos] v ON v.VideoID = s.VideoID
	WHERE	[CampaignID] = @CampaignID
	ORDER BY s.[DateAdded];
END;
GO
/****** Object:  StoredProcedure [dbo].[Submissions_Get_SID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Get_SID]
	@SubmissionID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submissions]
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_GetAll]
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submissions];
END;

GO
/****** Object:  StoredProcedure [dbo].[Submissions_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submissions_Update]
	@SubmissionID INT,
	@DateAdded DATETIME,
	@CampaignID INT,
	@VideoID INT,
	@ArtistID INT
AS
BEGIN
	UPDATE	[Submissions]
	SET		[DateAdded] = @DateAdded,
			[CampaignID] = @CampaignID,
			[VideoID] = @VideoID,
			[ArtistID] = @ArtistID
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Add]
	@UserID INT OUTPUT,
	@EmailAddress NVARCHAR(256),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@NickName NVARCHAR(50),
	@Active INT,
	@Id NVARCHAR(128)
AS
BEGIN
	INSERT INTO [User]
	(
		[EmailAddress],
		[FirstName],
		[LastName],
		[NickName],
		[Active],
		[DateAdded],
		[Id]
	)
	VALUES
	(
		@EmailAddress,
		@FirstName,
		@LastName,
		@NickName,
		@Active,
		GETDATE(),
		@Id
	);

	SET @UserID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Delete]
	@UserID INT
AS
BEGIN
	DELETE	FROM [User]
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Get_ID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Get_ID]
	@ID NVARCHAR(128)
AS
BEGIN
	SELECT	[UserID],
			[EmailAddress],
			[FirstName],
			[LastName],
			[NickName],
			[Active],
			[DateAdded],
			[Id]
	FROM	[User]
	WHERE	[ID] = @ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Get_UID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Get_UID]
	@UserID INT
AS
BEGIN
	SELECT	[UserID],
			[EmailAddress],
			[FirstName],
			[LastName],
			[NickName],
			[Active],
			[DateAdded],
			[Id]
	FROM	[User]
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_GetAll]
AS
BEGIN
	SELECT	[UserID],
			[EmailAddress],
			[FirstName],
			[LastName],
			[NickName],
			[Active],
			[DateAdded],
			[Id]
	FROM	[User];
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Update]
	@UserID INT,
	@EmailAddress NVARCHAR(256),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@NickName NVARCHAR(50),
	@Active INT,
	@DateAdded DATETIME,
	@Id NVARCHAR(128)
AS
BEGIN
	UPDATE	[User]
	SET		[EmailAddress] = @EmailAddress,
			[FirstName] = @FirstName,
			[LastName] = @LastName,
			[NickName] = @NickName,
			[Active] = @Active,
			[DateAdded] = @DateAdded,
			[Id] = @Id
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Add]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Add]
	@VideoID INT OUTPUT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@YouTubeLink NVARCHAR(MAX),
	@ArtistID INT
AS
BEGIN
	INSERT INTO [Videos]
	(
		[Title],
		[Description],
		[DateAdded],
		[YouTubeLink],
		[ArtistID]
	)
	VALUES
	(
		@Title,
		@Description,
		GETDATE(),
		@YouTubeLink,
		@ArtistID
	);

	SET @VideoID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Delete]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Delete]
	@VideoID INT
AS
BEGIN
	DELETE	FROM [Videos]
	WHERE	[VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Get_AID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Get_AID]
	@ArtistID INT
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Videos]
	WHERE	[ArtistID] = @ArtistID
	ORDER BY [DateAdded];
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Get_AIDVID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Get_AIDVID]
	@ArtistID INT,
	@VideoID  INT
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Videos]
	WHERE	[ArtistID] = @ArtistID AND
	        [VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Get_VID]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Get_VID]
	@VideoID INT
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Videos]
	WHERE	[VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_GetAll]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--
--  **** Get Video Records (All)
--
CREATE PROCEDURE [dbo].[Videos_GetAll]
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Videos]
	ORDER BY [ArtistID],
	         [DateAdded];
END;

GO
/****** Object:  StoredProcedure [dbo].[Videos_Update]    Script Date: 10/14/2019 4:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Videos_Update]
	@VideoID INT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@DateAdded DATETIME,
	@YouTubeLink NVARCHAR(MAX),
	@ArtistID INT
AS
BEGIN
	UPDATE	[Videos]
	SET		[Title] = @Title,
			[Description] = @Description,
			[DateAdded] = @DateAdded,
			[YouTubeLink] = @YouTubeLink,
			[ArtistID] = @ArtistID
	WHERE	[VideoID] = @VideoID;
END;

GO
USE [master]
GO
ALTER DATABASE [AMCATestDB] SET  READ_WRITE 
GO
