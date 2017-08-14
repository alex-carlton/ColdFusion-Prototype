USE SecureDataStore;
GO

IF(OBJECT_ID('CreateTextTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateTextTokenIfNotExists
GO

CREATE PROCEDURE CreateTextTokenIfNotExists
   @TextValue varchar(100),
   @Type varchar(50)
AS
    -- Create local variable
    DECLARE @count int

    --Check to see if there is any value in the table for the provided text input.
    SELECT @count = COUNT(PT.Id)
    FROM dbo.PiiText AS PT
    WHERE pt.[Data] = @TextValue

    --Conditional for Inserting
    IF(@count = 0)
        BEGIN
            INSERT INTO dbo.PiiText ([Data], [TimeStamp], [Type])
            OUTPUT INSERTED.Id
            VALUES (@TextValue, default, @Type)
        END
    ELSE
        SELECT PT.Id
        FROM dbo.PiiText AS PT
        WHERE pt.[Data] = @TextValue;
GO

--EXEC dbo.CreateTextTokenIfNotExists '555-55-5555', 'ssn'
