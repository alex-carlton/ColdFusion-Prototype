USE SecureDataStore;
GO

IF(OBJECT_ID('InsertLoanApplication')) is NOT NULL
    DROP PROCEDURE InsertLoanApplication
GO

CREATE PROCEDURE InsertLoanApplication
   @Name NVARCHAR(50),
   @DateOfBirth DATE,
   @SSN NVARCHAR(9)
AS
BEGIN
	-- Create local variable
    DECLARE @SSNToken BIGINT
	DECLARE @DateOfBirthToken BIGINT

	EXEC SecureDataStore.dbo.CreateTextTokenIfNotExists @SSN, 1, @SSNToken OUTPUT
	EXEC SecureDataStore.dbo.CreateDateTokenIfNotExists @DateOfBirth, 2, @DateOfBirthToken OUTPUT

	EXEC ApplicationDataStore.dbo.InsertLoanApplicationTokens @Name, @DateOfBirthToken, @SSNToken

END
GO

--EXEC InsertLoanApplication 'Alex', '1987-06-15', '555555555'


