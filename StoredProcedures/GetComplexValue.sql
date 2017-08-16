--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_GetComplexValue
--
-- Description: Returns the complex value identified by the provided token.
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

IF(OBJECT_ID('usp_GetComplexValue')) is NOT NULL
    DROP PROCEDURE usp_GetComplexValue
GO

CREATE PROCEDURE usp_GetComplexValue
   @Key BIGINT,
   @Type INT
AS
    SELECT SC.SecureData
    FROM dbo.SecureComplexes AS SC
    WHERE SC.SecureComplexId = @Key AND SC.SecureTypeId = @Type;
GO

--EXEC dbo.usp_GetComplexValue 3, 4
