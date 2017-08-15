USE SecureDataStore;
GO

IF(OBJECT_ID('CreateTextTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateTextTokenIfNotExists
GO

CREATE PROCEDURE CreateTextTokenIfNotExists
   @TextValue VARCHAR(100),
   @Type INT,
   @TextToken BIGINT OUTPUT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    SELECT @count = COUNT(ST.[Key])
    FROM dbo.[SecureText] AS ST
    WHERE ST.[Data] = @TextValue AND ST.[Type] = @Type

    --Conditional for Inserting
    IF(@count = 0)
        BEGIN
            INSERT INTO dbo.SecureText([Data], [Type])
            VALUES (@TextValue, @Type)
			SET @TextToken = SCOPE_IDENTITY() 
        END
    ELSE
        SELECT @TextToken = ST.[Key]
        FROM dbo.SecureText AS ST
        WHERE ST.[Data] = @TextValue;
GO

--DECLARE @out BIGINT
--EXEC dbo.CreateTextTokenIfNotExists '555555555', 1, @out OUTPUT
--SELECT @out
