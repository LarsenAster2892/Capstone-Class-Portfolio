USE AMCATestDB
GO
--
--  **** Add Business Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_Add') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_Add]
GO

CREATE PROCEDURE [Business_Add]
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
--
--  **** Update Business Record
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_Update') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_Update]
GO

CREATE PROCEDURE [Business_Update]
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

--
--  **** Get Business Record for BusinessID
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_Delete') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_Delete]
GO

CREATE PROCEDURE [Business_Delete]
	@BusinessID INT
AS
BEGIN
	DELETE	FROM [Business]
	WHERE	[BusinessID] = @BusinessID;
END;

GO

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_Get_BID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_Get_BID]
GO

CREATE PROCEDURE [Business_Get_BID]
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
--
--  Get Busniess Records for UserID
--
IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_Get_UID') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_Get_UID]
GO

CREATE PROCEDURE [Business_Get_UID]
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

--
--  **** Get Business Records (All)
--

IF EXISTS(SELECT Name FROM SYS.Objects WHERE Object_ID = OBJECT_ID(N'Business_GetAll') AND TYPE IN(N'P', N'PC'))
	DROP PROCEDURE [Business_GetAll]
GO

CREATE PROCEDURE [Business_GetAll]
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
