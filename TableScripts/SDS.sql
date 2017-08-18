--=======================================================================================
-- Database: SecureDataStore
--
-- Description: Secure data store is a seperate secure data base for storing sperated out PII
--				data. Each PII data that is stored will have a unique key that it corresponds with.
--				These unique keys will also be stored in the application databases. When the application 
--				needs to READ PII, it will retreive the unqiue key from the application's other databases
--				then READ the PII with the SecureKey.
--
--				This prototype script is to Drop and Recreate the Prototype SDS with seed data.			
--
-- Created by: Kullen Williams
-- Create date: 08/16/2017
--
-- Dependencies:
-- Added by: Date Added: Business Unit/Project #/Application/Job:
--
-- Modification History:
-- Mod by: Date Mod: Mod id: Mod description:

--=======================================================================================


USE [master]
GO

/****** Object:  Database [SecureDataStore]    Script Date: 8/14/2017 1:08:56 PM ******/
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'SecureDataStore')
BEGIN
	ALTER DATABASE SecureDataStore
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE
	DROP DATABASE SecureDataStore
END
GO

/****** Object:  Database [SecureDataStore]    Script Date: 8/14/2017 1:08:56 PM ******/
CREATE DATABASE SecureDataStore
GO

USE SecureDataStore
GO

-- *********************************************************************************
-- Create Secure Types Lookup Table
-- *********************************************************************************
CREATE TABLE dbo.SecureTypes
(
	SecureTypeId [int] IDENTITY(1,1) NOT NULL,
	SecureTypeName [varchar](100) NOT NULL,
	CONSTRAINT PK_SecureTypes_SecureTypeId PRIMARY KEY CLUSTERED (SecureTypeId)
); 
GO



-- *********************************************************************************
-- Create Secure Text Table
-- *********************************************************************************
CREATE TABLE dbo.SecureTexts
(
	SecureTextId [bigint] IDENTITY(1,1) NOT NULL,
	SecureData [varchar](100) NOT NULL,
	InsertTimeStamp [datetimeoffset] NOT NULL DEFAULT SYSDATETIMEOFFSET(),
	SecureTypeId [int] NOT NULL,
	CONSTRAINT PK_SecureTexts_SecureTextId PRIMARY KEY CLUSTERED (SecureTextId),
	CONSTRAINT FK_SecureTexts_SecureTypeId_SecureTypes FOREIGN KEY (SecureTypeId)
		REFERENCES SecureTypes(SecureTypeId)
)
GO



-- Create Secure Text indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_U_SecureTexts_SecureTypeId_SecureData ON dbo.SecureTexts
(
	SecureTypeId ASC,
	SecureData ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- *********************************************************************************
-- Create Secure Date Table
-- *********************************************************************************
CREATE TABLE dbo.SecureDates
(
	SecureDateId [bigint] IDENTITY(1,1) NOT NULL,
	SecureData [date] NOT NULL,
	InsertTimeStamp [datetimeoffset] NOT NULL DEFAULT SYSDATETIMEOFFSET(),
	SecureTypeId [int] NULL,
	CONSTRAINT PK_SecureDates_SecureDateId PRIMARY KEY CLUSTERED (SecureDateId),
	CONSTRAINT FK_SecureDates_SecureTypeId_SecureTypes FOREIGN KEY (SecureTypeId)
		REFERENCES SecureTypes(SecureTypeId)
);
GO
-- Create Secure Date indexes
CREATE UNIQUE NONCLUSTERED INDEX IX_U_SecureDates_SecureTypeId_SecureData ON dbo.SecureDates
(
	SecureTypeId ASC,
	SecureData ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



-- *********************************************************************************
-- Create Secure DComplex ate Table
-- *********************************************************************************
CREATE TABLE dbo.SecureComplexes
(
	SecureComplexId [bigint] IDENTITY(1,1) NOT NULL,
	SecureData [varchar](max) NOT NULL,
	InsertTimeStamp [datetimeoffset] NOT NULL DEFAULT SYSDATETIMEOFFSET(),
	SecureTypeId [int] NULL,
	CONSTRAINT PK_SecureComplexes_SecureComplexId PRIMARY KEY CLUSTERED (SecureComplexId),
	CONSTRAINT FK_SecureComplexes_SecureTypeId_SecureTypes FOREIGN KEY (SecureTypeId)
		REFERENCES SecureTypes(SecureTypeId)
);
GO


INSERT INTO SecureTypes(SecureTypeName)
Values
	('SSN')
	,('DOB')
	,('DriversLicense')
	,('CreditCardNumber')
	,('CreditRequest')



INSERT INTO SecureTexts(SecureData, SecureTypeId)
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



INSERT INTO SecureDates(SecureData, SecureTypeId)
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


INSERT INTO SecureComplexes(SecureData, SecureTypeId)
VALUES
	 ('{"CreditRequest": {"firstname": "George","lastname": "Washington","ssn": "067152444","dob": "1932-02-22"}}', 4)
	,('{"CreditRequest": {"firstname": "Abraham","lastname": "Lincoln","ssn": "067152444","dob": "1909-02-12"}}', 4)
	,('{"CreditRequest": {"firstname": "Mark","lastname": "Twain","ssn": "067152444","dob": "1935-10-30"}}', 4)
	,('{"CreditRequest": {"firstname": "Henry","lastname": "Ford","ssn": "067152444","dob": "1963-07-30"}}', 4)
	,('{"CreditRequest": {"firstname": "Humphry","lastname": "Bogart","ssn": "067152444","dob": "1999-12-25"}}', 4)
	,('{"CreditRequest": {"firstname": "Elvis","lastname": "Presley","ssn": "067152444","dob": "1935-01-08"}}', 4)





USE [master]