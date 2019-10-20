USE AMCATestDB
GO
--
--  **** Add Video Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Add]
GO

CREATE PROCEDURE [Videos_Add]
	@VideoID INT OUTPUT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(MAX),
	@DateAdded DATETIME,
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
		@DateAdded,
		@YouTubeLink,
		@ArtistID
	);

	SET @VideoID = SCOPE_IDENTITY();
END;

GO

--
--  **** Update Video Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Update]
GO

CREATE PROCEDURE [Videos_Update]
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

--
--  **** Delete Video Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Delete]
GO

CREATE PROCEDURE [Videos_Delete]
	@VideoID INT
AS
BEGIN
	DELETE	FROM [Videos]
	WHERE	[VideoID] = @VideoID;
END;

GO
--
--  **** Get Video Record for VideoID
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Get_VID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Get_VID]
GO

CREATE PROCEDURE [Videos_Get_VID]
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

--
--  **** Get Video Record for ArtistID
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Get_AID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Get_AID]
GO

CREATE PROCEDURE [Videos_Get_AID]
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


--
--  **** Get Video Record for ArtistID and VideoID
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_Get_AIDVID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_Get_AIDVID]
GO

CREATE PROCEDURE [Videos_Get_AIDVID]
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

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Videos_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Videos_GetAll]
GO


--
--  **** Get Video Records (All)
--
CREATE PROCEDURE [Videos_GetAll]
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
