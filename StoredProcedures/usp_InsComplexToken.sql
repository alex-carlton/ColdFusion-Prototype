--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_InsComplexTokenIfNotExists
--
-- Description: Inserts complex PII data and returns a token to identify it.
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
-- James Aden		08/16/2017	N/A			Renamed sproc, updated to meet Clayton database standards, and removed conditional insert
--=======================================================================================

USE SecureDataStore;
GO

IF(OBJECT_ID('usp_InsComplexToken')) is NOT NULL
    DROP PROCEDURE usp_InsComplexToken
GO

CREATE PROCEDURE usp_InsComplexToken
   @ComplexValue VARCHAR(MAX),
   @Type INT,
   @ComplexToken BIGINT OUTPUT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    --SELECT @count = COUNT(SC.SecureComplexId)
    --FROM dbo.SecureComplexes AS SC
    --WHERE SC.SecureData = @ComplexValue AND SC.SecureTypeId = @Type

    --Conditional for Inserting
   -- IF(@count = 0)
   --     BEGIN
            INSERT INTO dbo.SecureComplexes(SecureData, SecureTypeId)
            VALUES (@ComplexValue, @Type)
			SET @ComplexToken = SCOPE_IDENTITY()
   --     END
   -- ELSE
        --SELECT @ComplexToken = SD.SecureComplexId
        --FROM dbo.SecureComplexes AS SD
        --WHERE SD.SecureData = @ComplexValue;
GO

--DECLARE @out BIGINT
--EXEC dbo.usp_InsComplexToken '{"CreditRequest": {"firstname": "Alex","lastname": "Carlton","ssn": "555555555","dob": "1987-06-15"}}', 4, @out OUTPUT
--SELECT @out