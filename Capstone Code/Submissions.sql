USE AMCATestDB
GO
--
--  **** Add Submission Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Add]
GO

CREATE PROCEDURE [Submissions_Add]
	@SubmissionID INT OUTPUT,
	@DateAdded DATETIME,
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
		@DateAdded,
		@CampaignID,
		@VideoID,
		@ArtistID
	);

	SET @SubmissionID = SCOPE_IDENTITY();
END;

GO

--
--  **** Update Submission Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Update]
GO

CREATE PROCEDURE [Submissions_Update]
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

--
--  **** Delete Submission Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Delete]
GO

CREATE PROCEDURE [Submissions_Delete]
	@SubmissionID INT
AS
BEGIN
	DELETE	FROM [Submissions]
	WHERE	[SubmissionID] = @SubmissionID;
END;

GO

--
--  **** Get Submission Record for Submission ID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Get_SID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Get_SID]
GO

CREATE PROCEDURE [Submissions_Get_SID]
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

--
--  **** Get Submission Record for Artist ID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Get_AID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Get_AID]
GO

CREATE PROCEDURE [Submissions_Get_AID]
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

--
--  **** Get Submission Record for Artist ID and Campaign
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Get_AID_CID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Get_AID_CID]
GO

CREATE PROCEDURE [Submissions_Get_AID_CID]
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


--
--  **** Get Submission Records (All) by DEFAULT of SubmissionID Order
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_GetAll]
GO

CREATE PROCEDURE [Submissions_GetAll]
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


--
--  **** Get Submission Records for Artist linked with Video and Campaign
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Get_ArtistSubmission') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Get_ArtistSubmission]
GO

CREATE PROCEDURE [Submissions_Get_ArtistSubmission]
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

--
--  **** Get Submission Records for Campaignt linked with Video and Campaign
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Submissions_Get_CampaignSubmissions') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Submissions_Get_CampaignSubmissions]
GO

CREATE PROCEDURE [Submissions_Get_CampaignSubmissions]
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