USE [ApplicationDataStore]
GO


ALTER TABLE CreditCheck_Unmigrated ADD CreditRequestToken BIGINT NULL
GO

DECLARE @creditRequest varchar(max), @creditRequestToken BIGINT;

DECLARE CreditCheckMigrationCursor CURSOR
FOR SELECT [Credit Request], CreditRequestToken FROM CreditCheck_Unmigrated
FOR UPDATE OF CreditRequestToken

OPEN CreditCheckMigrationCursor
FETCH NEXT FROM CreditCheckMigrationCursor
INTO @creditRequest, @creditRequestToken

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO [SecureDataStore].dbo.SecureComplex (Data, Type)
	SELECT @creditRequest, 5
	
	UPDATE CreditCheck_Unmigrated
	SET CreditRequestToken = SCOPE_IDENTITY()
	WHERE CURRENT OF CreditCheckMigrationCursor
	
	FETCH NEXT FROM CreditCheckMigrationCursor
	INTO @creditRequest, @creditRequestToken
END

ALTER TABLE CreditCheck_Unmigrated ALTER COLUMN CreditRequestToken BIGINT NOT NULL

ALTER TABLE CreditCheck_Unmigrated DROP COLUMN [Credit Request]