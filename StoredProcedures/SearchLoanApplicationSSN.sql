USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.SearchLoanApplicationSSN')) is NOT NULL
    DROP PROCEDURE secure.SearchLoanApplicationSSN
GO

CREATE PROCEDURE secure.SearchLoanApplicationSSN
   @SSNToken BIGINT
AS

	SELECT LA.[Name], LA.DOBToken
	FROM ApplicationDataStore.dbo.LoanApplication AS LA
	WHERE LA.SSNToken = @SSNToken

GO
