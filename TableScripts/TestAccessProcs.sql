-- After Data Stores and Access scripts are ran. Run this script to create 4 store proces to test service account access
-- after procs are added connect to the object explorer in SSMS under the SecureSA account and attempt to run the secure data store stored procs
-- EXEC TestExecOnADS
-- EXEC TestFAIL




-- *******************************************************************
--   
-- *******************************************************************
USE [ApplicationDataStore]
GO

CREATE PROCEDURE [secure].[TestSecureCallFromSDS]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Select * FROM LoanApplication_Unmigrated
END
GO

-- *******************************************************************
--   
-- *******************************************************************
USE [ApplicationDataStore]
GO

CREATE PROCEDURE TestNoSchemaCallFromSDS

AS
BEGIN
	Select * FROM LoanApplication_Unmigrated
END
GO

-- *******************************************************************
--   
-- *******************************************************************
USE [SecureDataStore]
GO

CREATE PROCEDURE [dbo].[TestExecOnADS]
AS
BEGIN
	
	EXEC ApplicationDataStore.secure.TestSecureCallFromSDS
END
GO

-- *******************************************************************
--   
-- *******************************************************************
USE [SecureDataStore]
GO

CREATE PROCEDURE TestFAIL

AS
BEGIN
	EXEC ApplicationDataStore.dbo.TestNoSchemaCallFromSDS
END
GO