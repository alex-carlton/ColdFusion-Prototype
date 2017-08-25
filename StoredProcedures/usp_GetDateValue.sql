--=======================================================================================
-- Database: SecureDataStore
-- Stored Procedure: dbo.usp_GetDateValue
--
-- Description: Returns the date value identified by the provided token.
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

IF(OBJECT_ID('usp_GetDateValue')) is NOT NULL
    DROP PROCEDURE usp_GetDateValue
GO

CREATE PROCEDURE usp_GetDateValue
   @Key UNIQUEIDENTIFIER,
   @Type INT
AS
    SELECT SD.SecureData
    FROM dbo.SecureDates AS SD
    WHERE SD.SecureDateId = @Key AND SD.SecureTypeId = @Type;
GO
