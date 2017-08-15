USE SecureDataStore;
GO

IF(OBJECT_ID('InsertCreditCheck')) is NOT NULL
    DROP PROCEDURE InsertCreditCheck
GO

CREATE PROCEDURE InsertCreditCheck
   @Name NVARCHAR(50),
   @CreditRequest NVARCHAR(MAX)
AS
BEGIN
	-- Create local variable
    DECLARE @CreditRequestToken BIGINT

	EXEC SecureDataStore.dbo.CreateComplexTokenIfNotExists @CreditRequest, 4, @CreditRequestToken OUTPUT

	EXEC ApplicationDataStore.dbo.InsertCreditCheckToken @Name, @CreditRequestToken

END
GO

--EXEC InsertCreditCheck 'Alex', '{"CreditRequest": {"firstname": "Alex","lastname": "Carlton","ssn": "555555555","dob": "1987-06-15"}}'
