USE SecureDataStore;
GO

IF(OBJECT_ID('CreateDateTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateDateTokenIfNotExists
GO

CREATE PROCEDURE CreateDateTokenIfNotExists
   @DateValue DATE,
   @Type INT,
   @DateToken BIGINT OUTPUT
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
            VALUES (@DateValue, @Type)
			SET @DateToken = SCOPE_IDENTITY()
        END
    ELSE
        SELECT @DateToken = SD.[Key]
        FROM dbo.SecureDate AS SD
        WHERE SD.[Data] = @DateValue;

	select @DateToken
GO

-- Create out variable
DECLARE @out BIGINT
EXEC dbo.CreateDateTokenIfNotExists '1987-06-15', 2, @out
SELECT @out
