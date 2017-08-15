USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.SearchLoanApplication')) is NOT NULL
    DROP PROCEDURE secure.SearchLoanApplication
GO

CREATE PROCEDURE secure.SearchLoanApplication
   @SSNToken BIGINT
AS

	SELECT LA.[Name], LA.DOBToken
	FROM ApplicationDataStore.dbo.LoanApplication AS LA
	WHERE LA.SSNToken = @SSNToken

GO
