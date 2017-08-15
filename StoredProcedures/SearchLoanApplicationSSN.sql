USE ApplicationDataStore;
GO

IF(OBJECT_ID('SearchLoanApplication')) is NOT NULL
    DROP PROCEDURE SearchLoanApplication
GO

CREATE PROCEDURE SearchLoanApplication
   @SSNToken BIGINT
AS

	SELECT LA.[Name], LA.[DOB Token]
	FROM ApplicationDataStore.dbo.LoanApplication AS LA
	WHERE LA.[SSN Token] = @SSNToken

GO
