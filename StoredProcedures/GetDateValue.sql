USE SecureDataStore;
GO

IF(OBJECT_ID('GetDateValue')) is NOT NULL
    DROP PROCEDURE GetDateValue
GO

CREATE PROCEDURE GetDateValue
   @Key BIGINT,
   @Type INT
AS
    SELECT SD.[Data]
    FROM dbo.SecureDate AS SD
    WHERE SD.[Key] = @Key AND SD.[Type] = @Type;
GO

--EXEC dbo.GetDateValue 8, 2
