USE SecureDataStore;
GO

IF(OBJECT_ID('GetComplexValue')) is NOT NULL
    DROP PROCEDURE GetComplexValue
GO

CREATE PROCEDURE GetComplexValue
   @Key BIGINT,
   @Type INT
AS
    SELECT SC.[Data]
    FROM dbo.SecureComplex AS SC
    WHERE SC.[Key] = @Key AND SC.[Type] = @Type;
GO

--EXEC dbo.GetComplexValue 3, 4
