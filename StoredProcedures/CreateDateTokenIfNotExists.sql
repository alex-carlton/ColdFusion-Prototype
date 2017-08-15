USE SecureDataStore;
GO

IF(OBJECT_ID('CreateDateTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateDateTokenIfNotExists
GO

CREATE PROCEDURE CreateDateTokenIfNotExists
   @DateValue DATE,
   @Type INT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    SELECT @count = COUNT(SD.[Key])
    FROM dbo.SecureDate AS SD
    WHERE SD.[Data] = @DateValue

    --Conditional for Inserting
    IF(@count = 0)
        BEGIN
            INSERT INTO dbo.SecureDate([Data], [Type])
            OUTPUT INSERTED.[Key]
            VALUES (@DateValue, @Type)
        END
    ELSE
        SELECT SD.[Key]
        FROM dbo.SecureDate AS SD
        WHERE SD.[Data] = @DateValue;
GO

--EXEC dbo.CreateDateTokenIfNotExists '20081220', 2
