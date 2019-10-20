USE AMCATestDB
GO
--
--  **** Add Campaign Status Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'CampaignStatus_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [CampaignStatus_Add]
GO

CREATE PROCEDURE [CampaignStatus_Add]
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
--
--  **** Update Campaign Status Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'CampaignStatus_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [CampaignStatus_Update]
GO

CREATE PROCEDURE [CampaignStatus_Update]
	@CStatusID INT,
	@CSStatusType NVARCHAR(50)
AS
BEGIN
	UPDATE	[CampaignStatus]
	SET		[CSStatusType] = @CSStatusType
	WHERE	[CStatusID] = @CStatusID;
END;

GO

--
--  **** Delete Campaign Status Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'CampaignStatus_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [CampaignStatus_Delete]
GO

CREATE PROCEDURE [CampaignStatus_Delete]
	@CStatusID INT
AS
BEGIN
	DELETE	FROM [CampaignStatus]
	WHERE	[CStatusID] = @CStatusID;
END;

GO

--
--  **** Get Campaign Status Record for StatusID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'CampaignStatus_Get') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [CampaignStatus_Get]
GO

CREATE PROCEDURE [CampaignStatus_Get]
	@CStatusID INT
AS
BEGIN
	SELECT	[CStatusID],
			[CSStatusType]
	FROM	[CampaignStatus]
	WHERE	[CStatusID] = @CStatusID;
END;

GO

--
--  **** Get Campaign Status Records (All)
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'CampaignStatus_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [CampaignStatus_GetAll]
GO

CREATE PROCEDURE [CampaignStatus_GetAll]
AS
BEGIN
	SELECT	[CStatusID],
			[CSStatusType]
	FROM	[CampaignStatus];
END;

GO
