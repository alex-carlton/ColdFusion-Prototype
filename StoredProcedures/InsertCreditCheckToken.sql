USE ApplicationDataStore;
GO

IF(OBJECT_ID('secure.InsertCreditCheckToken')) is NOT NULL
    DROP PROCEDURE secure.InsertCreditCheckToken
GO

CREATE PROCEDURE secure.InsertCreditCheckToken
   @Name NVARCHAR(50),
   @CreditRequestToken BIGINT
AS
BEGIN

   INSERT INTO dbo.CreditCheck([Name],[CreditRequestToken])
   VALUES (@Name, @CreditRequestToken)

END
GO
