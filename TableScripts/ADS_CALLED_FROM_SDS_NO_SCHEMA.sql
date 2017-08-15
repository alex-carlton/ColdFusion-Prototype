

USE ApplicationDataStore
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE TestNoSchemaCallFromSDS

AS
BEGIN
	Select * FROM LoanApplication_Unmigrated
END
GO
