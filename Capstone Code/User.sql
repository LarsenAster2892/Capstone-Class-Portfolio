USE AMCATestDB
GO
--
--  **** Add User Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_Add]
GO

CREATE PROCEDURE [User_Add]
	@UserID INT OUTPUT,
	@EmailAddress NVARCHAR(256),
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@NickName NVARCHAR(50),
	@Active INT,
	@DateAdded DATETIME,
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
		@DateAdded,
		@Id
	);

	SET @UserID = SCOPE_IDENTITY();
END;

GO

--
--  **** Update User Record
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_Update]
GO

CREATE PROCEDURE [User_Update]
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


--
--  **** Delete User Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_Delete]
GO

CREATE PROCEDURE [User_Delete]
	@UserID INT
AS
BEGIN
	DELETE	FROM [User]
	WHERE	[UserID] = @UserID;
END;

GO


--
--  **** Get User Record by UserID
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_Get_UID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_Get_UID]
GO

CREATE PROCEDURE [User_Get_UID]
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

--
--  **** Get User Record by ID (Identity ID)
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_Get_ID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_Get_ID]
GO

CREATE PROCEDURE [User_Get_ID]
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

--
--  **** Get User Records (All)
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'User_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [User_GetAll]
GO

CREATE PROCEDURE [User_GetAll]
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
