USE [ApplicationDataStore]
GO


ALTER TABLE CreditChecks ADD CreditRequestToken UNIQUEIDENTIFIER NULL
GO

DECLARE @creditRequest VARCHAR(MAX), @creditRequestToken UNIQUEIDENTIFIER, @guid UNIQUEIDENTIFIER;

DECLARE CreditChecksMigrationCursor CURSOR
FOR SELECT CreditRequest, CreditRequestToken FROM CreditChecks
FOR UPDATE OF CreditRequestToken

OPEN CreditChecksMigrationCursor
FETCH NEXT FROM CreditChecksMigrationCursor
INTO @creditRequest, @creditRequestToken

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO [SecureDataStore].dbo.SecureComplexes (SecureData, SecureTypeId)
	SELECT @creditRequest, 5

	UPDATE CreditChecks
	SET CreditRequestToken = NEWID()
	WHERE CURRENT OF CreditChecksMigrationCursor

	FETCH NEXT FROM CreditChecksMigrationCursor
	INTO @creditRequest, @creditRequestToken
END

ALTER TABLE CreditChecks ALTER COLUMN CreditRequestToken UNIQUEIDENTIFIER NOT NULL

ALTER TABLE CreditChecks DROP COLUMN CreditRequest
