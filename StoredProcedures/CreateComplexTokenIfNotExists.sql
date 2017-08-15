USE SecureDataStore;
GO

IF(OBJECT_ID('CreateComplexTokenIfNotExists')) is NOT NULL
    DROP PROCEDURE CreateComplexTokenIfNotExists
GO

CREATE PROCEDURE CreateComplexTokenIfNotExists
   @ComplexValue VARCHAR(MAX),
   @Type INT,
   @ComplexToken BIGINT OUTPUT
AS
    -- Create local variable
    DECLARE @count INT

    --Check to see if there is any value in the table for the provided input.
    SELECT @count = COUNT(SC.[Key])
    FROM dbo.SecureComplex AS SC
    WHERE SC.[Data] = @ComplexValue AND SC.[Type] = @Type

    --Conditional for Inserting
    IF(@count = 0)
        BEGIN
            INSERT INTO dbo.SecureComplex([Data], [Type])
            VALUES (@ComplexValue, @Type)
			SET @ComplexToken = SCOPE_IDENTITY()
        END
    ELSE
        SELECT @ComplexToken = SD.[Key]
        FROM dbo.SecureComplex AS SD
        WHERE SD.[Data] = @ComplexValue;
GO

--DECLARE @out BIGINT
--EXEC dbo.CreateComplexTokenIfNotExists '{"CreditRequest": {"firstname": "Alex","lastname": "Carlton","ssn": "555555555","dob": "1987-06-15"}}', 4, @out OUTPUT
--SELECT @out