USE SecureDataStore;
GO

IF(OBJECT_ID('CreateTextTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateTextTokenIfNotExists
GO

CREATE PROCEDURE CreateTextTokenIfNotExists
   @TextValue VARCHAR(100),
   @Type INT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    SELECT @count = COUNT(ST.[Key])
    FROM dbo.[SecureText] AS ST
    WHERE ST.[Data] = @TextValue

    --Conditional for Inserting
    IF(@count = 0)
        BEGIN
            INSERT INTO dbo.SecureText([Data], [Type])
            OUTPUT INSERTED.[Key]
            VALUES (@TextValue, @Type)
        END
    ELSE
        SELECT ST.[Key]
        FROM dbo.SecureText AS ST
        WHERE ST.[Data] = @TextValue;
GO

--EXEC dbo.CreateTextTokenIfNotExists '555-55-5555', 1
