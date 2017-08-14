USE [master]
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
DROP DATABASE [ApplicationDataStore]
GO

/****** Object:  Database [ApplicationDataStore]    Script Date: 8/14/2017 2:35:57 PM ******/
CREATE DATABASE [ApplicationDataStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ApplicationDataStore', FILENAME = N'C:\Program Files\Microsoft SQL Server 16\MSSQL13.MSSQLSERVER01\MSSQL\DATA\ApplicationDataStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ApplicationDataStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server 16\MSSQL13.MSSQLSERVER01\MSSQL\DATA\ApplicationDataStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

-- ALTER DATABASE [ApplicationDataStore] SET COMPATIBILITY_LEVEL = 130
-- GO

-- IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
-- begin
-- EXEC [ApplicationDataStore].[dbo].[sp_fulltext_database] @action = 'enable'
-- end
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ANSI_NULL_DEFAULT OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ANSI_NULLS OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ANSI_PADDING OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ANSI_WARNINGS OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ARITHABORT OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET AUTO_CLOSE OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET AUTO_SHRINK OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET AUTO_UPDATE_STATISTICS ON 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET CURSOR_DEFAULT  GLOBAL 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET CONCAT_NULL_YIELDS_NULL OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET NUMERIC_ROUNDABORT OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET QUOTED_IDENTIFIER OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET RECURSIVE_TRIGGERS OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET  DISABLE_BROKER 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET TRUSTWORTHY OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET PARAMETERIZATION SIMPLE 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET READ_COMMITTED_SNAPSHOT OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET HONOR_BROKER_PRIORITY OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET RECOVERY FULL 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET  MULTI_USER 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET PAGE_VERIFY CHECKSUM  
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET DB_CHAINING OFF 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET DELAYED_DURABILITY = DISABLED 
-- GO

-- ALTER DATABASE [ApplicationDataStore] SET QUERY_STORE = OFF
-- GO

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