USE [SecureDataStore]
GO

CREATE PROCEDURE [dbo].[TestExecOnADS]
AS
BEGIN
	
	EXEC ApplicationDataStore.secure.TestSecureCallFromSDS
END
