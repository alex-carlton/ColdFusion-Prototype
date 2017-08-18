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
   @DateToken UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SELECT @DateToken = SD.SecureDateId
    FROM dbo.SecureDates AS SD
    WHERE SD.SecureData = @DateValue AND SD.SecureTypeId = @Type;

    --Conditional for Inserting
    IF(@DateToken IS NULL)
		BEGIN
			INSERT INTO dbo.SecureDates(SecureData, SecureTypeId)
			VALUES (@DateValue, @Type)
			SET @DateToken = NEWID()

			IF (@@ERROR != 0) RETURN 1
		END
    ELSE

	IF (@@ERROR != 0) RETURN 1

	RETURN 0
END
GO

--DECLARE @out UNIQUEIDENTIFIER
--EXEC dbo.usp_InsDateTokenIfNotExists '1985-08-07', 2, @out OUTPUT
--SELECT @out
