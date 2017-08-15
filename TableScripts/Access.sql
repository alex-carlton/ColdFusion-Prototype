USE SecureDataStore
IF EXISTS(SELECT * FROM sys.database_principals WHERE name = 'SecureSA')
	BEGIN
		DROP USER SecureSA
	END
GO

USE ApplicationDataStore
IF EXISTS(SELECT * FROM sys.database_principals WHERE name = 'AppSA')
	BEGIN
		DROP USER AppSA
	END
GO

IF EXISTS(SELECT * FROM sys.database_principals WHERE name = 'SecureSA')
	BEGIN
		DROP USER SecureSA
	END
GO


USE SecureDataStore

IF EXISTS(SELECT * FROM sys.database_principals WHERE name = 'SecureSA')
	BEGIN
		DROP LOGIN SecureSA
	END

CREATE LOGIN [SecureSA] 
	WITH PASSWORD = 'DprSecure123$'
	, DEFAULT_DATABASE=[SecureDataStore]
	, DEFAULT_LANGUAGE=[us_english]
	, CHECK_EXPIRATION=OFF
	, CHECK_POLICY=ON;
GO

IF EXISTS(SELECT * FROM sys.database_principals WHERE name = 'AppSA')
	BEGIN
		DROP LOGIN AppSA
	END
GO

CREATE LOGIN [AppSA] 
		WITH PASSWORD = 'DprApp123$'
		, DEFAULT_DATABASE=[ApplicationDataStore]
		, DEFAULT_LANGUAGE=[us_english]
		, CHECK_EXPIRATION=OFF
		, CHECK_POLICY=ON;
GO


-- *********************************************************************************
-- Secure Data Store Access
-- *********************************************************************************
USE [SecureDataStore]
GO 

CREATE USER [SecureSA] FOR LOGIN [SecureSA]
GO

DENY SELECT, INSERT, UPDATE, DELETE TO [SecureSA]
GRANT EXECUTE TO [SecureSA]



-- *********************************************************************************
-- Application Data Store Access
-- *********************************************************************************
USE [ApplicationDataStore]


CREATE USER [AppSA] FOR LOGIN [AppSA]

GRANT EXECUTE, SELECT, INSERT, UPDATE, DELETE TO [AppSA]
GO



IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'secure')
	BEGIN
	EXEC sp_executesql N'CREATE SCHEMA secure'
	END
GO

-- Secure Service Account Access to Application Data Store
IF EXISTS(SELECT * FROM sys.database_principals WHERE name = N'SecureSA')
	BEGIN
	DROP USER [SecureSA]
	END
GO

CREATE USER [SecureSA] FOR LOGIN [SecureSA]
GO

If NOT Exists(SELECT * FROM sys.database_principals WHERE name = N'secureSchemaProcCaller')
BEGIN
	EXEC sp_addrole 'secureSchemaProcCaller'
	EXEC sp_addrolemember 'secureSchemaProcCaller','SecureSA'
END

--GRANT CONNECT TO [SecureSA];
--GRANT EXECUTE TO [SecureSA];
DENY SELECT, INSERT, UPDATE, DELETE TO [SecureSA];
GO
GRANT EXECUTE ON SCHEMA:: secure TO [SecureSA];
GO




