USE AMCATestDB
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
/****** Object:  StoredProcedure [dbo].[Artist_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Artist_Get_AID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Artist_Get_UID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Artist_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Artist_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_Get_BID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_Get_UID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Business_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Campaign_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Add]
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
	INSERT INTO [Campaign]
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
/****** Object:  StoredProcedure [dbo].[Campaign_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Delete]
	@CampaignID INT
AS
BEGIN
	DELETE	FROM [Campaign]
	WHERE	[CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaign_Get_BID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Get_BID]
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
	FROM	[Campaign]
	WHERE	[BusinessID] = @BusinessID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaign_Get_BIDStatus]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Get_BIDStatus]
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
	FROM	[Campaign]
	WHERE	[BusinessID] = @BusinessID AND
	        [CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaign_Get_CID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Get_CID]
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
	FROM	[Campaign]
	WHERE	[CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaign_Get_Status]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Get_Status]
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
	FROM	[Campaign] c
	INNER JOIN [CampaignStatus] s ON s.CStatusID = c.CStatusID
	INNER JOIN [Business] b ON b.BusinessID = c.BusinessID
	WHERE	c.[CStatusID] = @CStatusID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Campaign_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_GetAll]
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
	FROM	[Campaign];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaign_GetAll_ByStart]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_GetAll_ByStart]
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
	FROM	[Campaign]
	ORDER BY [StartDate], [Title];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaign_GetAll_ByTitle]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_GetAll_ByTitle]
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
	FROM	[Campaign]
	ORDER BY [Title], [StartDate];
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaign_GetAllInfo]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_GetAllInfo]
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
	FROM	[Campaign] c
	INNER JOIN [CampaignStatus] s ON s.CStatusID = c.CStatusID
	INNER JOIN [Business] b ON b.BusinessID = c.BusinessID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Campaign_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Campaign_Update]
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
	UPDATE	[Campaign]
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
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Get]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CampaignStatus_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CampaignStatus_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Submission_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Add]
	@SubmissionID INT OUTPUT,
	@CampaignID INT,
	@VideoID INT,
	@ArtistID INT
AS
BEGIN
	INSERT INTO [Submission]
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
/****** Object:  StoredProcedure [dbo].[Submission_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Delete]
	@SubmissionID INT
AS
BEGIN
	DELETE	FROM [Submission]
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submission_Get_AID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Get_AID]
	@ArtistID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submission]
	WHERE	[ArtistID] = @ArtistID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submission_Get_AID_CID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Get_AID_CID]
	@ArtistID INT,
	@CampaignID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submission]
	WHERE	[ArtistID] = @ArtistID AND
	        [CampaignID] = @CampaignID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submission_Get_ArtistSubmission]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Get_ArtistSubmission]
	@ArtistID INT
AS
BEGIN
	SELECT	c.[Title],
			s.[DateAdded],
			v.[Title],
			s.[CampaignID],
			s.[VideoID],
			s.[ArtistID]
	FROM	[Submission] s
	INNER JOIN [Campaign] c ON c.CampaignID = s.CampaignID
    INNER JOIN [Video] v ON v.VideoID = s.VideoID
	WHERE	s.[ArtistID] = @ArtistID
	ORDER BY s.[DateAdded];
END;
GO
/****** Object:  StoredProcedure [dbo].[Submission_Get_CampaignSubmissions]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Get_CampaignSubmissions]
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
	FROM	[Submission] s
	INNER JOIN [Artist] a ON a.ArtistID = s.ArtistID
    INNER JOIN [Video] v ON v.VideoID = s.VideoID
	WHERE	[CampaignID] = @CampaignID
	ORDER BY s.[DateAdded];
END;
GO
/****** Object:  StoredProcedure [dbo].[Submission_Get_SID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Get_SID]
	@SubmissionID INT
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submission]
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Submission_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_GetAll]
AS
BEGIN
	SELECT	[SubmissionID],
			[DateAdded],
			[CampaignID],
			[VideoID],
			[ArtistID]
	FROM	[Submission];
END;

GO
/****** Object:  StoredProcedure [dbo].[Submission_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Submission_Update]
	@SubmissionID INT,
	@DateAdded DATETIME,
	@CampaignID INT,
	@VideoID INT,
	@ArtistID INT
AS
BEGIN
	UPDATE	[Submission]
	SET		[DateAdded] = @DateAdded,
			[CampaignID] = @CampaignID,
			[VideoID] = @VideoID,
			[ArtistID] = @ArtistID
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
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
	@Role NVARCHAR(256),
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
		[Role],
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
		@Role,
		@Id
	);

	SET @UserID = SCOPE_IDENTITY();
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Get_ID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
			[Role],
			[Id]
	FROM	[User]
	WHERE	[ID] = @ID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Get_UID]    Script Date: 10/14/2019 4:28:45 PM ******/
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
			[Role],
			[Id]
	FROM	[User]
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[User_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
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
			[Role],
			[Id]
	FROM	[User];
END;

GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
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
	@Role NVARCHAR(20),
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
			[Role] = @Role,
			[Id] = @Id
	WHERE	[UserID] = @UserID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_Add]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Add]
	@VideoID INT OUTPUT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@YouTubeLink NVARCHAR(MAX),
	@ArtistID INT
AS
BEGIN
	INSERT INTO [Video]
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
/****** Object:  StoredProcedure [dbo].[Video_Delete]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Delete]
	@VideoID INT
AS
BEGIN
	DELETE	FROM [Video]
	WHERE	[VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_Get_AID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Get_AID]
	@ArtistID INT
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Video]
	WHERE	[ArtistID] = @ArtistID
	ORDER BY [DateAdded];
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_Get_AIDVID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Get_AIDVID]
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
	FROM	[Video]
	WHERE	[ArtistID] = @ArtistID AND
	        [VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_Get_VID]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Get_VID]
	@VideoID INT
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Video]
	WHERE	[VideoID] = @VideoID;
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_GetAll]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--
--  **** Get Video Records (All)
--
CREATE PROCEDURE [dbo].[Video_GetAll]
AS
BEGIN
	SELECT	[VideoID],
			[Title],
			[Description],
			[DateAdded],
			[YouTubeLink],
			[ArtistID]
	FROM	[Video]
	ORDER BY [ArtistID],
	         [DateAdded];
END;

GO
/****** Object:  StoredProcedure [dbo].[Video_Update]    Script Date: 10/14/2019 4:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Video_Update]
	@VideoID INT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@DateAdded DATETIME,
	@YouTubeLink NVARCHAR(MAX),
	@ArtistID INT
AS
BEGIN
	UPDATE	[Video]
	SET		[Title] = @Title,
			[Description] = @Description,
			[DateAdded] = @DateAdded,
			[YouTubeLink] = @YouTubeLink,
			[ArtistID] = @ArtistID
	WHERE	[VideoID] = @VideoID;
END;

GO