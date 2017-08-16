--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_InsDateTokenIfNotExists
--
-- Description: Inserts a PII date if it does not exist, and returns a token referring to the given date.
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

IF(OBJECT_ID('usp_InsDateTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE usp_InsDateTokenIfNotExists
GO

CREATE PROCEDURE usp_InsDateTokenIfNotExists
   @DateValue DATE,
   @Type INT,
   @DateToken BIGINT OUTPUT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    SELECT @count = COUNT(SD.SecureDateId)
    FROM dbo.SecureDates AS SD
    WHERE SD.SecureData = @DateValue AND SD.SecureTypeId = @Type

    --Conditional for Inserting
    IF(@count = 0)
	BEGIN
        BEGIN TRAN
            INSERT INTO dbo.SecureDates(SecureData, SecureTypeId)
            VALUES (@DateValue, @Type)
			SET @DateToken = SCOPE_IDENTITY()

            IF (@@ERROR != 0)
			BEGIN
                ROLLBACK TRAN
                RETURN 1
			END
            ELSE
                RETURN 0

        COMMIT TRAN
	END
    ELSE
        SELECT @DateToken = SD.SecureDateId
        FROM dbo.SecureDates AS SD
        WHERE SD.SecureData = @DateValue AND SD.SecureTypeId = @Type;
GO

--DECLARE @out BIGINT
--EXEC dbo.usp_InsDateTokenIfNotExists '1987-06-15', 2, @out OUTPUT
--SELECT @out
