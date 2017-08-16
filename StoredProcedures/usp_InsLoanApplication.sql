--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_InsLoanApplication
--
-- Description: Inserts a loan application's SSN and DOB PII into secure storage and inserts the non-PII data and provided tokens into the application database
--
-- Created by: Alex Carlton
-- Create date: 08/15/2017
--
-- Dependencies:
-- Added by: Date Added: Business Unit/Project #/Application/Job:
-- <developername> mm/dd/yyyy
--
-- Modification History:
-- Mod by:			Date Mod:	Mod id:		Mod description:
-- James Aden		08/16/2017	N/A			Updated to meet Clayton database standards
--=======================================================================================

USE SecureDataStore;
GO

IF(OBJECT_ID('usp_InsLoanApplication')) is NOT NULL
    DROP PROCEDURE usp_InsLoanApplication
GO

CREATE PROCEDURE usp_InsLoanApplication
   @Name NVARCHAR(50),
   @DateOfBirth DATE,
   @SSN NVARCHAR(9)
AS
BEGIN TRAN
	-- Create local variable
    DECLARE @SSNToken BIGINT
	DECLARE @DateOfBirthToken BIGINT
    DECLARE @ErrorValue INT

	EXEC @ErrorValue = SecureDataStore.dbo.usp_InsTextTokenIfNotExists @SSN, 1, @SSNToken OUTPUT
	IF (@ErrorValue != 0) ROLLBACK TRAN

	EXEC @ErrorValue = SecureDataStore.dbo.usp_InsDateTokenIfNotExists @DateOfBirth, 2, @DateOfBirthToken OUTPUT
	IF (@ErrorValue != 0) ROLLBACK TRAN

	EXEC @ErrorValue = ApplicationDataStore.secure.usp_InsLoanApplicationTokens @Name, @DateOfBirthToken, @SSNToken
	IF (@ErrorValue != 0) ROLLBACK TRAN

COMMIT TRAN

RETURN @ErrorValue
GO

--EXEC usp_InsLoanApplication 'Alex', '1987-06-15', '555555555'
