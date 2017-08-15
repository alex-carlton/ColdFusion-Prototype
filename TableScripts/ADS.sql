USE [master]
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
USE [master]
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ApplicationDataStore')
BEGIN
	ALTER DATABASE [ApplicationDataStore]
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE
	DROP DATABASE [ApplicationDataStore]
END
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
CREATE DATABASE [ApplicationDataStore]
GO

USE [ApplicationDataStore]
GO



-- *********************************************************************************
-- Create unmigrated loan application table for proto etl
-- *********************************************************************************

CREATE TABLE [dbo].[LoanApplication_Unmigrated](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[SSN] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_LoanApplication_Unmigrated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



-- *********************************************************************************
-- Create loan application table for proto
-- *********************************************************************************
CREATE TABLE [dbo].[LoanApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DOB Token] [bigint] NOT NULL,
	[SSN Token] [bigint] NOT NULL,
 CONSTRAINT [PK_LoanApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



-- *********************************************************************************
-- Create unmigrated credit check table for proto etl
-- *********************************************************************************

CREATE TABLE [dbo].[CreditCheck_Unmigrated](
	[Id] [bigint] IDENTITY(1,1)  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit Request] [varchar](max) NOT NULL,
 CONSTRAINT [PK_CreditCheck_Unmigrated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- *********************************************************************************
-- Create credit check table for proto
-- *********************************************************************************
CREATE TABLE [dbo].[CreditCheck](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreditRequest Token] [bigint] NOT NULL,
 CONSTRAINT [PK_CreditCheck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO








-- *********************************************************************************
-- SEED DATA
-- *********************************************************************************
INSERT INTO [dbo].[CreditCheck_Unmigrated]([Name], [Credit Request])
VALUES 
	('Washington, George', '{"CreditRequest": {"firstname": "George","lastname": "Washington","ssn": "067152444","dob": "1932-02-22"}}')
	,('Lincoln, Abraham', '{"CreditRequest": {"firstname": "Abraham","lastname": "Lincoln","ssn": "760523518","dob": "1909-02-12"}}')
	,('Twain, Mark', '{"CreditRequest": {"firstname": "Mark","lastname": "Twain","ssn": "716650788","dob": "1935-10-30"}}')
	,('Ford, Henry', '{"CreditRequest": {"firstname": "Henry","lastname": "Ford","ssn": "280767466","dob": "1963-07-30"}}')
	,('Bogart, Humphrey', '{"CreditRequest": {"firstname": "Humphrey","lastname": "Bogart","ssn": "100230416","dob": "1999-12-25"}}')
	,('Presley, Elvis', '{"CreditRequest": {"firstname": "Elvis","lastname": "Presley","ssn": "483884486","dob": "1935-01-08"}}')


INSERT INTO [dbo].[LoanApplication_Unmigrated]([Name], DOB, SSN)
VALUES 
	('Washington, George', '1932-02-22', '067152444')
	,('Lincoln, Abraham', '1909-02-12', '760523518')
	,('Twain, Mark', '1935-10-30', '716650788')
	,('Ford, Henry', '1963-07-30', '280767466')
	,('Bogart, Humphrey', '1999-12-25', '100230416')
	,('Presley, Elvis', '1935-01-08', '483884486')
	,('Silva, Ynes','1998-10-25','286364401')
	,('Sanders, Ediva','1949-10-22','265123441')
	,('Tucker, Maryrose','1970-11-10','255162278')
	,('Hatfield, Mindy','1998-5-27','302252330')
	,('Kennedy, Kari','1942-8-29','365024533')
	,('Aguirre, Brigid','1942-4-3','732843676')
	,('Stout, Cora','1986-9-5','027751244')
	,('Peters, Deirdre','1988-8-30','524365408')
	,('Pugh, Lyda','1965-3-10','037582158')
	,('Christensen, Corry','1998-6-3','676105414')
	,('Schroeder, Valentine','1996-10-1','686271287')
	,('Ball, Marie','1935-3-27','038372161')
	,('Torres, Minetta','1997-6-17','755577341')
	,('Garcia, Sherry','1996-6-19','142124546')
	,('Burke, Cynthea','1960-7-26','007151718')
	,('Vazquez, Ricca','1969-2-9','450874543')
	,('Daugherty, Aggie','1944-3-11','084674721')
	,('Strong, Amy','1970-9-24','827067608')
	,('Grant, Tabbie','1982-11-19','366277467')
	,('Good, Rafa','1947-6-20','603432151')
	,('Mcconnell, Cass','1945-7-4','426570601')
	,('Burgess, Jodie','1973-8-25','222136461')
	,('Fischer, Maryrose','1969-10-20','405023036')
	,('Mcneil, Rozele','1978-9-5','652834265')
	,('Booker, Melinda','1982-7-15','205004856')
	,('Bean, Brittni','1939-1-23','467652045')
	,('Morris, Leonore','1961-2-21','442657083')
	,('Ruiz, Diannne','1983-1-5','702270365')
	,('English, Eden','1962-6-22','640341816')
	,('Casey, Frieda','1967-10-17','110700338')

USE [master]