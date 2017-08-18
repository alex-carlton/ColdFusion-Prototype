--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_GetLoanApplicationBySSN
--
-- Description: Gets a loan application record by SSN token
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

IF(OBJECT_ID('usp_GetLoanApplicationBySSN')) is NOT NULL
    DROP PROCEDURE usp_GetLoanApplicationBySSN
GO

CREATE PROCEDURE usp_GetLoanApplicationBySSN
   @SSNToken BIGINT
AS
	SELECT LA.ApplicantName, LA.DOBToken
	FROM LoanApplications AS LA
	WHERE LA.SSNToken = @SSNToken
GO

-- EXEC usp_GetLoanApplicationBySSN 26
