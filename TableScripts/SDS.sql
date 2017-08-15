USE [master]
GO

/****** Object:  Database [SecureDataStore]    Script Date: 8/14/2017 1:08:56 PM ******/
USE [master]
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'SecureDataStore')
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
	[Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [varchar](100) NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Type] [int] NOT NULL,
	)
GO

-- Create Pii Text indexes
CREATE UNIQUE NONCLUSTERED INDEX [dataCluster] ON [dbo].[SecureText]
(
	[Data] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[SecureText]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- *********************************************************************************
-- Create Pii Date Table
-- *********************************************************************************
CREATE TABLE [dbo].[SecureDate](
	[Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [date] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
	[Type] [int] NULL,)
GO

-- Create Pii Date indexes
CREATE UNIQUE NONCLUSTERED INDEX [dataCluster] ON [dbo].[SecureDate]
(
	[Data] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[SecureDate]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- *********************************************************************************
-- Create Pii DComplex ate Table
-- *********************************************************************************
CREATE TABLE [dbo].[SecureComplex](
	[Key] [bigint] IDENTITY(1,1) NOT NULL,
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

CREATE UNIQUE CLUSTERED INDEX [idCluster] ON [dbo].[SecureComplex]
(
	[Key] ASC
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
	,('CreditCardNumber')
	,('CreditRequest')



INSERT INTO SecureText([Data], [Type])
VALUES
	('067152444', 1)
	,('760523518', 1)
	,('364346220', 3)
	,('716650788', 1)
	,('280767466', 1)
	,('842477663', 3)
	,('100230416', 1)
	,('483884486', 1)
	,('4040123459328367', 4)



INSERT INTO SecureDate([Data], [Type])
VALUES
	('1999-06-12', 2)
	,('1989-09-25', 2)
	,('1950-08-15', 2)
	,('1940-06-20', 2)
	,('1991-06-30', 2)
	,('1987-02-28', 2)
	,('1957-03-03', 2)
	,('1977-01-30', 2)
	,('1969-05-20', 2)


INSERT INTO SecureComplex([Data], [Type])
VALUES
	 ('{"CreditRequest": {"firstname": "George","lastname": "Washington","ssn": "067152444","dob": "1932-02-22"}}', 4)
	,('{"CreditRequest": {"firstname": "Abraham","lastname": "Lincoln","ssn": "067152444","dob": "1909-02-12"}}', 4)
	,('{"CreditRequest": {"firstname": "Mark","lastname": "Twain","ssn": "067152444","dob": "1935-10-30"}}', 4)
	,('{"CreditRequest": {"firstname": "Henry","lastname": "Ford","ssn": "067152444","dob": "1963-07-30"}}', 4)
	,('{"CreditRequest": {"firstname": "Humphry","lastname": "Bogart","ssn": "067152444","dob": "1999-12-25"}}', 4)
	,('{"CreditRequest": {"firstname": "Elvis","lastname": "Presley","ssn": "067152444","dob": "1935-01-08"}}', 4)








USE [master]