USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.SearchLoanApplicationDOB')) is NOT NULL
    DROP PROCEDURE secure.SearchLoanApplicationDOB
GO

CREATE PROCEDURE secure.SearchLoanApplicationDOB
   @DOBToken BIGINT
AS

	SELECT LA.[Name], LA.SSNToken
	FROM ApplicationDataStore.dbo.LoanApplication AS LA
	WHERE LA.DOBToken = @DOBToken

GO
