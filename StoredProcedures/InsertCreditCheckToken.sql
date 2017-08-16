USE ApplicationDataStore;
GO

IF(OBJECT_ID('InsertCreditCheckToken')) is NOT NULL
    DROP PROCEDURE InsertCreditCheckToken
GO

CREATE PROCEDURE InsertCreditCheckToken
   @Name NVARCHAR(50),
   @CreditRequestToken BIGINT
AS
BEGIN

   INSERT INTO dbo.CreditCheck([Name],[CreditRequest Token])
   VALUES (@Name, @CreditRequestToken)

END
GO
