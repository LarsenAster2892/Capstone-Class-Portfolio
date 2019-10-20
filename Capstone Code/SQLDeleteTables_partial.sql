USE AMCATestDB
GO


/*  Delete Submission Table */
--ALTER TABLE [dbo].[Submissions] DROP CONSTRAINT [FK_Video_Submission]
GO

ALTER TABLE [dbo].[Submissions] DROP CONSTRAINT [FK_Campaign_Submission]
GO

ALTER TABLE [dbo].[Submissions] DROP CONSTRAINT [FK_Artist_Submission]
GO

DROP TABLE [dbo].[Submissions]
GO

/*  Delete Campaign Table */
ALTER TABLE [dbo].[Campaigns] DROP CONSTRAINT [FK_Campaign_Status]
GO

ALTER TABLE [dbo].[Campaigns] DROP CONSTRAINT [FK_Business_Campaign]
GO

DROP TABLE [dbo].[Campaigns]
GO

/*  Delete Video Table */
ALTER TABLE [dbo].[Videos] DROP CONSTRAINT [FK_Artist_Video]
GO

DROP TABLE [dbo].[Videos]
GO

/*  Delete Business Table */
ALTER TABLE [dbo].[Business] DROP CONSTRAINT [FK_User_Business]
GO

DROP TABLE [dbo].[Business]
GO

/*  Delete Artist Table */
ALTER TABLE [dbo].[Artist] DROP CONSTRAINT [FK_User_Artist]
GO

DROP TABLE [dbo].[Artist]

/*  Delete User Table */

ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_AspNU_User]
GO

/****** Object:  Table [dbo].[User]    Script Date: 10/14/2019 4:42:40 PM ******/
DROP TABLE [dbo].[User]
GO

