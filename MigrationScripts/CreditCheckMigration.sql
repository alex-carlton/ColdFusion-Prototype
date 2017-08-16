USE [ApplicationDataStore]
GO


ALTER TABLE CreditChecks_Unmigrated ADD CreditRequestToken BIGINT NULL
GO

DECLARE @creditRequest varchar(max), @creditRequestToken BIGINT;

DECLARE CreditChecksMigrationCursor CURSOR
FOR SELECT CreditRequest, CreditRequestToken FROM CreditChecks_Unmigrated
FOR UPDATE OF CreditRequestToken

OPEN CreditChecksMigrationCursor
FETCH NEXT FROM CreditChecksMigrationCursor
INTO @creditRequest, @creditRequestToken

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO [SecureDataStore].dbo.SecureComplexes (SecureData, SecureTypeId)
	SELECT @creditRequest, 5
	
	UPDATE CreditChecks_Unmigrated
	SET CreditRequestToken = SCOPE_IDENTITY()
	WHERE CURRENT OF CreditChecksMigrationCursor
	
	FETCH NEXT FROM CreditChecksMigrationCursor
	INTO @creditRequest, @creditRequestToken
END

ALTER TABLE CreditChecks_Unmigrated ALTER COLUMN CreditRequestToken BIGINT NOT NULL

ALTER TABLE CreditChecks_Unmigrated DROP COLUMN CreditRequest