USE ApplicationDataStore;
GO

IF(OBJECT_ID('InsertLoanApplicationTokens')) is NOT NULL
    DROP PROCEDURE InsertLoanApplicationTokens
GO

CREATE PROCEDURE InsertLoanApplicationTokens
   @Name NVARCHAR(50),
   @DateOfBirthToken BIGINT,
   @SSNToken BIGINT
AS
BEGIN

   INSERT INTO dbo.LoanApplication ([Name],[DOB Token],[SSN Token])
   VALUES (@Name, @DateOfBirthToken, @SSNToken )

END
GO
