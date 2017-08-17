--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_InsTextTokenIfNotExists
--
-- Description: Inserts PII text if it does not exist, and returns a token referring to the given text.
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

IF(OBJECT_ID('usp_InsTextTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE usp_InsTextTokenIfNotExists
GO

CREATE PROCEDURE usp_InsTextTokenIfNotExists
   @TextValue VARCHAR(100),
   @Type INT,
   @TextToken BIGINT OUTPUT
AS
BEGIN
    SELECT @TextToken = ST.SecureTextId
    FROM dbo.SecureTexts AS ST
    WHERE ST.SecureData = @TextValue AND ST.SecureTypeId = @Type

    --Conditional for Inserting
    IF(@TextToken IS NULL)
		BEGIN
			INSERT INTO dbo.SecureTexts(SecureData, SecureTypeId)
			VALUES (@TextValue, @Type)
			SET @TextToken = SCOPE_IDENTITY()

			IF (@@ERROR != 0) RETURN 1
		END
    ELSE
        
	IF (@@ERROR != 0) RETURN 1

	RETURN 0
END
GO

--DECLARE @out BIGINT
--EXEC dbo.usp_InsTextTokenIfNotExists '553594555', 1, @out OUTPUT
--SELECT @out
