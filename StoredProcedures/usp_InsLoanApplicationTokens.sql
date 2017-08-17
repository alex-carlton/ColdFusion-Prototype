--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: secure.usp_InsLoanApplicationTokens
--
-- Description: Inserts a loan application record including non-PII data and provided tokens into the LoanApplications table
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

USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.usp_InsLoanApplicationTokens')) is NOT NULL
    DROP PROCEDURE secure.usp_InsLoanApplicationTokens
GO

CREATE PROCEDURE secure.usp_InsLoanApplicationTokens
    @Name NVARCHAR(50),
    @DateOfBirthToken BIGINT,
    @SSNToken BIGINT
AS
BEGIN
	INSERT INTO dbo.LoanApplications (ApplicantName,DOBToken,SSNToken)
	VALUES (@Name, @DateOfBirthToken, @SSNToken )

	IF (@@ERROR != 0) RETURN 1

	RETURN 0
END
GO