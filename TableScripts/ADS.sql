USE [master]
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
USE [master]
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ApplicationDataStore')
DROP DATABASE [ApplicationDataStore]
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
CREATE DATABASE [ApplicationDataStore]
GO



USE [ApplicationDataStore]
GO

-- ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
-- GO

-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET  READ_WRITE 
-- GO



-- *********************************************************************************
-- Create unmigrated loan application table for proto etl
-- *********************************************************************************

CREATE TABLE [dbo].[LoanApplication_Unmigrated](
	[Id] [bigint] NOT NULL,
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
	[Id] [bigint] NOT NULL,
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
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit Report] [varchar](max) NOT NULL,
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
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreditCheck Token] [bigint] NOT NULL,
 CONSTRAINT [PK_CreditCheck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




USE [master]