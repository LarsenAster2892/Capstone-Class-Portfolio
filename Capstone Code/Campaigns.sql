USE AMCATestDB
GO
--
--  **** Add Campaign Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Add]
GO

CREATE PROCEDURE [Campaigns_Add]
	@CampaignID INT OUTPUT,
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
		@AddDate,
		@StartDate,
		@EndDate,
		@NumberSubmissions,
		@BusinessID,
		@CStatusID
	);

	SET @CampaignID = SCOPE_IDENTITY();
END;

GO

--
--  **** Update Campaign Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Update]
GO

CREATE PROCEDURE [Campaigns_Update]
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

--
--  **** Delete Campaign Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Delete]
GO

CREATE PROCEDURE [Campaigns_Delete]
	@CampaignID INT
AS
BEGIN
	DELETE	FROM [Campaigns]
	WHERE	[CampaignID] = @CampaignID;
END;

GO

--
--  **** Get Campiagn Record by CampaignID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Get_CID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Get_CID]
GO

CREATE PROCEDURE [Campaigns_Get_CID]
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
--
--  **** Get Campaign Record by BusinessID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Get_BID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Get_BID]
GO

CREATE PROCEDURE [Campaigns_Get_BID]
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
--
--  **** Get Campaign Records that have status 
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Get_Status') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Get_Status]
GO

CREATE PROCEDURE [Campaigns_Get_Status]
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

--
--  **** Get Campaign Records by BusinessID that have status 
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_Get_BIDStatus') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_Get_BIDStatus]
GO

CREATE PROCEDURE [Campaigns_Get_BIDStatus]
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
--
--  **** Get Campaign Records (All) by Start Date
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_GetAll_ByStart') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_GetAll_ByStart]
GO

CREATE PROCEDURE [Campaigns_GetAll_ByStart]
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
--
--  **** Get Campaign Records (All) by Title
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_GetAll_ByTitle') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_GetAll_ByTitle]
GO

CREATE PROCEDURE [Campaigns_GetAll_ByTitle]
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
--
--  **** Get Campaign Records (All) (default CampaignID order)
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_GetAll]
GO

CREATE PROCEDURE [Campaigns_GetAll]
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
--
--  **** Get Campaign Records (All) with merged datea
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Campaigns_GetAllInfo') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Campaigns_GetAllInfo]
GO

CREATE PROCEDURE [Campaigns_GetAllInfo]
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