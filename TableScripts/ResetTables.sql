

IF EXISTS(SELECT * FROM sys.databases WHERE name = N'ApplicationDataStore')
	BEGIN
		USE ApplicationDataStore
		IF EXISTS(SELECT * FROM sys.database_principals WHERE [name] = N'SecureSA')
			BEGIN
			DROP USER SecureSA
			END

		

		IF EXISTS(SELECT * FROM sys.database_principals WHERE [name] = N'AppSA')
			BEGIN
			DROP USER AppSA
			END
			


		USE [master]
		DROP DATABASE ApplicationDataStore
	END
	GO

IF EXISTS(SELECT * FROM sys.databases WHERE name = N'SecureDataStore')
	BEGIN
		USE SecureDataStore
		IF EXISTS(SELECT * FROM sys.database_principals WHERE [name] = N'SecureSA')
			BEGIN
			DROP USER SecureSA
			END

		USE [master]
		DROP DATABASE SecureDataStore
	END	
	GO

USE [master]

IF EXISTS(SELECT * FROM master..syslogins WHERE name = 'SecureSA')
	BEGIN
		DROP LOGIN SecureSA
	END

IF EXISTS(SELECT * FROM master..syslogins WHERE name = 'AppSA')
	BEGIN
		DROP LOGIN AppSA
	END
