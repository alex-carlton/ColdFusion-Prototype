USE [master]
GO

/****** Object:  Database [SecureDataStore]    Script Date: 8/14/2017 1:08:56 PM ******/
USE [master]
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ApplicationDataStore')
DROP DATABASE [SecureDataStore]
GO

/****** Object:  Database [SecureDataStore]    Script Date: 8/14/2017 1:08:56 PM ******/
CREATE DATABASE [SecureDataStore]
GO



 USE [SecureDataStore]
 GO



-- *********************************************************************************
-- Create Pii Text Table
-- *********************************************************************************
CREATE TABLE [dbo].[SecureText](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [varchar](100) NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Type] [int] NOT NULL,)
GO

-- Create Pii Text indexes
CREATE UNIQUE NONCLUSTERED INDEX [dataCluster] ON [dbo].[PiiText]
(
	[Data] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[PiiText]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- *********************************************************************************
-- Create Pii Date Table
-- *********************************************************************************
CREATE TABLE [dbo].[SecureDate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [date] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Type] [int] NULL,)
GO

-- Create Pii Date indexes
CREATE UNIQUE NONCLUSTERED INDEX [dataCluster] ON [dbo].[PiiDate]
(
	[Data] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[PiiDate]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- *********************************************************************************
-- Create Pii DComplex ate Table
-- *********************************************************************************
CREATE TABLE [dbo].[SecureComplex](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [varchar](max) NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Type] [int] NULL,)
GO

-- -- Create Pii Date indexes
-- CREATE UNIQUE NONCLUSTERED INDEX [dataCluster] ON [dbo].[PiiComplex]
-- (
-- 	[Data] ASC,
-- 	[Type] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
-- GO

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[PiiComplex]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


CREATE TABLE [dbo].[PiiType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	CONSTRAINT [PK_C\PiiType] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO


INSERT INTO PiiType([Name])
Values
	('SSN')
	,('DOB')
	,('DriversLicense')
	,('DriversLicense')
	,('CreditCardNumber')



USE [master]