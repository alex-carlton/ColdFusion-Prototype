--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_InsCreditCheck
--
-- Description: Inserts the credit check complex PII into secure storage and inserts the non-PII data and provided token into the application database
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

IF(OBJECT_ID('usp_InsCreditCheck')) is NOT NULL
    DROP PROCEDURE usp_InsCreditCheck
GO

CREATE PROCEDURE usp_InsCreditCheck
    @Name NVARCHAR(50),
    @CreditRequest NVARCHAR(MAX)
AS
BEGIN TRAN
	-- Create local variable
    DECLARE @CreditRequestToken UNIQUEIDENTIFIER
	DECLARE @ErrorValue INT

	EXEC @ErrorValue = SecureDataStore.dbo.usp_InsComplexToken @CreditRequest, 4, @CreditRequestToken OUTPUT
	IF (@ErrorValue != 0) ROLLBACK TRAN

	EXEC @ErrorValue = ApplicationDataStore.secure.usp_InsCreditCheckToken @Name, @CreditRequestToken
	IF (@ErrorValue != 0) ROLLBACK TRAN

COMMIT TRAN

RETURN @ErrorValue
GO

--EXEC usp_InsCreditCheck 'Alex', '{"CreditRequest": {"firstname": "Alex","lastname": "Carlton","ssn": "555555555","dob": "1987-06-15"}}'
