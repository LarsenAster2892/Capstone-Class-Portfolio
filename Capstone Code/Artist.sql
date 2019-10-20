USE AMCATestDB
GO

--
--  **** Add Artist Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_Add]
GO

CREATE PROCEDURE [Artist_Add]
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


--
--  **** Update Artist Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_Update]
GO

CREATE PROCEDURE [Artist_Update]
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

--
--  **** Delete Artist Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_Delete]
GO

CREATE PROCEDURE [Artist_Delete]
	@ArtistID INT
AS
BEGIN
	DELETE	FROM [Artist]
	WHERE	[ArtistID] = @ArtistID;
END;

GO

--
--  **** Get Artist Record by ArtistID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_Get_AID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_Get_AID]
GO

CREATE PROCEDURE [Artist_Get_AID]
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

--
--  **** Get Artist Record by UserID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_Get_UID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_Get_UID]
GO

CREATE PROCEDURE [Artist_Get_UID]
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

--
--  **** Get Artist Records (All)
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Artist_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Artist_GetAll]
GO

CREATE PROCEDURE [Artist_GetAll]
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
