USE [ApplicationDataStore]
GO
/****** Object:  StoredProcedure [secure].[TestSecureCallFromSDS]    Script Date: 8/15/2017 12:43:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [secure].[TestSecureCallFromSDS]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	Select * FROM LoanApplication_Unmigrated
END
