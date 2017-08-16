--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_GetLoanApplicationByDOB
--
-- Description: Gets a loan application record by DOB token
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

IF(OBJECT_ID('usp_GetLoanApplicationByDOB')) is NOT NULL
    DROP PROCEDURE usp_GetLoanApplicationByDOB
GO

CREATE PROCEDURE usp_GetLoanApplicationByDOB
   @DOBToken BIGINT
AS

	SELECT LA.ApplicantName, LA.SSNToken
	FROM LoanApplications AS LA
	WHERE LA.DOBToken = @DOBToken

GO

-- EXEC usp_GetLoanApplicationDOB 46