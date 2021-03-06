--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: secure.usp_InsCreditCheckToken
--
-- Description: Inserts a credit check record including non-PII data and provided token into the CreditChecks table
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

IF(OBJECT_ID('secure.usp_InsCreditCheckToken')) is NOT NULL
    DROP PROCEDURE secure.usp_InsCreditCheckToken
GO

CREATE PROCEDURE secure.usp_InsCreditCheckToken
    @Name NVARCHAR(50),
    @CreditRequestToken UNIQUEIDENTIFIER
AS
BEGIN
	INSERT INTO dbo.CreditChecks(ApplicantName,CreditRequestToken)
	VALUES (@Name, @CreditRequestToken)

	IF (@@ERROR != 0) RETURN 1

	RETURN 0
END
GO
