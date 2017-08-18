--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_GetTextValue
--
-- Description: Returns the text value identified by the provided token.
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

IF(OBJECT_ID('usp_GetTextValue')) is NOT NULL
    DROP PROCEDURE usp_GetTextValue
GO

CREATE PROCEDURE usp_GetTextValue
   @Key UNIQUEIDENTIFIER,
   @Type INT
AS
    SELECT ST.SecureData
    FROM dbo.SecureTexts AS ST
    WHERE ST.SecureTextId = @Key AND ST.SecureTypeId = @Type;
GO

--EXEC dbo.usp_GetTextValue 10, 1
