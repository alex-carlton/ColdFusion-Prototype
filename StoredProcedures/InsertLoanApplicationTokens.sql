USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.InsertLoanApplicationTokens')) is NOT NULL
    DROP PROCEDURE secure.InsertLoanApplicationTokens
GO

CREATE PROCEDURE secure.InsertLoanApplicationTokens
   @Name NVARCHAR(50),
   @DateOfBirthToken BIGINT,
   @SSNToken BIGINT
AS
BEGIN

   INSERT INTO dbo.LoanApplication ([Name],[DOBToken],[SSNToken])
   VALUES (@Name, @DateOfBirthToken, @SSNToken )

END
GO
